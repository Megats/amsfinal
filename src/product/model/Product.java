package product.model;

import java.io.InputStream;
import java.sql.Blob;
import java.util.ArrayList;
import order.model.*;
import cart.model.*;
public class Product {
	String productName, productDescription, productType,productId,supplierid;
	InputStream productPicture;
	String base64Image;
	int productQuantity;
	double productPrice;
	Order order;
	Cart cart;
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public InputStream getProductPicture() {
		return productPicture;
	}
	public void setProductPicture(InputStream productPicture) {
		this.productPicture = productPicture;
	}
	public String getBase64Image() {
		return base64Image;
	}
	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}
	public int getProductQuantity() {
		return productQuantity;
	}
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	public double getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public String getSupplierid() {
		return supplierid;
	}
	public void setSupplierid(String supplierid) {
		this.supplierid = supplierid;
	}
	
	
}
		

