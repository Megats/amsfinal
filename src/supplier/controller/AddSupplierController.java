package supplier.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import supplier.model.*;
import supplier.dao.*;

/**
 * Servlet implementation class AddSupplierController
 */
@WebServlet("/AddSupplierController")
public class AddSupplierController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SupplierDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSupplierController() {
        super();
        dao = new SupplierDAO();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Supplier s = new Supplier();
		s.setSupplierID(request.getParameter("supplierID"));
		s.setSupplierName(request.getParameter("supplierName"));
		s.setSupplierPassword(request.getParameter("supplierPassword"));
		s.setSupplierPosition(request.getParameter("supplierPosition"));
		s.setAdminID(request.getParameter("adminId"));
		
		dao.addSupplier(s);
		response.sendRedirect("ListSupplierController");
	}

}
