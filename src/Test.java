import java.io.InputStream;

public class Test {
	String id;
	InputStream pictures;
	private String base64Image;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public InputStream getPictures() {
		return pictures;
	}
	public void setPictures(InputStream inputStream) {
		this.pictures = inputStream;
	}
	public String getBase64Image() {
		return base64Image;
	}
	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}
	
	
}
