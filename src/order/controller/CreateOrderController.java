package order.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.model.*;
import payment.model.*;
import order.dao.*;

/**
 * Servlet implementation class CreateOrderController
 */
@WebServlet("/CreateOrderController")
public class CreateOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DateFormat formatter; 
	private OrderDAO dao;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateOrderController() {
        super();
        dao = new OrderDAO();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		System.out.println("Product id at createorder is "+request.getParameter("productid"));
		Order o = new Order();
		Payment p = new Payment();
		double totalprice = 0;
		int quantity;
		quantity = Integer.parseInt(request.getParameter("quantity"));
		
		//convert date format from picker dd/MM/yyyy to yyyy-MM-dd
	    formatter = new SimpleDateFormat("yyyy-MM-dd");		
	    
		try 
		{
				
			    //get the date and convert to java date
			    java.util.Date date1=formatter.parse(request.getParameter("orderdate"));
			    System.out.println("After parse:"+date1);
			    o.setOrderid("000");
				o.setOrderdate(date1);
				p.setPaymentdate(date1);
				System.out.println("date set successfully!");
				
				//Calculate totalprice
				if(request.getParameter("product").equals("serunding"))
				{
					totalprice = 6.60*(quantity);
				}
				
				else if(request.getParameter("product").equals("cordial1"))
					{
						totalprice = 7.70*(quantity);
					}
					
				else if(request.getParameter("product").equals("cordial2"))
					{
						totalprice = 14.50*(quantity);
					}
					
				else if(request.getParameter("product").equals("jam"))
					{
						totalprice = 6.60*(quantity);
					}
				
				if(request.getParameter("product").equals("sambal"))
				{
					totalprice = 10.50*(quantity);
				}
				
				else if(request.getParameter("product").equals("dried"))
					{
						totalprice = 18.90*(quantity);
					}
					
				else if(request.getParameter("product").equals("originalscones"))
					{
						totalprice = 13.00*(quantity);
					}
					
				else if(request.getParameter("product").equals("assortedscones"))
					{
						totalprice = 15.00*(quantity);
					}
				
				
				o.setAgentid(request.getParameter("agentid"));
				o.setProductid(request.getParameter("product"));
				o.setOrderquantity(quantity);
				o.setOrdertotalprice(totalprice);
				p.setPaymentid("000");
				p.setOrderid("000");
				dao.addOrder(o);
				dao.addPayment(p);
				RequestDispatcher view = request.getRequestDispatcher("viewOrder.jsp");
				view.forward(request, response);
		}
		
		
		catch(Exception e)
		{
			System.out.println("fail to try");
		}

	
		
	}

}
