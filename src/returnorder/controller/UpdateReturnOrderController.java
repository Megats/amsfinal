package returnorder.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import returnorder.dao.ReturnOrderDAO;
import returnorder.model.ReturnOrder;

/**
 * Servlet implementation class UpdateReturnOrderController
 */
@WebServlet("/UpdateReturnOrderController")
public class UpdateReturnOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ReturnOrderDAO dao;  
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReturnOrderController() {
        super();
        dao = new ReturnOrderDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String returnOrderId = request.getParameter("returnOrderId");
		
		request.setAttribute("ro", dao.getReturnOrderByID(returnOrderId));
		RequestDispatcher view = request.getRequestDispatcher("updateReturnOrder.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReturnOrder ro = new ReturnOrder();
		ro.setReturnOrderId(request.getParameter("returnOrderId"));
		ro.setReturnOrderStatus(request.getParameter("returnOrderStatus"));
		
		dao.updateStatus(ro);
		
		request.setAttribute("success", "Update success");
		RequestDispatcher view = request.getRequestDispatcher("updateReturnOrder.jsp");
        view.forward(request, response);
	}

}
