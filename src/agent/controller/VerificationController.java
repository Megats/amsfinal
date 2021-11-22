package agent.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import agent.dao.AgentDAO;
import agent.model.Agent;
import order.dao.OrderDAO;

/**
 * Servlet implementation class VerificationController
 */
@WebServlet("/VerificationController")
public class VerificationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerificationController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			Agent agent = new Agent();
			
			//retrieve and set email and password
			agent.setAgentemail(request.getParameter("email"));
			agent.setAgentphoneno(request.getParameter("phonenumber"));

			agent = AgentDAO.verification(agent);
			//set user session if user is valid
			if(agent.isValid()){

				RequestDispatcher view = request.getRequestDispatcher("resetpassword.jsp");
		        view.forward(request, response);		
			}
			//redirect to invalidLoggin.jsp if user is not valid
			else
			{
				
				System.out.println("Incorrect email or phone number");
				request.setAttribute("success", "Invalid username or password");
				RequestDispatcher view = request.getRequestDispatcher("verification.jsp");
				view.forward(request, response);	
			}		
		}

		catch (Throwable ex) 
		{
			System.out.println(ex);
		}
	}

}
