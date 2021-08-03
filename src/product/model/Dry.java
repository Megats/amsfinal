package product.model;

public class Dry extends Product 
{
		private String type;
		private double weight;
		private String productid;
		
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public double getWeight() {
			return weight;
		}
		public void setWeight(double weight) {
			this.weight = weight;
		}
		public String getProductid() {
			return productid;
		}
		public void setProductid(String productid) {
			this.productid = productid;
		}
}
