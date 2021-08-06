package order.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.dao.*;
import order.model.*;
/**
 * Servlet implementation class UpdateOrderController
 */
@WebServlet("/UpdateOrderController")
public class UpdateOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrderController() {
        super();
        dao = new OrderDAO();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Order o = new Order();
		
		o.setOrderid(request.getParameter("orderid"));
		o.setOrderstatus(request.getParameter("status"));
		dao.update(o);
		
		request.setAttribute("od", OrderDAO.getAllOrderAgent());  
		request.setAttribute("success", "Update success");
		RequestDispatcher view = request.getRequestDispatcher("viewOrderSupplier.jsp");
        view.forward(request, response);	
	}
}


