package cart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.dao.CartDAO;
import cart.model.Cart;

/**
 * Servlet implementation class CustomerBuyNowController
 */
@WebServlet("/CustomerBuyNowController")
public class CustomerBuyNowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerBuyNowController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String productid = request.getParameter("id");
		System.out.println("product id into cart is "+productid);
		double totalprice = 0;
		
		Cart menu = CartDAO.selectProductById(productid);
		
		Cart ct = new Cart();
		
		ct.setProductid(menu.getProductid());
		ct.setProductname(menu.getProductname());
		ct.setProductprice(menu.getProductprice());
		totalprice = ct.getProductprice()*ct.getProductquantity();
		
		ct.setProducttotalprice(totalprice);
		
		int quantity = 10;
		ct.setProductquantity(quantity);
		
		totalprice = ct.getProductprice()*quantity;
		ct.setProducttotalprice(totalprice);
		HttpSession session = request.getSession(true); 
		@SuppressWarnings("unchecked")
		List<Cart> omA = (List<Cart>) session.getAttribute("cart");
		
		if(omA == null)
		{
			List<Cart> omAA = new ArrayList<Cart>();
			omAA.add(ct);
			
			session.setAttribute("cart", omAA);
			request.setAttribute("Cart", omAA); 
			
			response.sendRedirect("cart.jsp");
		}
		else {
			omA.add(ct);
			session.setAttribute("cart", omA);
			response.sendRedirect("cart.jsp");
		}
	}

	

}
