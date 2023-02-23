package insta;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import SmartPhone.DBConnection;


public class InstaSQL {
	// Scanner 객체
	Scanner sc = new Scanner(System.in);

	// DB접속을 위한 변수 con 선언
	Connection con = null;

	// 쿼리문 전송을 위한 변수 stmt, pstmt 선언
	Statement stmt = null;
	PreparedStatement pstmt = null;
	// PreparedStatement : 쿼리문에서 '?'를 문자로 인식

	// 조회(select)결과를 저장하기 위한 변수 rs선언
	ResultSet rs = null;

	// 1. DB접속 메소드
	public void connect() {
		con = DBConnection.DBConnect();
	}

	// 2. 접속해제 메소드
	public void conClose() {
		try {
			con.close();

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public void nextpage(InstaDTO ind) {
		String sql = "SELECT COUNT(*) FROM InstaTable";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				ind.setPagesum(rs.getInt(1));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int page =(int)(Math.random()*ind.getPagesum())+1;
		int count=0;
		boolean stop = true;
		sql="SELECT * FROM InstaTable";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()&&stop) {
				if(count==page) {
					ind.setPageid(rs.getString(1));
					ind.setTitle(rs.getString(2));
					ind.setHits(rs.getInt(3)+1);
					ind.setPost(rs.getString(4));
					stop=false;
				}
				count++;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("\n\n\n\n\n\n\n");
		System.out.println("제목 :"+ind.getTitle()+"\t 작성자 :"+ind.getPageid()+"\t 조회수 :"+ind.getHits());
		System.out.println();
		System.out.print("내용 >> ");
		System.out.println(ind.getPost());
		System.out.println();
		
		sql = "UPDATE InstaTable SET Ihits = ? WHERE Iid = ? AND Ititle = ? AND Ipost = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ind.getHits());
			pstmt.setString(2, ind.getPageid());
			pstmt.setString(3, ind.getTitle());
			pstmt.setString(4, ind.getPost());
			int result = pstmt.executeUpdate();

			if (result > 0) {
			} else {
				System.out.println("접속이 불안정합니다!");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void upload(InstaDTO ind) {
		String sql = "INSERT INTO InstaTable VALUES(?, ?, ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,ind.getId());
			pstmt.setString(2,ind.getTitle());
			pstmt.setInt(3,ind.getHits());
			pstmt.setString(4,ind.getPost());
			
			int result = pstmt.executeUpdate();

			if (result > 0) {
				System.out.println("업로드 완료!");
			} else {
				System.out.println("네트워크가 불안정하여 업로드 실패하였습니다.");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void search(InstaDTO ind,String id) {
		String sql = "SELECT * FROM InstaTable WHERE Iid = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rs = pstmt.executeQuery();
				while(rs.next()) {
					ind.setPageid(rs.getString(1));
					ind.setTitle(rs.getString(2));
					ind.setHits(rs.getInt(3)+1);
					ind.setPost(rs.getString(4));
					System.out.println("제목 :"+ind.getTitle()+"\t 작성자 :"+ind.getPageid()+"\t 조회수 :"+ind.getHits());
					System.out.println();
					System.out.print("내용 >> ");
					System.out.println(ind.getPost());
					System.out.println();
					System.out.println("다음글을 보실려면 엔터를 눌러주세요");
					sc.nextLine().trim();
					sql = "UPDATE InstaTable SET Ihits = ? WHERE Iid = ? AND Ititle = ? AND Ipost = ?";
					try {
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, ind.getHits());
						pstmt.setString(2, ind.getPageid());
						pstmt.setString(3, ind.getTitle());
						pstmt.setString(4, ind.getPost());
						int result = pstmt.executeUpdate();

						if (result > 0) {
						} else {
							System.out.println("접속이 불안정합니다!");
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					}
				
			} 
			else {
				
				System.out.println("게시글이 없습니다.");
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
