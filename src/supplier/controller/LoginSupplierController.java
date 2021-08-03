package supplier.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import order.dao.OrderDAO;
import supplier.model.Supplier;
import supplier.dao.*;


/**
 * Servlet implementation class LoginSupplierController
 */
@WebServlet("/LoginSupplierController")
public class LoginSupplierController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSupplierController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			Supplier supply = new Supplier();
			//retrieve and set email and password
			supply.setSupplierID(request.getParameter("supplierid"));
			supply.setSupplierPassword(request.getParameter("password"));

			supply = SupplierDAO.login(supply);
			//set user session if user is valid
			if(supply.isValid()){
				HttpSession session = request.getSession(true);
				session.setAttribute("sessionId", supply.getSupplierID());
				session.setAttribute("sessioname", supply.getSupplierName());
				session.setAttribute("sessionPosition", supply.getSupplierPosition());
				session.setAttribute("currentSessionUser",supply);
				request.setAttribute("ag", SupplierDAO.getSupplierBySupplierID(supply.getSupplierID()));   //to retrieve user info
				request.setAttribute("od", OrderDAO.getAllOrderAgent());        
				RequestDispatcher view = request.getRequestDispatcher("viewOrderSupplier.jsp");
		        view.forward(request, response);	
			}
			//redirect to invalidLoggin.jsp if user is not valid
			else{
				System.out.println("Incorrect id or password");
				response.sendRedirect("invalidLogin.jsp");
			}		
		}

		catch (Throwable ex) 
		{
			System.out.println(ex);
		}
	}
}


