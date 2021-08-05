package returnorder.controller;

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

import returnorder.dao.ReturnOrderDAO;
import returnorder.model.ReturnOrder;

/**
 * Servlet implementation class AddReturnOrderController
 */
@WebServlet("/AddReturnOrderController")
@MultipartConfig(maxFileSize = 16177215)
public class AddReturnOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReturnOrderDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReturnOrderController() {
        super();
        dao = new ReturnOrderDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		ReturnOrder ro = new ReturnOrder();
		InputStream inputStream = null;
		Part image = request.getPart("returnOrderImage");
		if (image != null) {
            // prints out some information for debugging
            System.out.println(image.getName());
            System.out.println(image.getSize());
            System.out.println(image.getContentType());
             
            // obtains input stream of the upload file
            inputStream = image.getInputStream();
            ro.setReturnOrderImage(inputStream);
        }
		
		ro.setReturnOrderQuantity(Integer.parseInt(request.getParameter("returnOrderQuantity")));
		ro.setReturnOrderStatus(request.getParameter("returnOrderStatus"));
		ro.setReturnOrderDescription(request.getParameter("returnOrderDescription"));
		ro.setOrderId(request.getParameter("orderid"));
		ro.setProductId(request.getParameter("productid"));
		dao.addReturnOrder(ro);
		request.setAttribute("success", "Update success");
		
		RequestDispatcher view = request.getRequestDispatcher("addReturnOrder.jsp");
        view.forward(request, response);
	}
}
