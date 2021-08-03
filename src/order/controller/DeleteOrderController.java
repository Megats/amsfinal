package order.controller;

import payment.dao.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.dao.*;
import cart.dao.*;
/**
 * Servlet implementation class DeleteOrderController
 */
@WebServlet("/DeleteOrderController")
public class DeleteOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDAO dao;
	private CartDAO dao2;
	private PaymentDAO dao3;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteOrderController() {
        super();
        dao = new OrderDAO();
        dao2 = new CartDAO();
        dao3 = new PaymentDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String orderid = request.getParameter("id");
		dao2.deleteCart(orderid);
		dao3.deletePayment(orderid);
		dao.deleteOrder(orderid);

		String agentid = request.getParameter("agentid");
		
        request.setAttribute("od", OrderDAO.getAllOrdered(agentid));
		RequestDispatcher view = request.getRequestDispatcher("viewOrder.jsp");
        view.forward(request, response);

	}

	
}
