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
import project.model.Category;
import project.model.Product;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet(urlPatterns = { "/home", "/product" })
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDao;
	private CategoryDAO categoryDao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomeServlet() {
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

		String action = request.getServletPath();
		switch (action) {
		case "/home":

			request.getRequestDispatcher("project/index.jsp").forward(request, response);

			break;
		case "/product":

			request.getRequestDispatcher("project/product.jsp").forward(request, response);

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
