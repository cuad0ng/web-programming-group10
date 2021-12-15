package murach.email.email;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import murach.email.business.User;
import murach.email.data.UserDB;
import murach.email.data.UserIO;

@SuppressWarnings("serial")
@WebServlet("/ex/emailList")
public class EmailListServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/ex/index-email.jsp";

		// initialize the current year that's used in the copyright notice
		GregorianCalendar currentDate = new GregorianCalendar();
		int currentYear = currentDate.get(Calendar.YEAR);
		request.setAttribute("currentYear", currentYear);

		// get current action
		String action = request.getParameter("action");

		// print action value to console AND log file
		System.out.println("EmailListServlet action: " + action);
		log("action=" + action);

		// set default action
		if (action == null) {
			action = "join"; // default action
		}

		// perform action and set URL to appropriate page
		if (action.equals("join")) {
			url = "/ex/index-email.jsp"; // the "join" page
		} else if (action.equals("add")) {
			// get parameters from the request
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");

			// store data in User object and save User object in database
			User user = new User(firstName, lastName, email);
			String message;
			if (firstName == null || lastName == null || email == null || firstName.isEmpty() || lastName.isEmpty()
					|| email.isEmpty()) {
				message = "Please fill out all three text boxes.";
				url = "/ex/index-email.jsp";
			} else if (UserDB.emailExists(user.getEmail())) {
				message = "This email address already exists.<br>" + "Please enter another email address.";
				url = "/ex/index-email.jsp";
			} else {
				message = "";
				url = "/ex/thanks.jsp";
				UserDB.insert(user);
			}
			// set User object in request object and set URL
			request.setAttribute("user", user);
			/*
			 * url = "/thanks.jsp"; // the "thanks" page // validate the parameters
			 */
			request.setAttribute("user", user);
			request.setAttribute("message", message);
		}
		// create the Date object and store it in the request
		Date currentDate1 = new Date();
		request.setAttribute("currentDate1", currentDate1);

		// create users list and store it in the session
		String path = getServletContext().getRealPath("/WEB-INF/EmailList.txt");
		ArrayList<User> users = UserIO.getUsers(path);
		HttpSession session = request.getSession();
		session.setAttribute("users", users);
		// forward request and response objects to specified URL
		getServletContext().getRequestDispatcher(url).forward(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}