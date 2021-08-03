package order.model;

import java.util.*;

public class Order {
		String orderid;
		String orderstatus;
		Date orderdate;
		double ordertotalprice;
		int orderquantity;
		String agentid,productid,paymentstatus,paymentid;
		String agentname,agentaddress,agentphoneno;
		String productname;
		int quantity;
		
		public String getPaymentid() {
			return paymentid;
		}
		public void setPaymentid(String paymentid) {
			this.paymentid = paymentid;
		}
		public String getOrderid() {
			return orderid;
		}
		public void setOrderid(String orderid) {
			this.orderid = orderid;
		}
		public String getOrderstatus() {
			return orderstatus;
		}
		public void setOrderstatus(String orderstatus) {
			this.orderstatus = orderstatus;
		}
		public Date getOrderdate() {
			return orderdate;
		}
		public void setOrderdate(Date date1) {
			this.orderdate = date1;
		}
		public double getOrdertotalprice() {
			return ordertotalprice;
		}
		public void setOrdertotalprice(double ordertotalprice) {
			this.ordertotalprice = ordertotalprice;
		}
		public int getOrderquantity() {
			return orderquantity;
		}
		public void setOrderquantity(int orderquantity) {
			this.orderquantity = orderquantity;
		}
		public String getAgentid() {
			return agentid;
		}
		public void setAgentid(String agentid) {
			this.agentid = agentid;
		}
		public String getProductid() {
			return productid;
		}
		public void setProductid(String productid) {
			this.productid = productid;
		}
		public String getPaymentstatus() {
			return paymentstatus;
		}
		public void setPaymentstatus(String paymentstatus) {
			this.paymentstatus = paymentstatus;
		}
		public String getAgentname() {
			return agentname;
		}
		public void setAgentname(String agentname) {
			this.agentname = agentname;
		}
		public String getAgentaddress() {
			return agentaddress;
		}
		public void setAgentaddress(String agentaddress) {
			this.agentaddress = agentaddress;
		}
		public String getAgentphoneno() {
			return agentphoneno;
		}
		public void setAgentphoneno(String agentphoneno) {
			this.agentphoneno = agentphoneno;
		}
		public String getProductname() {
			return productname;
		}
		public void setProductname(String productname) {
			this.productname = productname;
		}
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		
		
		
}
