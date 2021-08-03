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
 * Servlet implementation class UpdateAgentPersonalInformationController
 */
@WebServlet("/UpdateAgentPersonalInformationController")
public class UpdateAgentPersonalInformationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AgentDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAgentPersonalInformationController() {
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
		request.setAttribute("a", dao.getAgentByid(agentID));
		RequestDispatcher view = request.getRequestDispatcher("updateAgentForAgent.jsp");
        view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Agent a = new Agent();
		a.setAgentid(request.getParameter("agentID"));
		a.setAgentname(request.getParameter("agentName"));
		a.setAgentphoneno(request.getParameter("agentPhoneNo"));
		a.setAgentaddress(request.getParameter("agentAddress"));
		a.setAgentemail(request.getParameter("agentEmail"));
		dao.updateAgentInfo(a);
		request.setAttribute("success", "Update success");
		RequestDispatcher view = request.getRequestDispatcher("updateAgentForAgent.jsp");
        view.forward(request, response);

	}

}
