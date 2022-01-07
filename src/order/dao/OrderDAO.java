package order.dao;

import java.sql.Connection;
import java.util.*;

import cart.model.Cart;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import order.model.*;
import payment.model.*;
import db.connection.ConnectionManager;

public class OrderDAO {

	static Connection con = null;
	static ResultSet rs = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	String orderid, orderstatus, agentid;
	Date orderdate;
	Date paymentdate;
	int orderquantity;
	double ordertotalprice;
	String paymentid, paymentimage, paymentbank, paymentstatus, productid;

	String getValue;

	// set string auto-increment
	public void generateUniqueid(String passquery) {
		con = ConnectionManager.getConnection();

		try {
			stmt = con.createStatement();
			ResultSet set = stmt.executeQuery(passquery);

			if (set.next()) {
				getValue = (set.getString(1));
			}
			System.out.println("get value success");
		}

		catch (Exception e) {
			System.out.println("Get value failed");
		}

	}

	// set string auto-increment
	public void generateUniquepaymentid(String passquerys) {
		con = ConnectionManager.getConnection();

		try {
			stmt = con.createStatement();
			ResultSet set = stmt.executeQuery(passquerys);

			if (set.next()) {
				getValue = (set.getString(1));
			}
			System.out.println("get value success");
		}

		catch (Exception e) {
			System.out.println("Get value failed");
		}

	}

