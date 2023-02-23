package eta;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import SmartPhone.DBConnection;





public class etaSQL {
	// DB접속을 위한 변수 con 선언
		Connection con = null;

		// 쿼리문 전송을 위한 변수 stmt, pstmt 선언
		Statement stmt = null;
		PreparedStatement pstmt = null;
		// PreparedStatement: 쿼리문에서 '?'를 문자로 인식

		// 조회(select)결과를 저장하기 위한 변수 rs선언
		ResultSet rs = null;

		// 1.DB 접속 메소드
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


	public void setScdt(ScdDTO scd) {
			String sql = "INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, ?, ?, ?, ?)";
			try {
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, scd.getmId());
				pstmt.setString(2, scd.getDotw());
				pstmt.setString(3, scd.getPeriod());
				pstmt.setString(4, scd.getSubject());
				
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
		}
				
	}
	//아이디 확인 메소드
	public boolean idCheck(String mId) {
		String sql = "SELECT mId FROM SCHEDULE WHERE mId=?";

		boolean checkResult = true;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mId);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				checkResult = false;
				System.out.println("해당 아이디의 시간표가 존재합니다.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return checkResult;
	}
	
	//시간표 출력 메소드
	public void Showsche(String mId, String dotw)
	{String sql="SELECT SUBJECT FROM SCHEDULE WHERE MID=? AND DOTW=? ORDER BY PERIOD";
	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mId);
		pstmt.setString(2, dotw);
		
		rs = pstmt.executeQuery();	
		System.out.print(dotw+" : " );
		while (rs.next()) {
			if(rs.getString(1) != null) {
				System.out.print(rs.getString(1)+"\t");
			}
			else
			{System.out.print("\t");}
		}
		System.out.println();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	}

	//부분 수정 메소드
	public void ScheModify(String subject, String dotw, String period,String mId) {
		// TODO Auto-generated method stub
		String sql = "UPDATE SCHEDULE SET SUBJECT=? WHERE DOTW=? AND PERIOD=? AND mId=?";
		

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, subject);
			pstmt.setString(2, dotw);
			pstmt.setString(3, period);
			pstmt.setString(4, mId);

			int result=pstmt.executeUpdate();
			if (result > 0) {
				System.out.println(dotw+" "+period+" 수업이 "+subject +"(으)로 변경되었습니다.");
			} else {
				System.out.println("잘못 입력되어 수정에 실패했습니다.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//삭제 메소드
	public void delSche(String id) {
		String sql = "DELETE FROM SCHEDULE WHERE MID=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			int result = pstmt.executeUpdate();
			if (result > 0) {
				System.out.println("삭제 성공!");
			} else {
				System.out.println("삭제 실패!");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	//게시글 목록 확인
	public void PSearch()
	{String sql="SELECT CH,TITTLE,MID,VIEWS FROM POST ORDER BY CH";
	try {
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery(sql);
		while (rs.next()) {
			System.out.print("No."+rs.getInt(1)+"\t");
			System.out.print(rs.getString(2)+"\t");
			System.out.print(rs.getString(3)+"\t");
			System.out.print(rs.getInt(4));
			System.out.println();
		}
		System.out.println();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	}
	//게시글 확인(선택 조회수+1)
	public void pSel(int CH)
	{String sql="SELECT TITTLE,MID,WRITING FROM POST WHERE CH="+CH;
	try {
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery(sql);	
		while (rs.next()) {
		System.out.print("제목 : "+rs.getString(1)+"\t");
		System.out.println("아이디 : "+rs.getString(2));
		System.out.println("게시글 : "+rs.getString(3));}} 
	catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}	
	}
	
	public void pselp(int CH) {
		String sql="UPDATE POST SET VIEWS=VIEWS+1 WHERE CH="+CH;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}}
	
	public void produce(String tittle,String writing, String mId) {
		 String sql="INSERT INTO POST VALUES(CH_SEQ.NEXTVAL,?,?,?,0)";
		 try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tittle);
			pstmt.setString(2, writing);
			pstmt.setString(3, mId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	}

	public void delpos(String mId)
	{String sql="SELECT CH,TITTLE,VIEWS FROM POST Where mId='"+mId+"'";
	try {
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery(sql);
		while (rs.next()) {
			System.out.print("No."+rs.getInt(1)+"\t");
			System.out.print(rs.getString(2)+"\t");
			System.out.print(rs.getInt(3));
			System.out.println();
		}
		System.out.println();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	}
	//게시글삭제 메소드
		public void delpos(int CH, String mId) {
			String sql = "DELETE FROM POST WHERE CH=? AND MID=?";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, CH);
				pstmt.setString(2, mId);
				int result = pstmt.executeUpdate();
				if (result > 0) {
					System.out.println("삭제 성공!");
				} else {
					System.out.println("해당 아이디의 게시물이 존재하지 않습니다.");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
}