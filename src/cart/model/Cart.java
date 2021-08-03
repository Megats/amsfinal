package cart.model;

public class Cart {

	private String orderid;
	private String cartid;
	String productid;
	String productname;
	double productprice;
	int productquantity;
	double producttotalprice;
	
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getCartid() {
		return cartid;
	}
	public void setCartid(String cartid) {
		this.cartid = cartid;
	}
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public double getProductprice() {
		return productprice;
	}
	public void setProductprice(double productprice) {
		this.productprice = productprice;
	}
	public int getProductquantity() {
		return productquantity;
	}
	public void setProductquantity(int productquantity) {
		this.productquantity = productquantity;
	}
	public double getProducttotalprice() {
		return producttotalprice;
	}
	public void setProducttotalprice(double producttotalprice) {
		this.producttotalprice = producttotalprice;
	}
	
	public double totalprice(double productprice,int productquantity) 
	{
		producttotalprice = productprice*productquantity;
		return producttotalprice;
	}

}
