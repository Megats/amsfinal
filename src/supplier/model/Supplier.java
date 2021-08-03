package supplier.model;

public class Supplier {
	private String supplierID;
	private String supplierName;
	private String supplierPassword;
	private String supplierPosition;
	private String adminID;
	private boolean valid;

	
	public String getSupplierID() {
		return supplierID;
	}
	public void setSupplierID(String suplierID) {
		this.supplierID = suplierID;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getSupplierPassword() {
		return supplierPassword;
	}
	public void setSupplierPassword(String supplierPassword) {
		this.supplierPassword = supplierPassword;
	}
	public String getSupplierPosition() {
		return supplierPosition;
	}
	public void setSupplierPosition(String supplierPosition) {
		this.supplierPosition = supplierPosition;
	}
	public String getAdminID() {
		return adminID;
	}
	public void setAdminID(String adminID) {
		this.adminID = adminID;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	
	
}
