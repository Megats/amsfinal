package supplier.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import supplier.model.*;
import supplier.dao.*;

/**
 * Servlet implementation class UpdateSupplierController
 */
@WebServlet("/UpdateSupplierController")
public class UpdateSupplierController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SupplierDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSupplierController() {
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
		RequestDispatcher view = request.getRequestDispatcher("updateSupplier.jsp");
        view.forward(request, response);	
        }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Supplier s = new Supplier();
		
		String supplierID = request.getParameter("supplierID");
		s.setSupplierID(supplierID);
		s.setSupplierName(request.getParameter("supplierName"));
		s.setSupplierPassword(request.getParameter("supplierPassword"));
		
		dao.update(s);
		request.setAttribute("s", dao.getSupplierBySupplierID(supplierID));
		RequestDispatcher view = request.getRequestDispatcher("viewSupplierInfo.jsp");
        view.forward(request, response);	
		}

}
