package product.dao;

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
import product.model.Dry;
import product.model.Product;
import product.model.Wet;

public class ProductDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static String productId;
	String productName, productDescription, productType, type,supplierid;
	InputStream productPicture;
	int productQuantity;
	static int cartquantity;
	double productPrice, weight, volume;;
    int getValue;
	String flavour,typedry;
	
	public void addProduct(Product p) {
		productId = p.getProductId();
		productName = p.getProductName();
		productDescription = p.getProductDescription();
		productType = p.getProductType();
		productPicture = p.getProductPicture();
		productQuantity = p.getProductQuantity();
		productPrice = p.getProductPrice();
		supplierid = p.getSupplierid();
		
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("INSERT INTO product (productId, productName, productDescription, productType, productPicture, productQuantity, productPrice,supplierid) VALUES (?,?,?,?,?,?,?,?)");
			//File imgfile = new File("productPicture");
			//FileInputStream fin = new FileInputStream(imgfile);
			ps.setString(1, productId);
			ps.setString(2, productName);
			ps.setString(3, productDescription);
			ps.setString(4, productType);
			ps.setBlob(5, productPicture);
			ps.setInt(6, productQuantity);
			ps.setDouble(7, productPrice);
			ps.setString(8, supplierid);
			
			ps.executeUpdate();
			con.close();
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public void addDry(Dry d) {
		typedry = d.getType();
		weight = d.getWeight();
		productId = d.getProductId();
		
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("INSERT INTO dry (type, weight, productId) VALUES (?, ?, ?)");
			ps.setString(1, typedry);
			ps.setDouble(2, weight);
			ps.setString(3, productId);
			ps.executeUpdate();
			con.close();
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}	
	}
	
	public void addWet(Wet w) {
		flavour = w.getFlavour();
		volume = w.getVolume();
		productId = w.getProductId();
		
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("INSERT INTO wet (flavour, volume, productId) VALUES (?, ?, ?)");
			ps.setString(1, flavour);
			ps.setDouble(2, volume);
			ps.setString(3, productId);
			ps.executeUpdate();
			con.close();
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}	
	}
	

	
	public static List<Product> getAllProduct() throws IOException { //all product
		List<Product> prod = new ArrayList<Product>();
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from product order by PRODUCTID");
			
			while(rs.next()) {
				Product p = new Product();
				p.setProductId(rs.getString("productId"));
				p.setProductName(rs.getString("productName"));
				p.setProductQuantity(rs.getInt("productQuantity"));
				p.setProductPrice(rs.getDouble("productPrice"));
				p.setProductDescription(rs.getString("productDescription"));
				p.setProductType(rs.getString("productType"));
				Blob blob = rs.getBlob("productPicture");
                
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
				p.setBase64Image(base64Image);
				
				prod.add(p);
				
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			
		}
		return prod;
	}
	
	public static Product getProductByID(String productid) { //view product by product id
		Product p = new Product();
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("select * from product where productId=?");
			ps.setString(1, productid);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				
				Blob blob = rs.getBlob("productPicture");
                
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
				
				p.setProductId(rs.getString("productId"));
				p.setProductName(rs.getString("productName"));
				p.setProductDescription(rs.getString("productDescription"));
				p.setProductType(rs.getString("productType"));
				p.setBase64Image(base64Image);
				p.setProductQuantity(rs.getInt("productQuantity"));
				p.setProductPrice(rs.getDouble("productPrice"));
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
			
		}
		return p;
	}
	
	public void updateProduct(Product p) {
        productId = p.getProductId();
        productQuantity = p.getProductQuantity();

        try {
            con = ConnectionManager.getConnection();
            ps = con.prepareStatement("update product set productquantity = (productquantity+ ?)  where productid = ?");
            ps.setInt(1, productQuantity );
            ps.setString(2, productId);
            ps.executeUpdate();
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
	}
	
	//set string auto-increment
		public void generateUniqueOrderid(String passquerys)
		{
			con = ConnectionManager.getConnection();
			
			try
			{
				stmt = con.createStatement();
				ResultSet set = stmt.executeQuery(passquerys);
				
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
	
	
	//tolak quantity
	public static void updateProductByProductID(Product p) {
		
		productId = p.getProductId();
		System.out.println("Productid to substract is "+productId);
		cartquantity = p.getProductQuantity();
		System.out.println("Quantity to minus is "+cartquantity);
		
		try {
            con = ConnectionManager.getConnection();
            ps = con.prepareStatement("UPDATE product SET productquantity = (productquantity- ?) where productid = ?");
            ps.setInt(1, cartquantity );
            ps.setString(2, productId);
            ps.executeUpdate();
            con.close();
        }
        catch(Exception ex) {
            ex.printStackTrace();
        }
	}
}
