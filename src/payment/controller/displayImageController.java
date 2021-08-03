package payment.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import db.connection.*;
/**
 * Servlet implementation class displayImageController
 */
@WebServlet("/displayImageController")
public class displayImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection con = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public displayImageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		// TODO Auto-generated method stub
		Blob image = null;
		byte[] imgData = null;
		String id = request.getParameter("id");// here you are getting id
		System.out.println("id for image:"+id);
		int i;
		ResultSet rs = null;
		

		try {

			// loading drivers for mysql
			 Class.forName("com.mysql.jdbc.Driver");
             Connection con = DriverManager.getConnection(
            			"jdbc:mysql://us-cdbr-east-04.cleardb.com:3306/heroku_5e9f153ed6f0b20", "b45c552be3803d", "4fa79fab");


            String sql = "select paymentimage from payment where paymentid=?"; //here pass that id in query to get particular image 
            PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				image = rs.getBlob("paymentimage");// getting image from database
				imgData = image.getBytes(1, (int) image.length()); // extra info about image
			}

			response.setContentType("image/png");// setting response type

			OutputStream o = response.getOutputStream();

			o.write(imgData);// sending the image to jsp page
			o.flush();
			o.close();

		} catch (Exception e) {
			e.printStackTrace();

		}
	}
}


