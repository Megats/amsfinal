package order.dao;
import order.model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import db.connection.*;

public class ReportDAO {
	static Connection connect = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;

	//View & count specific parcel by month DAO
	public static List<Order> viewsalesbymonth() {
		List<Order> monthly_sales = new ArrayList<Order>();

		try {
			connect = ConnectionManager.getConnection();
			ps = connect.prepareStatement(
					"SELECT DISTINCT(AGENTID),SUM(ORDERQUANTITY) FROM ORDERS GROUP BY AGENTID");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Order order_month_current = new Order();
				order_month_current.setOrderquantity(rs.getInt("SUM(ORDERQUANTITY)"));
				order_month_current.setAgentid(rs.getString("agentid"));

				monthly_sales.add(order_month_current);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return monthly_sales;
	}
}
