package cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.model.*;
import cart.dao.*;

/**
 * Servlet implementation class CustomerAddCartController
 */
@WebServlet("/CustomerAddCartController")
public class CustomerAddCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerAddCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String productid = request.getParameter("id");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
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
		ArrayList<Cart> omA = (ArrayList<Cart>) session.getAttribute("cart");
		ArrayList<Cart> omAA = new ArrayList<Cart>();

		
		if(omA == null)
		{
			System.out.println("current product id when not added is "+ productid);
			omAA.add(ct);
			
			session.setAttribute("cart", omAA);
			request.setAttribute("Cart", omAA); 
			
			response.sendRedirect("viewProductController");
		}
		else {
			
            boolean exist = false;
            for (Cart c:omA) {
            	
            	 if (c.getProductid().equals(productid)) {
                     exist = true;
                     System.out.println("same product");
                     out.println("<h3 style='color:crimson; text-align: center'>Item Already in Cart. <a href='cart.jsp'>GO to Cart Page</a></h3>");
            	 }
                 out.println("<h3 style='color:crimson; text-align: center'>Item Already in Cart. <a href='cart.jsp'>GO to Cart Page</a></h3>");

            }

            if (!exist) {
            	
                omA.add(ct);
                response.sendRedirect("viewProductController");
            }
					}
	}		
}

