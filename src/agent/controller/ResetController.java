package agent.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import agent.model.Agent;
import agent.dao.*;

/**
 * Servlet implementation class ResetController
 */
@WebServlet("/ResetController")
public class ResetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AgentDAO dao;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetController() {
        super();
        dao = new AgentDAO();

        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Agent a = new Agent();
		a.setAgentemail(request.getParameter("email"));		
		a.setAgentphoneno(request.getParameter("agentPhoneNo"));
		a.setAgentpassword(request.getParameter("password"));
		
		dao.updatePassword(a);	
		request.setAttribute("success", "Password has been reset!");
		RequestDispatcher view = request.getRequestDispatcher("login.jsp");
        view.forward(request, response);	
	}

}
