package returnorder.model;

import java.io.InputStream;

public class ReturnOrder {
	private String returnOrderId;
	private int returnOrderQuantity;
	private String returnOrderStatus;
	private InputStream returnOrderImage;
	private String returnOrderDescription;
	private String orderId;
	private String productId;
	String base64Image;

	
	public String getReturnOrderId() {
		return returnOrderId;
	}
	public void setReturnOrderId(String returnOrderId) {
		this.returnOrderId = returnOrderId;
	}
	public int getReturnOrderQuantity() {
		return returnOrderQuantity;
	}
	public void setReturnOrderQuantity(int returnOrderQuantity) {
		this.returnOrderQuantity = returnOrderQuantity;
	}
	public String getReturnOrderStatus() {
		return returnOrderStatus;
	}
	public void setReturnOrderStatus(String returnOrderStatus) {
		this.returnOrderStatus = returnOrderStatus;
	}
	public InputStream getReturnOrderImage() {
		return returnOrderImage;
	}
	public void setReturnOrderImage(InputStream returnOrderImage) {
		this.returnOrderImage = returnOrderImage;
	}
	public String getReturnOrderDescription() {
		return returnOrderDescription;
	}
	public void setReturnOrderDescription(String returnOrderDescription) {
		this.returnOrderDescription = returnOrderDescription;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getBase64Image() {
		return base64Image;
	}
	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}

	
}
