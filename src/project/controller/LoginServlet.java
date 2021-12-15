package project.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.data.UserDAO;
import project.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(urlPatterns = { "/login", "/logout" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		userDao = new UserDAO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String message = null;

		HttpSession session = request.getSession();

		String action = request.getServletPath();
		switch (action) {
		case "/login":
			User user = userDao.validate(email, password);
			if (user != null) {
				if (user.getRole().equals("AD")) {
					
					response.sendRedirect("admin");
				} else {
					session.setAttribute("user", user);

					response.sendRedirect("home");
				}
			} else {
				message = "Invalid email or password!";
				request.setAttribute("message", message);
				request.getRequestDispatcher("project/login.jsp").forward(request, response);

			}
			break;
		case "/logout":
			session.invalidate();
			response.sendRedirect("home");
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
