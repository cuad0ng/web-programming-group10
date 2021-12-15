package project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.data.OrderDAO;
import project.data.ProductDAO;
import project.model.LineItem;
import project.model.Order;
import project.model.OrderDetail;
import project.model.Product;
import project.model.User;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDao;
	private OrderDAO orderDao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		productDao = new ProductDAO();
		orderDao = new OrderDAO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}

	private int isExisting(int id, List<LineItem> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getProduct().getId() == id) {
				return i;
			}
		}
		return -1;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		if (action == null) {
			action = "home";
		}
		HttpSession session = request.getSession();
		if (action.equals("add")) {
			String id = request.getParameter("id");

			if (session.getAttribute("cart") == null) {
				List<LineItem> cart = new ArrayList<LineItem>();

				Product product = productDao.getProduct(Integer.parseInt(id));
				LineItem lineItem = new LineItem(product, 1);
				cart.add(lineItem);
				session.setAttribute("cart", cart);
			} else {
				List<LineItem> cart = (List<LineItem>) session.getAttribute("cart");
				int index = isExisting(Integer.parseInt(id), cart);
				if (index == -1) {
					Product product = productDao.getProduct(Integer.parseInt(id));
					LineItem lineItem = new LineItem(product, 1);
					cart.add(lineItem);
				} else {

					int qtt = cart.get(index).getQuantity() + 1;
					cart.get(index).setQuantity(qtt);

				}

				session.setAttribute("cart", cart);
			}
			request.getRequestDispatcher("project/shoping-cart.jsp").forward(request, response);

		} else if (action.equals("update")) {
			List<LineItem> cart = (List<LineItem>) session.getAttribute("cart");
			String id = request.getParameter("productId");
			String quantity = request.getParameter("quantity");
			int index = isExisting(Integer.parseInt(id), cart);
			cart.get(index).setQuantity(Integer.parseInt(quantity));
			session.setAttribute("cart", cart);
			request.getRequestDispatcher("project/shoping-cart.jsp").forward(request, response);

		} else if (action.equals("remove")) {
			List<LineItem> cart = (List<LineItem>) session.getAttribute("cart");
			String id = request.getParameter("productId");
			int index = isExisting(Integer.parseInt(id), cart);
			cart.remove(index);
			session.setAttribute("cart", cart);
			request.getRequestDispatcher("project/shoping-cart.jsp").forward(request, response);

		} else if (action.equals("home")) {
			List<LineItem> cart = (List<LineItem>) session.getAttribute("cart");

			session.setAttribute("cart", cart);
			request.getRequestDispatcher("project/shoping-cart.jsp").forward(request, response);

		} else if (action.equalsIgnoreCase("checkout")) {

			if (session.getAttribute("user") == null) {
				response.sendRedirect("project/login.jsp");
			} else {
				request.getRequestDispatcher("project/checkout.jsp").forward(request, response);
			}
		} else if (action.equals("saveOrder")) {
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");

			User user = (User) session.getAttribute("user");
			String email = user.getEmail();

			List<LineItem> items = (List<LineItem>) session.getAttribute("cart");

			Order order = new Order();
			order.setAddress(address);
			order.setEmail(email);
			order.setPhone(phone);
			order.setStatus("Processing");
			orderDao.saveOrder(order);

			for (LineItem i : items) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setOrder(order);
				orderDetail.setProduct(i.getProduct());
				orderDetail.setPrice(i.getProduct().getPrice());
				orderDetail.setQuantity(i.getQuantity());

				int qtt = i.getProduct().getQuantity() - i.getQuantity();
				i.getProduct().setQuantity(qtt);
				productDao.update(i.getProduct());

				orderDao.saveOrderDetail(orderDetail);
			}
			List<LineItem> cart = null;
			session.setAttribute("cart", cart);
			response.sendRedirect("home");

		}
	}

}
