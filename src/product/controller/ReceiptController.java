package product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.dao.OrderDAO;
import returnorder.dao.ReturnOrderDAO;

/**
 * Servlet implementation class ReceiptController
 */
@WebServlet("/ReceiptController")
public class ReceiptController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReceiptController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		request.setAttribute("roList", ReturnOrderDAO.getReturnOrderByOrderID(id));
		request.setAttribute("od", OrderDAO.getAllOrder(id));
		RequestDispatcher view = request.getRequestDispatcher("Receipt.jsp");
		view.forward(request, response);
	}

}
