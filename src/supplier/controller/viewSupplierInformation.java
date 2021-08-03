package supplier.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import supplier.dao.SupplierDAO;

/**
 * Servlet implementation class viewSupplierInformation
 */
@WebServlet("/viewSupplierInformation")
public class viewSupplierInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SupplierDAO dao;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewSupplierInformation() {
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
		RequestDispatcher view = request.getRequestDispatcher("viewSupplierInfo.jsp");
        view.forward(request, response);	
	}

	
}
