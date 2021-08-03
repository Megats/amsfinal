
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import db.connection.ConnectionManager;

public class TestDAO {
	static Connection con = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	String id;
	InputStream pictures;
	
	
	//insert data
	public void addPictures(Test bean)  
	{
		
		id = bean.getId();
		pictures = bean.getPictures();

		try {
			con = ConnectionManager.getConnection(); //2. establish connection			
			ps  = con.prepareStatement("update product set productpicture = ? where productid = ?");
		    ps.setBlob(1,pictures);
		    ps.setString(2, id);
		    ps.executeUpdate();
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	//list data for supplier
	public static List<Test> getAllTest() throws IOException {
		List<Test> ts = new ArrayList<Test>();
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery("select * from test");
			while (rs.next()) {
				Test o = new Test();
				o.setId(rs.getString("id"));
				Blob blob = rs.getBlob("pictures");
                
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                 
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                 
                o.setBase64Image(base64Image);
                ts.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return ts;
	}
	
	
	
}
