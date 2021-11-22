package cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.model.Cart;

/**
 * Servlet implementation class AddQuantityController
 */
@WebServlet("/quantity-inc-dec")
public class AddQuantityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuantityController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String action = request.getParameter("action");
			String productid = request.getParameter("productid");
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart");

			if (action != null && productid != null) {
				if (action.equals("inc")) {
					for (Cart c : cart_list) {
						if (c.getProductid().equals(productid)) {
							int quantity = c.getProductquantity();
							quantity=quantity+10;
							c.setProductquantity(quantity);
							response.sendRedirect("cart.jsp");
						}
					}
				}

				if (action.equals("dec")) {
					for (Cart c : cart_list) {
						if (c.getProductid().equals(productid) && c.getProductquantity() > 10) {
							int quantity = c.getProductquantity();
							quantity--;
							c.setProductquantity(quantity);
							break;
						}
					}
					response.sendRedirect("cart.jsp");
				}
			} else {
				response.sendRedirect("cart.jsp");
			}
		}
	}
}


