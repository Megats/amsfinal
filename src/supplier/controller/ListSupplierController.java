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
 * Servlet implementation class ListSupplierController
 */
@WebServlet("/ListSupplierController")
public class ListSupplierController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SupplierDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListSupplierController() {
        super();
        dao = new SupplierDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("supp", dao.getAllSupplier());
		RequestDispatcher view = request.getRequestDispatcher("listSupplier.jsp");
        view.forward(request, response);	
        }


}
