package order.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.dao.*;
import returnorder.dao.ReturnOrderDAO;

/**
 * Servlet implementation class ViewDetailOrderController
 */
@WebServlet("/ViewDetailOrderController")
public class ViewDetailOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewDetailOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String id = request.getParameter("id");
		System.out.println("order id at servlet is "+id);
		request.setAttribute("roList", ReturnOrderDAO.getReturnOrderByOrderID(id));
		request.setAttribute("od", OrderDAO.getAllOrder(id));
		RequestDispatcher view = request.getRequestDispatcher("ViewDetailOrder.jsp");
		view.forward(request, response);	
	}


}
