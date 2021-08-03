package product.model;

public class Wet extends Product 
{
		private String flavour;
		private double volume;
		private String productid;
		public String getFlavour() {
			return flavour;
		}
		public void setFlavour(String flavour) {
			this.flavour = flavour;
		}
		public double getVolume() {
			return volume;
		}
		public void setVolume(double volume) {
			this.volume = volume;
		}
		public String getProductid() {
			return productid;
		}
		public void setProductid(String productid) {
			this.productid = productid;
		}
	
}
