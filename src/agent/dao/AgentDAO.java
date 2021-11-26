package agent.dao;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import db.connection.ConnectionManager;
import agent.model.*;

public class AgentDAO {
	
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	static String id, password;
	static String email,phoneno;
	String agentID, agentName, agentGender, agentPhoneNo, agentAddress, agentPassword, agentStatus,agentEmailAddress;
	Date agentDateAssign;

	//method for login
	public static Agent login(Agent bean) throws NoSuchAlgorithmException{
		//get email and password
		id = bean.getAgentid();
		password = bean.getAgentpassword();

		
		String query = "select * from AGENT where AGENTID='" + id + "'AND AGENTPASSWORD='" + password + "'";

		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
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
	
	//method for verification
		public static Agent verification(Agent bean) throws NoSuchAlgorithmException{
			//get email and password
			email = bean.getAgentemail();
			phoneno = bean.getAgentphoneno();

			
			String query = "select * from AGENT where AGENTEMAIL='" + email + "'OR AGENTPHONENO='" + phoneno + "'";

			try {
				currentCon = ConnectionManager.getConnection();
				stmt = currentCon.createStatement();
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
	

	//get user by email
	public static Agent getAgentByid(String id) {
		Agent ag = new Agent();
		try {
			currentCon = ConnectionManager.getConnection();
			ps=currentCon.prepareStatement("select * from agent where agentid=?");

			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {	            
				ag.setAgentid(rs.getString("agentid"));
				ag.setAgentname(rs.getString("agentname"));
				ag.setAgentemail(rs.getString("agentemail"));
				ag.setAgentstatus(rs.getString("agentstatus"));
				ag.setAgentgender(rs.getString("agentgender"));
				ag.setAgentphoneno(rs.getString("agentphoneno"));
				ag.setAgentDateAssign(rs.getDate("agentDateAssign"));
				ag.setAgentaddress(rs.getString("agentaddress"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return ag;
	}
	
	//Adding agent
		public void addAgent (Agent a) {
			agentID = a.getAgentid();
			agentName = a.getAgentname();
			agentGender = a.getAgentgender();
			agentPhoneNo = a.getAgentphoneno();
			agentEmailAddress = a.getAgentemail();
			agentAddress = a.getAgentaddress();
			agentDateAssign = (Date) a.getAgentDateAssign();
			agentPassword = a.getAgentpassword();
			agentStatus = a.getAgentstatus();
			
			try {
				currentCon = ConnectionManager.getConnection();			
				ps = currentCon.prepareStatement("insert into agent (agentID,agentName,agentGender,agentPhoneNo,agentemail,agentAddress,agentDateAssign,agentPassword,agentStatus) values (?,?,?,?,?,?,?,?,?)");
				ps.setString(1, agentID);
				ps.setString(2, agentName);
				ps.setString(3, agentGender);
				ps.setString(4, agentPhoneNo);
				ps.setString(5, agentEmailAddress);
				ps.setString(6, agentAddress);
				ps.setDate(7, agentDateAssign);
				ps.setString(8, agentPassword);
				ps.setString(9, "ACTIVE");
				
				
				ps.executeUpdate();
			}
			catch (Exception ex) {
				ex.printStackTrace();
			}
			
		}
		
		//List all agents
		public static List<Agent> getAllAgent() {
			List<Agent> agent = new ArrayList<Agent>();
			try {
				currentCon = ConnectionManager.getConnection();
				stmt = currentCon.createStatement();
				ResultSet rs = stmt.executeQuery("select * from agent"); //u INNER JOIN information i ON u.custIC = i.custIC");

				while (rs.next()) {
					Agent a = new Agent();
					a.setAgentid(rs.getString("agentID"));
					a.setAgentname(rs.getString("agentName"));
					a.setAgentphoneno(rs.getString("agentPhoneNo"));
					a.setAgentstatus(rs.getString("agentStatus"));
					//a.setInformation(CustomerDAO.getInformationByCustIC(rs.getString("custIC")));
					agent.add(a);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return agent;
		}
		
		//View individual Agent Information using agentID
		public static Agent getAgentByAgentID(String agentID) {
			Agent a = new Agent();
			
			try {
				currentCon = ConnectionManager.getConnection(); //2. call the method from ConnectionManager class to establish connection	
				//String query = "select * from person where id=?";
				ps = currentCon.prepareStatement("select * from agent where agentID=?");
				ps.setString(1, agentID);
				ResultSet rs = ps.executeQuery(); //4. process the result
				
				if(rs.next()) {
					a.setAgentid(rs.getString("agentID"));
					a.setAgentname(rs.getString("agentName"));
					a.setAgentgender(rs.getString("agentGender"));
					a.setAgentphoneno(rs.getString("agentPhoneNo"));
					a.setAgentaddress(rs.getString("agentAddress"));
					a.setAgentDateAssign(rs.getDate("agentDateAssign"));
					a.setAgentpassword(rs.getString("agentPassword"));
					a.setAgentstatus(rs.getString("agentStatus"));
					
				}
			}
			catch (Exception ex) {
				ex.printStackTrace();
			}
			return a;
		}
		
		//Update Agent Information
		public void update(Agent a) {
			agentID = a.getAgentid();
			agentStatus = a.getAgentstatus();
			System.out.println("agent id to be updated: "+ agentID);
			System.out.println("status to be updated: "+ agentStatus);

			try {
				currentCon = ConnectionManager.getConnection(); // 2. establish connection
				String query = "update agent set agentstatus='"+agentStatus+"' WHERE agentID='"+agentID+"'";
				stmt = currentCon.createStatement(); // 3. create statement
				stmt.executeUpdate(query);

			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		
		
		//Update Agent Personal Information
		public void updateAgentInfo(Agent a) {
			agentID = a.getAgentid();
			agentName = a.getAgentname();
			agentPhoneNo = a.getAgentphoneno();
			agentAddress = a.getAgentaddress();
			agentEmailAddress = a.getAgentemail();
			
			
			try {
				currentCon = ConnectionManager.getConnection(); // 2. establish connection
				String query = "update agent set agentname='"+agentName+"',agentphoneno='"+agentPhoneNo+"',agentaddress='"+agentAddress+"',agentemail='"+agentEmailAddress+"' WHERE agentID='"+agentID+"'";
				stmt = currentCon.createStatement(); // 3. create statement
				stmt.executeUpdate(query);

			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		
		//Update Reset password
		public void updatePassword(Agent a) {
			agentEmailAddress = a.getAgentemail();
			agentPhoneNo = a.getAgentphoneno();
			agentPassword = a.getAgentpassword();
			
			System.out.println("reset email" + agentEmailAddress);
			System.out.println("reset phone" + agentPhoneNo);
			System.out.println("reset pass" + agentPassword);

			try {
				currentCon = ConnectionManager.getConnection(); // 2. establish connection
				String query = "update agent set agentpassword='"+agentPassword+"' WHERE agentemail='"+agentEmailAddress+"'OR AGENTPHONENO='" +agentPhoneNo + "'";
				stmt = currentCon.createStatement(); // 3. create statement
				stmt.executeUpdate(query);

			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		
}
