package Test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import SmartPhone.DBConnection;


public class RaceSQL {
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
		
		public void connect() {
			con = DBConnection.DBConnect();
		}
		// 2. 접속 해제 메소드
		public void conClose() {
			try {
				con.close();
				System.out.println("접속해제");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		public int[] raceget(RaceDTO rd) {
			int win[]=new int[4];
			String sql = "SELECT WIN FROM RACEWINCOUNT";
			int cc = 0;
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					
					win[cc] = rs.getInt(1);
					cc++;
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return win;
		}
		public void raceUp(int player,int win) {
			String sql = "UPDATE RACEWINCOUNT SET WIN = ?  WHERE PLAYER = ?";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, win);
				pstmt.setInt(2, player);
				
				int result =pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	


}
