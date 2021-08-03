
import java.io.InputStream;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

/**
 * Servlet implementation class InsertImageController
 */
@WebServlet("/InsertImageController")
@MultipartConfig(maxFileSize = 16177215)

public class InsertImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TestDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertImageController() {
        super();
        dao = new TestDAO();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setAttribute("ts", TestDAO.getAllTest());
		RequestDispatcher view = request.getRequestDispatcher("TestView.jsp");
        view.forward(request, response);	

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		Test t = new Test();
		String id = request.getParameter("id");
		t.setId(request.getParameter("id"));
		InputStream inputStream = null;
		Part image = request.getPart("image");
        if (image != null) {
            // prints out some information for debugging
            System.out.println(image.getName());
            System.out.println(image.getSize());
            System.out.println(image.getContentType());
             
            // obtains input stream of the upload file
            inputStream = image.getInputStream();
            t.setPictures(inputStream);
        }
		
			dao.addPictures(t);
		RequestDispatcher view = request.getRequestDispatcher("TestView.jsp");
        view.forward(request, response);
 }}
	
