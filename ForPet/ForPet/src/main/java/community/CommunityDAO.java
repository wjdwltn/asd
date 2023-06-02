package community;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import animal.Animal;

public class CommunityDAO {
	private Connection conn;
	private ResultSet rs;
	
	public CommunityDAO() {
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
	public String getDate() { //현재 시간 나타내주는 함수
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
		return "";//데이터 베이스 오류
	}
	public int getNext() {
		String SQL = "SELECT idx FROM community ORDER BY idx DESC ";
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
	public int insert(String userID,String c_title,String c_content,String c_pic ) {
		String SQL = "INSERT INTO COMMUNITY VALUES (?, ?, ?, ?, ?,?,? )";
		try {/* (animalID,animalTitle,animalLost,userPhone,animalGender,animalKind) */
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userID);
			pstmt.setString(3, c_title);
			pstmt.setString(4, c_content);
			pstmt.setString(5, getDate());
			pstmt.setString(6, c_pic);
			pstmt.setInt(7, 0);

			
			  // pstmt.setString(7, getCount());
			 			/* pstmt.setString(7, animal.getAnimalPic()); */
			
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
		
	}
	public ArrayList<Community> getList(int pageNumber){
		String SQL = "SELECT * FROM community WHERE idx < ? ORDER BY idx DESC LIMIT 10 ";
		ArrayList<Community> list = new ArrayList<Community>();
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, getNext()-(pageNumber - 1) * 10);
			 rs = pstmt.executeQuery();
			while(rs.next()) {
				Community community = new Community();
				community.setIdx(rs.getInt(1));
				community.setUserID(rs.getString(2));
				community.setC_title(rs.getString(3));
				community.setC_content(rs.getString(4));
				community.setC_date(rs.getString(5));
				community.setC_pic(rs.getString(6));
				community.setC_count(rs.getInt(7)); 
				list.add(community);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM community WHERE idx < ? ";
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
	public Community getCommunity(int idx) {
		String SQL = "SELECT * FROM community WHERE idx = ? ";
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, idx);
			 rs = pstmt.executeQuery();
			if(rs.next()) {
				Community community = new Community();
				community.setUserID(rs.getString(2));
				community.setC_title(rs.getString(3));
				community.setC_content(rs.getString(4));
				community.setC_date(rs.getString(5));
				community.setC_pic(rs.getString(6));
				community.setC_count(rs.getInt(7)); 
				/* animal.setAnimalPic(rs.getString(7)); */
				return community;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int update(int idx,String c_title,String c_content,String c_pic  ) {
		String SQL = "UPDATE community SET c_title = ?, c_content = ?, c_pic = ? WHERE idx = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, c_title);
			pstmt.setString(2, c_content);
			pstmt.setString(3, c_pic);
			pstmt.setInt(4,idx );
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//
	}
	public int delete(int idx) {
		String SQL = "DELETE FROM community WHERE idx = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, idx);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//
	}
}
