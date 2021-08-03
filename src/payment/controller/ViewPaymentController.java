package payment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import payment.dao.*;
import payment.model.Payment;


/**
 * Servlet implementation class ViewPaymentController
 */
@WebServlet("/ViewPaymentController")
public class ViewPaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewPaymentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
			String id = (request.getParameter("id"));
	        request.setAttribute("pm", PaymentDAO.getPayment(id));  
			RequestDispatcher view = request.getRequestDispatcher("viewPayment.jsp");
	        view.forward(request, response);	
		}
	}


