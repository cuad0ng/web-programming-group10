package project.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import project.data.CategoryDAO;
import project.data.ProductDAO;
import project.model.Category;
import project.model.Product;

/**
 * Servlet implementation class ManageProduct
 */
@WebServlet("/manageProduct")
public class ManageProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDao;
	private CategoryDAO categoryDao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManageProductServlet() {
		productDao = new ProductDAO();
		categoryDao = new CategoryDAO();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Product> products = productDao.getAll();
		List<Category> categories = categoryDao.getAll();
		request.setAttribute("products", products);
		request.setAttribute("categories", categories);

		String action = request.getParameter("action");
		if (action == null) {
			action = "home";
		}

		switch (action) {

		case "deleteProduct":
			int productId = Integer.parseInt(request.getParameter("pid"));
			productDao.delete(productId);
			response.sendRedirect("manageProduct");
			break;
		case "addProduct":
			String filename = "";
			HashMap<String, String> fields = new HashMap<>();
			try {
				// Create a factory for disk-based file items
				DiskFileItemFactory factory = new DiskFileItemFactory();

				// Configure a repository (to ensure a secure temp location is used)
				ServletContext servletContext = this.getServletConfig().getServletContext();
				File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
				factory.setRepository(repository);

				// Create a new file upload handler
				ServletFileUpload upload = new ServletFileUpload(factory);

				// Parse the request
				List<FileItem> items = upload.parseRequest(request);

				// Process the uploaded items
				Iterator<FileItem> iter = items.iterator();
				while (iter.hasNext()) {
					FileItem item = iter.next();

					if (item.isFormField()) {
						fields.put(item.getFieldName(), item.getString());
						String name1 = item.getFieldName();
						String value = item.getString();
						System.out.println("name: " + name1);
						System.out.println("value: " + value);
					} else {
						filename = item.getName();
						System.out.println("filename: " + filename);
						if (filename == null || filename.equals("")) {
							break;
						} else {
							Path path = Paths.get(filename);
							String storePath = servletContext.getRealPath("/uploads");
							File uploadFile = new File(storePath + "/" + path.getFileName());
							item.write(uploadFile);
							System.out.println(storePath + "/" + path.getFileName());
						}
					}
				}

				String name = fields.get("name");

				String image = filename;
				String price = fields.get("price");
				String quantity = fields.get("quantity");
				String description = fields.get("description");
				String category_id = fields.get("category_id");

				Category category = categoryDao.getCategory(Integer.parseInt(category_id));
				Product product = new Product();
				product.setDescription(description);
				product.setImage(image);
				product.setName(name);
				product.setPrice(Double.parseDouble(price));
				product.setQuantity(Integer.parseInt(quantity));
				product.setCategory(category);
				productDao.save(product);
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("manageProduct");
			break;
		case "edit":
			int id = Integer.parseInt(request.getParameter("pid"));
			Product product = productDao.getProduct(id);

			request.setAttribute("product", product);

			request.getRequestDispatcher("project/admin-product-edit.jsp").forward(request, response);
			break;
		case "editProduct":
			String filename1 = "";
			HashMap<String, String> fields1 = new HashMap<>();
			try {
				// Create a factory for disk-based file items
				DiskFileItemFactory factory = new DiskFileItemFactory();

				// Configure a repository (to ensure a secure temp location is used)
				ServletContext servletContext = this.getServletConfig().getServletContext();
				File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
				factory.setRepository(repository);

				// Create a new file upload handler
				ServletFileUpload upload = new ServletFileUpload(factory);

				// Parse the request
				List<FileItem> items = upload.parseRequest(request);

				// Process the uploaded items
				Iterator<FileItem> iter = items.iterator();
				while (iter.hasNext()) {
					FileItem item = iter.next();

					if (item.isFormField()) {
						fields1.put(item.getFieldName(), item.getString());
						String name1 = item.getFieldName();
						String value = item.getString();
						System.out.println("name: " + name1);
						System.out.println("value: " + value);
					} else {
						filename1 = item.getName();
						System.out.println("filename: " + filename1);
						if (filename1 == null || filename1.equals("")) {
							break;
						} else {
							Path path = Paths.get(filename1);
							String storePath = servletContext.getRealPath("/uploads");
							File uploadFile = new File(storePath + "/" + path.getFileName());
							item.write(uploadFile);
							System.out.println(storePath + "/" + path.getFileName());
						}
					}
				}
				String name = fields1.get("name");
				String image = filename1;
				String price = fields1.get("price");
				String quantity = fields1.get("quantity");
				String description = fields1.get("description");
				String category_id = fields1.get("category_id");
				
				Category c = categoryDao.getCategory(Integer.parseInt(category_id));
				
				int id1 = Integer.parseInt(request.getParameter("pid"));
				Product a = productDao.getProduct(id1);
				
				
				a.setName(name);
				
				a.setImage(image);
				a.setDescription(description);
				
				
				a.setPrice(Double.parseDouble(price));
				a.setQuantity(Integer.parseInt(quantity));
				a.setCategory(c);			
				productDao.update(a);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("manageProduct");
			break;

		case "home":
			request.getRequestDispatcher("project/admin-product.jsp").forward(request, response);
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
