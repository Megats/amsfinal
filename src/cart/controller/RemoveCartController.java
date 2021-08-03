package cart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import cart.model.*;
/**
 * Servlet implementation class RemoveCartController
 */
@WebServlet("/RemoveCartController")
public class RemoveCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int productid = Integer.parseInt(request.getParameter("id"));
		System.out.println("ID TO REMOVE IS"+productid);
		
		HttpSession session = request.getSession(true);
		@SuppressWarnings("unchecked")
		List<Cart> omA = (List<Cart>) session.getAttribute("cart");
		omA.remove(productid);
		
		session.setAttribute("Cart",omA);
		
		RequestDispatcher view = request.getRequestDispatcher("cart.jsp");
		view.forward(request, response);
	}


}
