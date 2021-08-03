package agent.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import agent.dao.*;
/**
 * Servlet implementation class ViewAgentAgentController
 */
@WebServlet("/ViewAgentForAgentViewController")
public class ViewAgentForAgentViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AgentDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewAgentForAgentViewController() {
        super();
        dao = new AgentDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String agentID = (request.getParameter("id"));
		System.out.println("agentid is "+ agentID);
		request.setAttribute("a", dao.getAgentByid(agentID));
		RequestDispatcher view = request.getRequestDispatcher("viewAgent.jsp");
        view.forward(request, response);	
	}


}
