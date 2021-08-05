package agent.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import agent.dao.*;
import agent.model.Agent;
import order.dao.OrderDAO;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub

		try {

			Agent agent = new Agent();
			//retrieve and set email and password
			agent.setAgentid(request.getParameter("agentid"));
			agent.setAgentpassword(request.getParameter("password"));

			agent = AgentDAO.login(agent);
			//set user session if user is valid
			if(agent.isValid()){
				HttpSession session = request.getSession(true);
				session.setAttribute("sessionId", agent.getAgentid());
				session.setAttribute("currentSessionUser",agent);
				request.setAttribute("ag", AgentDAO.getAgentByid(agent.getAgentid()));   //to retrieve user info
		        request.setAttribute("od", OrderDAO.getAllOrdered(agent.getAgentid()));
				RequestDispatcher view = request.getRequestDispatcher("viewOrder.jsp");
		        view.forward(request, response);		
			}
			//redirect to invalidLoggin.jsp if user is not valid
			else
			{
				
				System.out.println("Incorrect id or password");
				RequestDispatcher view = request.getRequestDispatcher("login.jsp");
				view.forward(request, response);	
			}		
		}

		catch (Throwable ex) 
		{
			System.out.println(ex);
		}
	}
}
