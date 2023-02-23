package SmartPhone;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class SmartPhoneSQL {
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

	public void MemberJoin(MemberDTO member) { // 사용자계정 입력
		String sql = "INSERT INTO USERDATA VALUES(?, ?, ?, ?, ?, ?)";

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, member.getmId());
			// id값에 icia1111 이라는 값을 입력했을 경우
			// 1번째 물음표(?)에 'icia1111' 이라는 값이 들어간다.

			pstmt.setString(2, member.getmPw());
			pstmt.setString(3, member.getmName());
			pstmt.setString(4, member.getmBirth());
			pstmt.setString(5, member.getmPhone());
			pstmt.setString(6, member.getmAge());

			int result = pstmt.executeUpdate();

			if (result > 0) {
				System.out.println("회원가입 성공!");
			} else {
				System.out.println("회원가입 실패!");
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}// 사용자 계정입력 메소드 끝

	// 계정확인 메소드
	public boolean idCheck(String sId, String sPw) {
		String sql = "SELECT MID FROM USERDATA WHERE MID = ? AND MPW = ?";

		// try문이 작동하지 않을경우 checkResult에 아무 값도 들어가지 않기 때문에
		// 초기값인 false를 대입한다.
		boolean checkResult = false;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sId);
			pstmt.setString(2, sPw);

			rs = pstmt.executeQuery();
			
			// rs.next() : 데이터가 존재할때 true, 존재하지 않으면 false
			if (rs.next()) {
				checkResult = true;
				
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return checkResult;
	} 	// 계정확인 메소드 끝
	
	// 연락처 추가 메소드
	public void numberPlus(MemberDTO member) {
		String sql = "INSERT INTO PHONUM VALUES(?, ?, ?)";

		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, member.getOnumber());
			pstmt.setString(2, member.getOname());
			pstmt.setString(3, member.getmId());


			int result = pstmt.executeUpdate();

			if (result > 0) {
				System.out.println("연락처 등록성공!");
			} else {
				System.out.println("연락처 등록실패!");
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		
	}// 연락처 추가메소드 끝

	// 연락처 삭제 메소드
	public void numberDelete(String input) {
		String sql = "DELETE FROM PHONUM WHERE PPHO = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, input);

			int result = pstmt.executeUpdate();

			if (result > 0) {
				System.out.println(input + "가 삭제 되었습니다.");
			} else {
				System.out.println("삭제에 실패했습니다.");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

	public void DataInfo(String getmId) {
		Encryption enc = new Encryption();
		String sql = "SELECT * FROM USERDATA WHERE  MID= ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, getmId);

			rs = pstmt.executeQuery();

			System.out.println("<< 계정 정보 조회 >>");
			while (rs.next()) {
				System.out.println("아이디 : " + rs.getString(1));
				String pw = enc.decryption(rs.getString(2));
				System.out.println("패스워드 : " + pw);
				System.out.println("이름 : " + rs.getString(3));
				System.out.println("생년월일 : " + rs.getString(4));
				System.out.println("전화번호 : " + rs.getString(5));
				System.out.println("나이 : " + rs.getString(6));
				System.out.println();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void UserDataUpdate(String input, int i, String id) {
		String wsql= "";
		switch(i) {
		case 1:
			wsql = "MNAME";
			break;
		case 2:
			wsql = "MAGE";
			break;
		case 3:
			wsql = "MBIRTH";
			break;
		}
		String sql = "UPDATE USERDATA SET " +wsql+ " = ? WHERE MID = ?";
		try {
			pstmt = con.prepareStatement(sql);

			
			pstmt.setString(1, input);
			pstmt.setString(2, id);

			int result = pstmt.executeUpdate();

			if (result > 0) {
				System.out.println("수정 성공!");
			} else {
				System.out.println("수정 실패!");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