	// insert data
	public String addOrder(Order bean) {
		// get the date
		orderdate = bean.getOrderdate();
	    


		// convert java date to sql date
		java.sql.Date odate = new java.sql.Date(orderdate.getTime());
		//
		if("select max(orderid) from orders;".length()<7)
			generateUniqueid("select concat(left(max(orderid),5),right(max(orderid),1) +1) from orders");
		
		else
			generateUniqueid("select concat(left(max(orderid),5),right(max(orderid),2) +1) from orders");
		
		
		orderid = getValue;
		System.out.println("Orderid is " + orderid);
		agentid = bean.getAgentid();
		orderquantity = bean.getOrderquantity();
		System.out.println("Total quantity is " + orderquantity);
		ordertotalprice = bean.getOrdertotalprice();

		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement(
					"insert into orders (ORDERID,ORDERDATE,ORDERTOTALPRICE,AGENTID,ORDERQUANTITY) values(?,?,?,?,?)");
			ps.setString(1, orderid);
			ps.setDate(2, odate);
			ps.setDouble(3, ordertotalprice);
			ps.setString(4, agentid);
			ps.setInt(5, orderquantity);
			ps.executeUpdate();
			System.out.println("Succcesfully insert into orders table");
		} catch (Exception ex) {
			System.out.println("Failed to insert into table orders");
			ex.printStackTrace();
		}
		return orderid;
	}

	// insert data
	public void addPayment(Payment bean) {
		// get the date
		paymentdate = bean.getPaymentdate();

		// convert java date to sql date
		java.sql.Date pdate = new java.sql.Date(paymentdate.getTime());
		//PAYMENT
		if("select max(payment) from payment;".length()<9)
			generateUniqueid("select concat(left(max(paymentid),7),right(max(paymentid),1) +1) from payment");
		
		else
			generateUniqueid("select concat(left(max(paymentid),7),right(max(paymentid),2) +1) from payment");

			
		paymentid = getValue;
		orderid = bean.getOrderid();

		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("insert into payment (PAYMENTID,PAYMENTDATE,ORDERID) values(?,?,?)");
			ps.setString(1, paymentid);
			ps.setDate(2, pdate);
			ps.setString(3, orderid);
			ps.executeUpdate();
			System.out.println("Succcesfully insert into table payment");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	// list data for Agent
	public static List<Order> getAllOrdered(String agentid) {
		List<Order> od = new ArrayList<Order>();
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement(
					"select Orders.orderid,Orders.orderstatus,Orders.orderdate,Orders.ordertotalprice,"
							+ "Payment.paymentid,Payment.paymentstatus "
							+ " from Orders INNER JOIN Payment ON Orders.orderid = Payment.orderid where agentid=? order by orderid");
			ps.setString(1, agentid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Order o = new Order();
				o.setOrderid(rs.getString("orderid"));
				o.setOrderstatus(rs.getString("orderstatus"));
				o.setOrderdate(rs.getDate("orderdate"));
				o.setOrdertotalprice(rs.getDouble("ordertotalprice"));
				o.setPaymentid(rs.getString("paymentid"));
				o.setPaymentstatus(rs.getString("paymentstatus"));
				od.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return od;
	}

	// list data for supplier
	public static List<Order> getAllOrderAgent() {
		List<Order> od = new ArrayList<Order>();
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery("select * from orders");
			while (rs.next()) {
				Order o = new Order();
				o.setOrderid(rs.getString("orderid"));
				o.setOrderstatus(rs.getString("orderstatus"));
				o.setOrderdate(rs.getDate("orderdate"));
				o.setOrdertotalprice(rs.getDouble("ordertotalprice"));
				o.setAgentid(rs.getString("agentid"));
				od.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return od;
	}

	// list data specific for supplier
	public static Order getAllOrder(String id) {
		Order od = new Order();
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement(
					"select Orders.orderid,Orders.orderstatus,Orders.orderdate,Orders.ordertotalprice,Orders.agentid,Orders.orderquantity,Payment.paymentid,Payment.paymentstatus,"
							+ "Agent.agentname,Agent.agentaddress,Agent.agentphoneno from Orders "
							+ "INNER JOIN Payment ON Orders.orderid = Payment.orderid INNER JOIN agent ON Orders.agentid = Agent.agentid where Orders.orderid=?");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				od.setOrderid(rs.getString("orderid"));
				od.setOrderstatus(rs.getString("orderstatus"));
				od.setOrderdate(rs.getDate("orderdate"));
				od.setOrdertotalprice(rs.getDouble("ordertotalprice"));
				od.setAgentid(rs.getString("agentid"));
				od.setOrderquantity(rs.getInt("orderquantity"));
				od.setPaymentid(rs.getString("paymentid"));
				od.setPaymentstatus(rs.getString("paymentstatus"));
				od.setAgentname(rs.getString("agentname"));
				od.setAgentaddress(rs.getString("agentaddress"));
				od.setAgentphoneno(rs.getString("agentphoneno"));

			}
		}

		catch (SQLException e) {
			e.printStackTrace();
		}

		return od;
	}

	// update data
	public void update(Order bean) {
		String id = bean.getOrderid();
		orderstatus = bean.getOrderstatus();

		try {
			con = ConnectionManager.getConnection(); // 2. establish connection
			ps = con.prepareStatement("update orders set ORDERSTATUS = ? where orderid = ?");
			ps.setString(1, orderstatus);
			ps.setString(2, id);
			ps.executeUpdate();
		    System.out.println(id);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

	public static Order getOrderById(String orderid) {
		// TODO Auto-generated method stub
		Order od = new Order();
		try {
			con = ConnectionManager.getConnection(); // 2. call the method from ConnectionManager class to establish
														// connection
			// String query = "select * from person where id=?";
			ps = con.prepareStatement("select orderid,orderstatus,orderdate from orders where orderid=?");
			ps.setString(1, orderid);
			ResultSet rs = ps.executeQuery(); // 4. process the result

			if (rs.next()) {
				od.setOrderid(rs.getString("orderid"));
				od.setOrderstatus(rs.getString("orderstatus"));
				od.setOrderdate(rs.getDate("orderdate"));

			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return od;
	}

	public void deleteOrder(String orderid) {
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("DELETE FROM ORDERS WHERE ORDERID = ?");
			ps.setString(1, orderid);
			ps.executeUpdate();
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

}
