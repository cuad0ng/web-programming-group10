package project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project.data.CategoryDAO;
import project.data.ProductDAO;
import project.data.UserDAO;
import project.model.Category;
import project.model.Product;
import project.model.User;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDao;
	private CategoryDAO categoryDao;
	private UserDAO userDao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
		productDao = new ProductDAO();
		categoryDao = new CategoryDAO();
		userDao = new UserDAO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<User> users = userDao.getAll();
		List<Product> products = productDao.getAll();
		List<Category> categories = categoryDao.getAll();
		int userCount = users.size();
		int productCount = products.size();
		int categoryCount = categories.size();
		request.setAttribute("userCount", userCount);
		request.setAttribute("productCount", productCount);
		request.setAttribute("categoryCount", categoryCount);

		String action = request.getParameter("action");
		if (action == null) {
			action = "home";
		}
		switch (action) {

		case "manageProduct":
			request.getRequestDispatcher("project/admin-product.jsp").forward(request, response);

			break;
		case "manageCategory":
			request.getRequestDispatcher("project/admin-category.jsp").forward(request, response);

			break;
		case "home":
			request.getRequestDispatcher("project/admin.jsp").forward(request, response);
			break;
		}

	}

}
