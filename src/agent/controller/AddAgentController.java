package agent.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import agent.model.*;
import agent.dao.*;

/**
 * Servlet implementation class AddAgentController
 */
@WebServlet("/AddAgentController")
public class AddAgentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AgentDAO dao;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAgentController() {
        super();
        dao = new AgentDAO();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		Agent a = new Agent();
		a.setAgentid(request.getParameter("agentID"));
		a.setAgentname(request.getParameter("agentName"));
		a.setAgentgender(request.getParameter("agentGender"));
		a.setAgentphoneno(request.getParameter("agentPhoneNo"));
		a.setAgentaddress(request.getParameter("agentAddress"));
		a.setAgentemail(request.getParameter("agentEmail"));
		String date = request.getParameter("agentDateAssign");
		Date dt;
		try {
			dt = new SimpleDateFormat("yyyy-MM-dd").parse(date);
			java.sql.Date sqlDate = new java.sql.Date(dt.getTime());
			a.setAgentDateAssign(sqlDate);
		}
        catch(ParseException e){
        	e.printStackTrace();
        }
		a.setAgentpassword(request.getParameter("agentPassword"));
		a.setAgentstatus(request.getParameter("agentStatus"));
		
		dao.addAgent(a);
		response.sendRedirect("ListAgentController");
	}
}


