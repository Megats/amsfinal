package product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.dao.ProductDAO;

/**
 * Servlet implementation class viewProductSupplier
 */
@WebServlet("/viewProductSupplier")
public class viewProductSupplier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewProductSupplier() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setAttribute("prod", ProductDAO.getAllProduct());
		RequestDispatcher view = request.getRequestDispatcher("viewProduct.jsp");
        view.forward(request, response);
		}


}
