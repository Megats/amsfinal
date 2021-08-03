package payment.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import payment.dao.*;
import payment.model.*;
/**
 * Servlet implementation class UpdatePaymentController
 */
@WebServlet("/UpdatePaymentController")
@MultipartConfig(maxFileSize = 16177215)
public class UpdatePaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PaymentDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePaymentController() {
        super();
        dao = new PaymentDAO();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		Payment p = new Payment();
		String id = request.getParameter("id");
		System.out.println("paymentid at controller is "+id);
		String bank = request.getParameter("bank");
		p.setPaymentid(id);
		p.setPaymentbank(bank);
		InputStream inputStream = null;
		Part image = request.getPart("receipt");
        if (image != null) {
            // prints out some information for debugging
            System.out.println(image.getName());
            System.out.println(image.getSize());
            System.out.println(image.getContentType());
             
            // obtains input stream of the upload file
            inputStream = image.getInputStream();
            p.setPaymentimage(inputStream);
        }
		
		dao.update(p); 
		request.setAttribute("success", "Update success");
		RequestDispatcher view = request.getRequestDispatcher("updatepayment.jsp");
        view.forward(request, response);	
	}

}
