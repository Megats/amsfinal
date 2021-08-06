package returnorder.dao;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import db.connection.ConnectionManager;
import returnorder.model.ReturnOrder;
import order.dao.OrderDAO;
import order.model.*;
import cart.dao.CartDAO;
import cart.model.*;
import product.dao.ProductDAO;
import product.model.*;

public class ReturnOrderDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	String returnOrderId;
	int returnOrderQuantity;
	String returnOrderStatus;
	InputStream returnOrderImage;
	String returnOrderDescription;
	String orderId;	int getValue;
	String productId;
	
	//set string auto-increment
	public void generateUniqueid(String passquery)
	{
		con = ConnectionManager.getConnection();
		
		try
		{
			stmt = con.createStatement();
			ResultSet set = stmt.executeQuery(passquery);
			
			if(set.next())
			{
				getValue = Integer.parseInt(set.getString(1));
			}
			System.out.println("get value success");
		}
		
		catch(Exception e)
		{
			System.out.println("Get value failed");
		}
		
	}
	
	public void addReturnOrder(ReturnOrder ro) {
		
		generateUniqueid("select count(RETURNORDERID)+1 from RETURNORDER");
		returnOrderId = "RO"+getValue;
		returnOrderQuantity = ro.getReturnOrderQuantity();
		returnOrderStatus = ro.getReturnOrderStatus();
		returnOrderImage = ro.getReturnOrderImage();
		returnOrderDescription = ro.getReturnOrderDescription();
		orderId = ro.getOrderId();
		productId = ro.getProductId();
		
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("INSERT INTO returnorder (returnOrderId, returnOrderQuantity, returnOrderStatus, returnOrderImage, returnOrderDescription, orderId, productId) VALUES (?,?,?,?,?,?,?)");
			ps.setString(1, returnOrderId);
			ps.setInt(2, returnOrderQuantity);
			ps.setString(3, returnOrderStatus);
			ps.setBlob(4, returnOrderImage);
			ps.setString(5, returnOrderDescription);
			ps.setString(6, orderId);
			ps.setString(7, productId);
			
			ps.executeUpdate();
			con.close();
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public static List<ReturnOrder> getAllReturnOrder() throws IOException { //all return order
		List<ReturnOrder> roList = new ArrayList<ReturnOrder>();
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from returnorder");
			
			while(rs.next()) {
				ReturnOrder ro = new ReturnOrder();
				ro.setReturnOrderId(rs.getString("returnOrderId"));
				ro.setReturnOrderQuantity(rs.getInt("returnOrderQuantity"));
				ro.setReturnOrderStatus(rs.getString("returnOrderStatus"));
				Blob blob = rs.getBlob("returnOrderImage");
				
				InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                 
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                 
                 
                inputStream.close();
                outputStream.close();
				ro.setBase64Image(base64Image);
				
				ro.setReturnOrderDescription(rs.getString("returnOrderDescription"));
				ro.setOrderId(rs.getString("orderId"));
				
				roList.add(ro);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			
		}
		return roList;
	}
	
	public static ReturnOrder getReturnOrderByID(String returnOrderId) { //view product by product id
		ReturnOrder ro = new ReturnOrder();
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("select * from returnorder where returnOrderId=?");
			ps.setString(1, returnOrderId);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				ro.setReturnOrderId(rs.getString("returnOrderId"));
				ro.setReturnOrderQuantity(rs.getInt("returnOrderQuantity"));
				ro.setReturnOrderStatus(rs.getString("returnOrderStatus"));
				ro.setReturnOrderDescription(rs.getString("returnOrderDescription"));
				ro.setOrderId(rs.getString("orderId"));
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
			
		}
		return ro;
	}
	
	public static List<Product> getReturnOrderByOrderID(String orderid) { //view product by product id
		
		List<Product> roList = new ArrayList<Product>();

		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("select * from product join orderdetail using (productid)"
									 + "join orders using (orderid) where orderid=?");
			ps.setString(1, orderid);
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {
				Product pr = new Product();

				Blob blob = rs.getBlob("productpicture");
                
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                 
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                 
                 
                inputStream.close();
                outputStream.close();
				pr.setBase64Image(base64Image);
				pr.setCart(CartDAO.getCartById(rs.getString("productid")));
				pr.setOrder(OrderDAO.getOrderById(orderid));
				pr.setProductId(rs.getString("productid"));
				pr.setProductName(rs.getString("productname"));
				pr.setProductPrice(rs.getDouble("productprice"));
				roList.add(pr);
				}
			}
		
			catch (Exception ex) {
			ex.printStackTrace();
			
			}
			
			return roList;
	}
	
	public static List<ReturnOrder> getReturnOrderByAgentID(String agentid) throws IOException { //view product by product id
		
		List<ReturnOrder> roList = new ArrayList<ReturnOrder>();

		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("select * from returnorder join orders using (orderid) join orderdetail using (productid)"
									 + "join product using (productid) where agentid=?");
			ps.setString(1, agentid);
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {
				ReturnOrder ro = new ReturnOrder();
				ro.setReturnOrderId(rs.getString("returnOrderId"));
				ro.setReturnOrderQuantity(rs.getInt("returnOrderQuantity"));
				ro.setReturnOrderStatus(rs.getString("returnOrderStatus"));
				Blob blob = rs.getBlob("returnOrderImage");
				
				InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                 
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                 
                 
                inputStream.close();
                outputStream.close();
				ro.setBase64Image(base64Image);
				
				ro.setReturnOrderDescription(rs.getString("returnOrderDescription"));
				ro.setOrderId(rs.getString("orderId"));
				
				roList.add(ro);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			
		}
		return roList;
	}
			
	public void updateStatus(ReturnOrder ro) { //update status
			
			returnOrderStatus = ro.getReturnOrderStatus();
			returnOrderId = ro.getReturnOrderId();
			
			try {
				con = ConnectionManager.getConnection();
				stmt = con.createStatement();
				stmt.executeUpdate("UPDATE returnorder SET returnOrderStatus = '" + returnOrderStatus + "' WHERE returnOrderId = '"+ returnOrderId +"' ");
			}
			catch (Exception ex) {
				ex.printStackTrace();
			}
	}
}