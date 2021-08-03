package payment.model;
import java.util.*;
import java.io.InputStream;
import java.sql.Blob;

public class Payment {
		String paymentid,paymentbank,paymentstatus,orderid;
		Date paymentdate;
		InputStream paymentimage;
		private String base64Image;
		
		public String getPaymentid() {
			return paymentid;
		}
		public void setPaymentid(String paymentid) {
			this.paymentid = paymentid;
		}

		public InputStream getPaymentimage() {
			return paymentimage;
		}
		public void setPaymentimage(InputStream paymentimage) {
			this.paymentimage = paymentimage;
		}
		public String getPaymentbank() {
			return paymentbank;
		}
		public void setPaymentbank(String paymentbank) {
			this.paymentbank = paymentbank;
		}
		public String getPaymentstatus() {
			return paymentstatus;
		}
		public void setPaymentstatus(String paymentstatus) {
			this.paymentstatus = paymentstatus;
		}
		public Date getPaymentdate() {
			return paymentdate;
		}
		public void setPaymentdate(Date paymentdate) {
			this.paymentdate = paymentdate;
		}
		public String getOrderid() {
			return orderid;
		}
		public void setOrderid(String orderid) {
			this.orderid = orderid;
		}
		public String getBase64Image() {
			return base64Image;
		}
		public void setBase64Image(String base64Image) {
			this.base64Image = base64Image;
		}
		
		
		
}
