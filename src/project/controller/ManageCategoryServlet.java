package project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.data.CategoryDAO;
import project.model.Category;

/**
 * Servlet implementation class ManageCategoryServlet
 */
@WebServlet("/manageCategory")
public class ManageCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDAO categoryDao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManageCategoryServlet() {
		categoryDao = new CategoryDAO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Category> categories = categoryDao.getAll();

		request.setAttribute("categories", categories);
		String action = request.getParameter("action");
		if (action == null) {
			action = "home";
		}

		switch (action) {
		case "deleteCategory":
			int categoryId = Integer.parseInt(request.getParameter("cid"));
			categoryDao.delete(categoryId);
			response.sendRedirect("manageCategory");
			break;
		case "addCategory":
			String title = request.getParameter("title");
			String description = request.getParameter("description");
			Category category = new Category();
			category.setDescription(description);
			category.setTitle(title);
			categoryDao.save(category);
			response.sendRedirect("manageCategory");
			break;
		case "edit":
			int id = Integer.parseInt(request.getParameter("cid"));
			Category category1 = categoryDao.getCategory(id);

			request.setAttribute("category", category1);

			request.getRequestDispatcher("project/admin-category-edit.jsp").forward(request, response);
			break;
		case "editCategory":
			String title1 = request.getParameter("title");
			String description1 = request.getParameter("description");

			int id1 = Integer.parseInt(request.getParameter("cid"));
			Category a = categoryDao.getCategory(id1);

			a.setTitle(title1);

			a.setDescription(description1);

			categoryDao.update(a);

			response.sendRedirect("manageCategory");
			break;

		case "home":
			request.getRequestDispatcher("project/admin-category.jsp").forward(request, response);
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
