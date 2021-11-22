package payment.dao;

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

import payment.model.*;
import db.connection.ConnectionManager;
import order.model.Order;

public class PaymentDAO {

	static Connection con = null;
	static ResultSet rs = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	String paymentid, paymentdate, paymentbank, paymentstatus, orderid;
	String bank;
	InputStream paymentimage;

	// list data
	public static List<Payment> getAllPayment() throws IOException {
		List<Payment> pm = new ArrayList<Payment>();
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from payment");
			while (rs.next()) {
				Payment p = new Payment();
				p.setPaymentid(rs.getString("paymentid"));
				if (rs.getBlob("paymentimage") != null) {
					Blob blob = rs.getBlob("paymentimage");
					InputStream inputStream = blob.getBinaryStream();
					ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
					byte[] buffer = new byte[4096];
					int bytesRead = -1;

					while ((bytesRead = inputStream.read(buffer)) != -1) {
						outputStream.write(buffer, 0, bytesRead);
					}

					byte[] imageBytes = outputStream.toByteArray();
					String base64Image = Base64.getEncoder().encodeToString(imageBytes);
					p.setBase64Image(base64Image);
				} else {
					p.setBase64Image("No image");
				}
				p.setPaymentdate(rs.getDate("paymentdate"));
				p.setPaymentbank(rs.getString("paymentbank"));
				p.setPaymentstatus(rs.getString("paymentstatus"));
				p.setOrderid(rs.getString("orderid"));
				pm.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return pm;
	}

	// list data for Agent
	public static Payment getPayment(String id) throws IOException {
		Payment pm = new Payment();

		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("select * from payment where paymentid=?");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				pm.setPaymentid(rs.getString("paymentid"));
				if (rs.getBlob("paymentimage") != null) {
					Blob blob = rs.getBlob("paymentimage");
					InputStream inputStream = blob.getBinaryStream();
					ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
					byte[] buffer = new byte[4096];
					int bytesRead = -1;

					while ((bytesRead = inputStream.read(buffer)) != -1) {
						outputStream.write(buffer, 0, bytesRead);
					}

					byte[] imageBytes = outputStream.toByteArray();
					String base64Image = Base64.getEncoder().encodeToString(imageBytes);
					pm.setBase64Image(base64Image);
				}
				pm.setPaymentdate(rs.getDate("paymentdate"));
				pm.setPaymentbank(rs.getString("paymentbank"));
				pm.setPaymentstatus(rs.getString("paymentstatus"));
				pm.setOrderid(rs.getString("orderid"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return pm;
	}

	// list data for after after successfully make order
	public static Payment getPaymentByOrderId(String orderid) throws IOException {
		Payment pm = new Payment();

		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("select * from payment where orderid=?");
			ps.setString(1, orderid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				pm.setPaymentid(rs.getString("paymentid"));
				if (rs.getBlob("paymentimage") != null) {
					Blob blob = rs.getBlob("paymentimage");
					InputStream inputStream = blob.getBinaryStream();
					ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
					byte[] buffer = new byte[4096];
					int bytesRead = -1;

					while ((bytesRead = inputStream.read(buffer)) != -1) {
						outputStream.write(buffer, 0, bytesRead);
					}

					byte[] imageBytes = outputStream.toByteArray();
					String base64Image = Base64.getEncoder().encodeToString(imageBytes);
					pm.setBase64Image(base64Image);
				}
				pm.setPaymentdate(rs.getDate("paymentdate"));
				pm.setPaymentbank(rs.getString("paymentbank"));
				pm.setPaymentstatus(rs.getString("paymentstatus"));
				pm.setOrderid(rs.getString("orderid"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return pm;
	}

	// update payment for agent
	public void update(Payment bean) {
		paymentid = bean.getPaymentid();
		bank = bean.getPaymentbank();
		paymentimage = bean.getPaymentimage();
		System.out.println("paymentid at DAO is " + paymentid);

		try {
			con = ConnectionManager.getConnection(); // 2. establish connection
			ps = con.prepareStatement("update payment set paymentimage = ?, paymentbank= ? where paymentid = ?");
			ps.setBlob(1, paymentimage);
			ps.setString(2, bank);
			ps.setString(3, paymentid);
			ps.executeUpdate();
			System.out.println("Successfully update payment for agent");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	// update payment for supplier
	public void updatePaymentById(Payment bean) {
		paymentid = bean.getPaymentid();
		paymentstatus = bean.getPaymentstatus();
		System.out.println("Payment status " + paymentstatus);

		try {
			con = ConnectionManager.getConnection(); // 2. establish connection
			ps = con.prepareStatement("update payment set paymentstatus = ? where paymentid = ?");
			ps.setString(1, paymentstatus);
			ps.setString(2, paymentid);
			ps.executeUpdate();
			System.out.println("Successfully update payment for supplier");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void deletePayment(String orderid) {
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("DELETE FROM PAYMENT WHERE ORDERID = ?");
			ps.setString(1, orderid);
			ps.executeUpdate();
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}
}
