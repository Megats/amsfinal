package supplier.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import supplier.dao.*;

/**
 * Servlet implementation class ViewSupplierController
 */
@WebServlet("/ViewSupplierController")
public class ViewSupplierController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SupplierDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewSupplierController() {
        super();
        dao = new SupplierDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String supplierID = (request.getParameter("id"));
		request.setAttribute("s", dao.getSupplierBySupplierID(supplierID));
		RequestDispatcher view = request.getRequestDispatcher("viewSupplier.jsp");
        view.forward(request, response);	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
