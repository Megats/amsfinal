package cart.controller;
import order.dao.*;
import order.model.*;
import payment.dao.PaymentDAO;
import payment.model.Payment;
import product.dao.ProductDAO;
import product.model.Product;
import cart.dao.CartDAO;
import cart.model.*;
import db.connection.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddToCartController
 */
@WebServlet("/AddToCartController")
public class AddToCartController extends HttpServlet {
	static Connection con = null;
	private static final long serialVersionUID = 1L;
	private OrderDAO dao;
	private CartDAO dao1;
	private PaymentDAO dao2;
	private ProductDAO dao3;
	DateFormat formatter; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartController() {
        super();
        dao = new OrderDAO();
        dao1 = new CartDAO();
        dao2 = new PaymentDAO();
        dao3 = new ProductDAO();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub Session cart

		/*Connection con = null;
		Date orderdate;
		System.out.println("Productid = "+request.getParameter("productid"));
		
		try(PrintWriter out = response.getWriter()){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart");
			Cart auth = (Cart) request.getSession().getAttribute("cart");
			if(cart_list != null && auth!=null) {
				for(Cart c:cart_list) {
					Cart order = new Cart();
					order.setProductid(auth.getProductid());
					order.setProductquantity(c.getProductquantity());
					//get the date
					//orderdate = order.getOrderdate();
					
					 //convert java date to sql date
			        //java.sql.Date odate = new java.sql.Date(orderdate.getTime());
					
					//order.setOrderdate(odate);

					CartDAO oDao = new CartDAO();
					boolean result = oDao.addCart(order);
					if(!result) break;
				}
				cart_list.clear();
				response.sendRedirect("order.jsp");
			}else {
				if(auth==null) {
					response.sendRedirect("login.jsp");
				}
				response.sendRedirect("cart.jsp");
			}
		}*/
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Order or = new Order();
		
		HttpSession session = request.getSession(true); 
		
		@SuppressWarnings("unchecked")
		List<Cart> omA = (List<Cart>) session.getAttribute("cart");
		
		Payment p = new Payment();
		or.setAgentid(request.getParameter("agentid")); 
		
		//InsertTotalPrice
		//double totalPrice = Double.parseDouble(request.getParameter("orderTotalPrice"));
		//or.setOrdertotalprice(totalPrice);
		
		//System.out.println("Total Price in Order :" + totalPrice); //debugging purpose
		//convert date format from picker dd/MM/yyyy to yyyy-MM-dd
	    formatter = new SimpleDateFormat("yyyy-MM-dd");		
	    

	    //get the date and convert to java date
		try {
			//get the date and convert to java date
		    java.util.Date date1=formatter.parse(request.getParameter("orderdate"));
		    System.out.println("After parse:"+date1);
			or.setOrderdate(date1);
			p.setPaymentdate(date1);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//InsertOrderID
		int quantity = Integer.parseInt(request.getParameter("totalquantity"));
		or.setOrderquantity(quantity);
		or.setOrderid("000");
		p.setPaymentid("000");
		String agentid = request.getParameter("agentid");
		or.setAgentid(agentid);
		String productid = request.getParameter("productid");
		or.setProductid(productid);
		double totalprice = Double.parseDouble(request.getParameter("totalprice"));
		or.setOrdertotalprice(totalprice);
		
		//ADD ORDER AT ORDER TABLE
		String orderid = dao.addOrder(or);
		System.out.println("Current order id is"+ orderid);
		p.setOrderid(orderid);
		
		dao.addPayment(p);
		or.setOrderid(orderid);
		request.setAttribute("or", OrderDAO.getOrderById(or.getOrderid()));
		or = OrderDAO.getOrderById(or.getOrderid());
		session.setAttribute("CurrentSessionOrderID", or.getOrderid());
	
		OrderDAO.getOrderById(orderid);
		//Inside OrderMenu
		for (int i=0; i<omA.size(); i++)
		{
			Cart o = omA.get(i);
			Product pd = new Product();
			System.out.println("Product id "+o.getProductid());
			System.out.println("Order id "+o.getOrderid());
			pd.setProductId(o.getProductid());
			pd.setProductQuantity(o.getProductquantity());
			ProductDAO.updateProductByProductID(pd);
			System.out.println("Total price for this item is "+o.getProducttotalprice());
			CartDAO.addCart(o);
		}
			
        request.setAttribute("pm", PaymentDAO.getPaymentByOrderId(orderid));        
		RequestDispatcher view = request.getRequestDispatcher("viewPayment.jsp");
        view.forward(request, response);		

	}
}



