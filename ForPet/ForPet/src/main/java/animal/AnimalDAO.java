package animal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AnimalDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public AnimalDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/PET";
			String dbID ="root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL , dbID , dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	public int getNext() {
		String SQL = "SELECT animalID FROM animal ORDER BY animalID DESC ";
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;//첫 번째 게시물인 경우
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int insert(String animalTitle,String animalLost,String userPhone,String animalGender,String animalKind,String fileName ) {
		String SQL = "INSERT INTO ANIMAL VALUES (?, ?, ?, ?, ?,?,? )";
		try {/* (animalID,animalTitle,animalLost,userPhone,animalGender,animalKind) */
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, animalTitle);
			pstmt.setString(3, animalLost);
			pstmt.setString(4, userPhone);
			pstmt.setString(5, animalGender);
			pstmt.setString(6, animalKind);
			pstmt.setString(7, fileName);
			/* pstmt.setString(7, animal.getAnimalPic()); */
			
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
		
	}
	
	public ArrayList<Animal> getList(int pageNumber){
		String SQL = "SELECT * FROM animal WHERE animalID < ? ORDER BY animalID DESC LIMIT 10 ";
		ArrayList<Animal> list = new ArrayList<Animal>();
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, getNext()-(pageNumber - 1) * 10);
			 rs = pstmt.executeQuery();
			while(rs.next()) {
				Animal animal = new Animal();
				animal.setAnimalID(rs.getInt(1));
				animal.setAnimalTitle(rs.getString(2));
				animal.setAnimalLost(rs.getString(3));
				animal.setUserPhone(rs.getString(4));
				animal.setAnimalGender(rs.getString(5));
				animal.setAnimalKind(rs.getString(6));
				 animal.setAnimalPic(rs.getString(7)); 
				list.add(animal);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM animal WHERE animalID < ? ";
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, getNext()-(pageNumber - 1) * 10);
			 rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public Animal getAnimal(int animalID) {
		String SQL = "SELECT * FROM animal WHERE animalID = ? ";
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, animalID);
			 rs = pstmt.executeQuery();
			if(rs.next()) {
				Animal animal = new Animal();
				animal.setAnimalID(rs.getInt(1));
				animal.setAnimalTitle(rs.getString(2));
				animal.setAnimalLost(rs.getString(3));
				animal.setUserPhone(rs.getString(4));
				animal.setAnimalGender(rs.getString(5));
				animal.setAnimalKind(rs.getString(6));
				animal.setAnimalPic(rs.getString(7)); 
				return animal;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int update(int animalID, String animalTitle, String animalLost, String userPhone, String animalGender, String animalKind  ) {
		String SQL = "UPDATE ANIMAL SET animalTitle = ?, animalLost = ?, userPhone = ?, animalGender = ?, animalKind = ? WHERE animalID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, animalTitle);
			pstmt.setString(2, animalLost);
			pstmt.setString(3, userPhone);
			pstmt.setString(4, animalGender);
			pstmt.setString(5, animalKind);
			pstmt.setInt(6, animalID);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//
	}
	public int delete(int animalID) {
		String SQL = "DELETE FROM ANIMAL WHERE animalId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, animalID);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//
	}
	
}
