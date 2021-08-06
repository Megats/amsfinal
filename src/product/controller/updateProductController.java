package product.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import product.dao.ProductDAO;
import product.model.Product;

/**
 * Servlet implementation class updateProductController
 */
@WebServlet("/updateProductController")
public class updateProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ProductDAO dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProductController() {
        super();
        dao = new ProductDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String productid = request.getParameter("id");
		request.setAttribute("p", ProductDAO.getProductByID(productid));
		RequestDispatcher view = request.getRequestDispatcher("updateProduct.jsp");
        view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Product p = new Product();
		String productId = request.getParameter("productid");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		//Blob productPicture = (Blob) request.getAttribute("productPicture");
		p.setProductId(productId);
		p.setProductQuantity(quantity);
		dao.updateProduct(p);
		request.setAttribute("p", ProductDAO.getProductByID(productId));
	    request.setAttribute("success","Update success" );
	    RequestDispatcher view = request.getRequestDispatcher("updateProduct.jsp");
		view.forward(request, response);	
	}
}


