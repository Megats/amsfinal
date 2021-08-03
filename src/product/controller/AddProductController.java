package product.controller;

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

import product.model.Dry;
import product.model.Product;
import product.model.Wet;
import product.dao.*;
/**
 * Servlet implementation class AddProductController
 */
@WebServlet("/AddProductController")
@MultipartConfig(maxFileSize = 16177215)

public class AddProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ProductDAO dao;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductController() {
        super();
        dao = new ProductDAO();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				Product p = new Product();
				p.setSupplierid(request.getParameter("supplierid"));
				int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
				double productPrice = Double.parseDouble(request.getParameter("productPrice"));
				String productId = request.getParameter("productId");
				p.setProductId(productId);
				InputStream inputStream = null;
				Part image = request.getPart("productPicture");
				if (image != null) {
		            // prints out some information for debugging
		            System.out.println(image.getName());
		            System.out.println(image.getSize());
		            System.out.println(image.getContentType());
		             
		            // obtains input stream of the upload file
		            inputStream = image.getInputStream();
		            p.setProductPicture(inputStream);
		        }
				//imgData = productPicture.getBytes(1,(int)image.length()); //extra info about image
				p.setProductName(request.getParameter("productName"));
				p.setProductDescription(request.getParameter("productDescription"));
				p.setProductType(request.getParameter("productType"));
				p.setProductQuantity(productQuantity);
				p.setProductPrice(productPrice);
				String type = request.getParameter("productType");
				
				dao.addProduct(p);
				if(type.equalsIgnoreCase("Dry")) {
					Dry d = new Dry();
					d.setType(request.getParameter("type"));
					d.setWeight(Double.parseDouble(request.getParameter("weight")));
					d.setProductId(productId);
					dao.addDry(d);
				}else if(type.equalsIgnoreCase("Wet")) {
					Wet w = new Wet();
					w.setFlavour(request.getParameter("flavour"));
					w.setVolume(Double.parseDouble(request.getParameter("volume")));
					w.setProductId(productId);
					dao.addWet(w);
				}
				
				response.sendRedirect("viewProductSupplier");
				}

}
