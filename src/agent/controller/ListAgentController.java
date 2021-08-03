package agent.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import agent.dao.*;
import order.dao.*;
/**
 * Servlet implementation class ListAgentController
 */
@WebServlet("/ListAgentController")
public class ListAgentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AgentDAO dao;
    private ReportDAO dao2;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListAgentController() {
        super();
        dao = new AgentDAO();
        dao2 = new ReportDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("agent", dao.getAllAgent());
		request.setAttribute("monthly_sales", ReportDAO.viewsalesbymonth());
		RequestDispatcher view = request.getRequestDispatcher("listAgent.jsp");
        view.forward(request, response);	
        }



}
