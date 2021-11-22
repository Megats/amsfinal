package supplier.dao;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import agent.model.Agent;
import supplier.model.*;
import db.connection.ConnectionManager;

public class SupplierDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static Statement stat = null;
	static Statement stmt = null;
	
	static String supplierID;
	static String supplierName;
	static String supplierPassword;
	static String email,phoneno;
    String supplierPosition;
	String adminID;
	
	//method for login
		public static Supplier login(Supplier bean) throws NoSuchAlgorithmException{
			//get email and password
			supplierID = bean.getSupplierID();
			supplierPassword = bean.getSupplierPassword();
			
			String query = "select * from SUPPLIER where SUPPLIERID='" + supplierID + "'AND SUPPLIERPASSWORD='" + supplierPassword + "'";

			try {
				con = ConnectionManager.getConnection();
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				System.out.println("Connected to database");
				boolean more = rs.next();

				// if user exists set the isValid variable to true
				if (more) {
					System.out.println("User exist");
					String id = rs.getString("supplierID");
					bean.setSupplierID(id);
					bean.setSupplierName(rs.getString("suppliername"));
					bean.setSupplierPosition(rs.getString("supplierposition"));
					bean.setValid(true);
				}
				// if user does not exist set the isValid variable to false
				else if (!more) {
					System.out.println("Not exist");
					bean.setValid(false);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

			return bean;
			
			
		}
		
		
		/*//method for verification
				public static Supplier verification(Agent bean) throws NoSuchAlgorithmException{
					//get email and password
					email = bean.getAgentemail();
					phoneno = bean.getAgentphoneno();

					
					String query = "select * from AGENT where AGENTEMAIL='" + email + "'OR AGENTPHONENO='" + phoneno + "'";

					try {
						con = ConnectionManager.getConnection();
						stmt = con.createStatement();
						rs = stmt.executeQuery(query);
						boolean more = rs.next();

						// if user exists set the isValid variable to true
						if (more) {
							System.out.println("User exist");
							String id = rs.getString("agentid");
							String agentemail = rs.getString("agentemail");
							bean.setAgentid(id);
							bean.setAgentemail(agentemail);
							
							bean.setValid(true);
						}
						// if user does not exist set the isValid variable to false
						else if (!more) {
							System.out.println("Not exist");
							bean.setValid(false);
						}

					} catch (SQLException e) {
						e.printStackTrace();
					}

					return bean;
					
					
				}
*/
	
	//Adding supplier
	public void addSupplier (Supplier s) {
		supplierID = s.getSupplierID();
		supplierName = s.getSupplierName();
		supplierPassword = s.getSupplierPassword();
		supplierPosition = s.getSupplierPosition();
		adminID = s.getAdminID();
		
		try {
			con = ConnectionManager.getConnection();			
			ps = con.prepareStatement("insert into supplier (supplierID,supplierName,supplierPassword,supplierPosition, adminID) values (?,?,?,?,?)");
			ps.setString(1, supplierID);
			ps.setString(2, supplierName);
			ps.setString(3, supplierPassword);
			ps.setString(4, supplierPosition);
			ps.setString(5, adminID);
			
			
			ps.executeUpdate();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	//List Supplier 
	public static List<Supplier> getAllSupplier() {
		List<Supplier> supp = new ArrayList<Supplier>();
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from SUPPLIER"); //u INNER JOIN information i ON u.custIC = i.custIC");

			while (rs.next()) {
				Supplier s = new Supplier();
				s.setSupplierID(rs.getString("supplierid"));
				s.setSupplierName(rs.getString("suppliername"));
				s.setSupplierPosition(rs.getString("supplierposition"));
				s.setAdminID(rs.getString("adminid"));
				//a.setInformation(CustomerDAO.getInformationByCustIC(rs.getString("custIC")));
				supp.add(s);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return supp;
	}
	
	//View Individual Supplier
	public static Supplier getSupplierBySupplierID(String supplierID) {
		Supplier s = new Supplier();
		
		try {
			con = ConnectionManager.getConnection(); //2. call the method from ConnectionManager class to establish connection	
			//String query = "select * from person where id=?";
			ps = con.prepareStatement("select * from SUPPLIER where supplierID=?");
			ps.setString(1, supplierID);
			ResultSet rs = ps.executeQuery(); //4. process the result
			
			if(rs.next()) {
				s.setSupplierID(rs.getString("supplierID"));
				s.setSupplierName(rs.getString("supplierName"));
				s.setSupplierPassword(rs.getString("supplierPassword"));
				s.setSupplierPosition(rs.getString("supplierPosition"));
				s.setAdminID(rs.getString("adminID"));
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		return s;
	}

	//Update Supplier List
	public void update(Supplier s) {
		supplierID = s.getSupplierID();
		supplierName = s.getSupplierName();
		supplierPassword = s.getSupplierPassword();
		try {
			con = ConnectionManager.getConnection(); // 2. establish connection
			String query = "update supplier set supplierName= '" + supplierName + "',supplierPassword= '" + supplierPassword + "'WHERE supplierID='"+supplierID+"'";
			stmt = con.createStatement(); // 3. create statement
			stmt.executeUpdate(query);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
