package cart.dao;
import cart.model.*;

import java.sql.*;
import db.connection.*;
import java.util.*;

public class CartDAO {
	static Connection con = null;
    static ResultSet rs = null; 
    static PreparedStatement ps=null;
    static Statement stmt=null;
    String orderid,productid;
    double totalprice;
    int quantity;
	static String getValue;

    
	//set string auto-increment
	public static void generateUniqueOrderid(String passquerys)
	{
		con = ConnectionManager.getConnection();
		
		try
		{
			stmt = con.createStatement();
			ResultSet set = stmt.executeQuery(passquerys);
			
			if(set.next())
			{
				getValue = set.getString(1);
			}
			System.out.println("get value success");
		}
		
		catch(Exception e)
		{
			System.out.println("Get value failed");
		}
		
	}
    
	public static void addCart(Cart bean)  
	{
		
		generateUniqueOrderid("SELECT ORDERID FROM ORDERS ORDER BY NO DESC LIMIT 1");
		String orderid = getValue;
		System.out.println("Order id at addCart is "+orderid);
		double totalprice = bean.getProducttotalprice();
		System.out.println("totalprice at addCart DAO is "+totalprice);
		String productid = bean.getProductid();
		int quantity = bean.getProductquantity();
		
		try {
			con = ConnectionManager.getConnection();
			ps  = con.prepareStatement("insert into orderdetail (totalprice,quantity,orderid,productid) values (?,?,?,?)");
			ps.setDouble(1, totalprice);
			ps.setInt(2, quantity);
			ps.setString(3,  orderid);
			ps.setString(4, productid);
			ps.executeUpdate();
			System.out.println("INSERT!");
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	//view data
	public static Cart getCartById(String productid) {
		System.out.println("Product id in cart is "+productid);
		Cart c = new Cart();
		try {
			con = ConnectionManager.getConnection(); //2. call the method from ConnectionManager class to establish connection	
			//String query = "select * from person where id=?";
			ps = con.prepareStatement("select * from orderdetail where productid=?");
			ps.setString(1, productid);
			ResultSet rs = ps.executeQuery(); //4. process the result
			
			if(rs.next()) {
				c.setProducttotalprice(rs.getDouble("totalprice"));
				c.setProductquantity(rs.getInt("quantity"));
				c.setProductid(rs.getString("productid"));
				c.setOrderid(rs.getString("orderid"));
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		return c;
	}
	
	//view data
		public static Cart selectProductById(String productid) {
			double total = 0;
			Cart c = new Cart();
			try {
				con = ConnectionManager.getConnection(); //2. call the method from ConnectionManager class to establish connection	
				//String query = "select * from person where id=?";
				ps = con.prepareStatement("select productid,productname,productprice from product where productid=?");
				ps.setString(1, productid);
				ResultSet rs = ps.executeQuery(); //4. process the result
				
				if(rs.next()) {
					c.setProductid(rs.getString("productid"));
					c.setProductname(rs.getString("productname"));
					c.setProductprice(rs.getDouble("productprice"));
					total = total + c.getProductprice();
					c.setProducttotalprice(total);
				}
			}
			catch (Exception ex) {
				ex.printStackTrace();
			}
			return c;
		}
		
		//Order detail
		public static List<Cart> getOrderById(String orderid) {
			List<Cart> roList = new ArrayList<Cart>();

			try {
				con = ConnectionManager.getConnection(); //2. call the method from ConnectionManager class to establish connection	
				//String query = "select * from person where id=?";
				ps = con.prepareStatement("select productid,productname,productprice,quantity from product join orderdetail using (productid) join orders using (orderid) where orderid=?");
				ps.setString(1, orderid);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					Cart c = new Cart();
					c.setProductid(rs.getString("productid"));
					c.setProductname(rs.getString("productname"));
					c.setProductprice(rs.getDouble("productprice"));
					c.setProductquantity(rs.getInt("quantity"));
					roList.add(c);
				}
			}
			catch (Exception ex) {
				ex.printStackTrace();
				
			}
			return roList;
		}

      
		public void deleteCart(String orderid)
		{
			try {
	            con = ConnectionManager.getConnection();
	            ps = con.prepareStatement("DELETE FROM ORDERDETAIL WHERE ORDERID = ?");
	            ps.setString(1, orderid );
	            ps.executeUpdate();
	            con.close();
			}
			 catch (Exception ex) 
			{
		         ex.printStackTrace();
		    }
			
		}
   
}