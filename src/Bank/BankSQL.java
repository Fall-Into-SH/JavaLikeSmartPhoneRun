package Bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import SmartPhone.DBConnection;

public class BankSQL {
	// Scanner 객체
	Scanner sc = new Scanner(System.in);
	// BankDTO객체
			BankDTO bank = new BankDTO();
	
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

	// 1-1. 계좌번호 생성 메소드
	public String accountNumber() {

		// 카카오뱅크 3333-xx-xxxxxx
		String aNumber = "3333-";

		for (int i = 1; i <= 2; i++) {
			aNumber += (int) (Math.random() * 9);
		}

		aNumber += "-";

		for (int i = 1; i <= 6; i++) {
			aNumber += (int) (Math.random() * 9);
		}

		String sql = "SELECT ACCOUNT FROM BANK";
		boolean checkAccount = false;

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				if (aNumber.equals(rs.getString(1))) {
					checkAccount = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (checkAccount) {
			accountNumber();
		} else {
			System.out.println("새로 생성된 계좌번호 : " + aNumber);
		}

		return aNumber;
	}

	// 계좌생성 메소드
	public void createAccount(BankDTO bank) {

		String account = accountNumber();

		String sql = "INSERT INTO BANK VALUES(?,?,?)";

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, account);
			pstmt.setInt(2, bank.getBalance());
			pstmt.setString(3, bank.getmId());

			int result = pstmt.executeUpdate();

			if (result > 0) {
				System.out.println("계좌생성 성공!");
			} else {
				System.out.println("계좌생성 실패!");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 입금/출금/이체 메소드
	public void depowith(BankDTO bank, boolean remit, boolean plus) {
		// (1) sql문 작성
		char pm = 0; // plus,minus
		if (plus) { // 입금,출금 쿼리 변경
			pm = '+';
		} else {
			pm = '-';
		}

		String sql = "UPDATE BANK SET BALANCE = BALANCE" + pm + "? WHERE ACCOUNT=?";

		// (2) stmt, pstmt 선언 후 try/catch문
		try {
			pstmt = con.prepareStatement(sql);

			// (3) pstmt로 선언했을 경우 ?에 데이터 삽입
			pstmt.setInt(1, bank.getBalance());
			pstmt.setString(2, bank.getAccount());

			// (4) 실행
			int result = pstmt.executeUpdate();

			// (5) 실행결과
			if (remit) {
				if (plus) { // 이체 입금
					if (result > 0) {
						System.out.println("이체 성공!");
					} else {
						System.out.println("상대 계좌에 돈이 입금되지 않았습니다.");
					}
				} else { // 이체 출금
					if (result > 0) {
						System.out.println("이체중입니다.");
					} else {
						System.out.println("내 계좌에서 돈이 빠져나가지 않았습니다.");
					}
				}
			} else { // 이체영역 종료, 일반 입출금 영역 시작

				if (plus) { // 입금

					if (result > 0) {

						System.out.println("입금 성공!");
					} else {
						System.out.println("입금 실패!");
					}
				} else { // 출금
					if (result > 0) {

						System.out.println("출금 성공!");
					} else {
						System.out.println("출금 실패!");
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// 잔액확인 - 모든 계좌
	public void checkBalance(String id,BankDTO bank) {
		String sql = "SELECT ACCOUNT,BALANCE FROM BANK WHERE MID=?";

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bank.getmId());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				String account = rs.getString(1);
				int balance = rs.getInt(2);
				System.out.println("계좌번호 : " + account);
				System.out.println("현재잔액 : " + balance + "원");
				System.out.println();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}


	// 계정확인 메소드
	public boolean idCheck(String id, String pw) {
		String sql = "SELECT MID FROM MEMBERDTO WHERE MID = ? AND MPW = ?";

		// try문이 작동하지 않을경우 checkResult에 아무 값도 들어가지 않기 때문에
		// 초기값인 false를 대입한다.
		boolean checkResult = false;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			rs = pstmt.executeQuery();
			// rs는 SELECT문과 짝꿍! => executeQuery() 사용

			// INSERT, UPDATE, DELETE는 int result와 짝꿍! => executeUpdate()사용

			// rs.next() : 데이터가 존재할때 true, 존재하지 않으면 false
			if (rs.next()) {
				checkResult = true;
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return checkResult;
	}

	// 계좌 체크 매소드
	public boolean accountCheck(String id) {
		String sql = "SELECT COUNT(*) FROM bank where MID = ?";
		boolean checkResult;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int sum = rs.getInt(1);
				if (sum < 3) {
					checkResult = true;
				} else {
					checkResult = false;
				}
			} else {
				checkResult = false;
			}

			return checkResult;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	// 계좌 선택 메소드
	public String whatAccount(String id) {
		String result;
		String sql = "SELECT ACCOUNT FROM BANK WHERE MID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String account = rs.getString(1);
				System.out.println("계좌번호 : " + account);
				System.out.println();
			}
			System.out.println("출금하실 계좌번호를 적어주세요");
			result = sc.next();

			return result;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	// 잔액이 부족한가요?(한개의 계좌만 잔액조회) 메소드
	public int cashOver(String account) {
		String sql = "SELECT BALANCE FROM BANK WHERE ACCOUNT=?";

		int balance = 0;
		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, account);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				balance = rs.getInt(1);
			}

			return balance;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return balance;
	}

	// 송금 받을 계좌 확인 메소드
	public boolean takeAccount(String account) {
		String sql = "SELECT ACCOUNT FROM bank WHERE ACCOUNT = ?";
		boolean checkResult = false;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, account);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				checkResult = true;
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return checkResult;
	}
	// 패스워드 암호화
	public String pw(String mPw) {
		
		String save = "";
		int sum = 0;
		int k;

		int[][] ch = new int[3][5];

		for (int i = 0; i <= 3; i++) { // 암호화

			for (int j = 0; j <= 4; j++) {
				sum++;
				if (mPw.length() >= sum) {
					k = i + j;
					ch[i][j] = (int) mPw.charAt(k);

					switch (j) {
					case 0:
						ch[i][j] += 100; // ㅇ
						break;
					case 1:
						ch[i][j] += 107; // ㅏ
						break;
					case 2:
						ch[i][j] += 97; // ㅁ
						break;
					case 3:
						ch[i][j] += 103; // ㅎ
						break;
					case 4:
						ch[i][j] += 104; // ㅗ
						break;
					}
					save += Integer.toString(ch[i][j]);
				} else {
					break;
				}
			}
			if (mPw.length() >= sum) {
				break;
			}
		} // for문 종료

		// save에 저장됌
		return save;
	}
	
	
	// 계좌 고정 메소드
	public void FixAccount(String id,BankDTO bank) {
		String sql = "SELECT COUNT(*) FROM bank where MID = ?";
		int count = 0;
		int newAccount = 0;
		bank.setmId(id);
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bank.getmId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String account [] = new String[count];
		int balance [] = new int [count];
		count =0;
		
		sql = "SELECT ACCOUNT,BALANCE FROM BANK WHERE MID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bank.getmId());
			
			rs = pstmt.executeQuery();
			
			System.out.println("=============계좌 선택=============");
			while (rs.next()) {
				account[count] = rs.getString(1);
				balance[count] = rs.getInt(2);
				System.out.println("["+count+"]"+account[count]+" : "+"잔액 "+balance[count]+"원");
				count++;
			}
			System.out.println(count+" 계좌 생성");
			System.out.println("================================");
			newAccount = count;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.print("계좌 선택 >>");
		count = sc.nextInt();
		
		boolean check = false;
		
		if(count!=newAccount) {
			bank.setAccount(account[count]);
		} else {
			
			int balance2 = 0;
			check = accountCheck(bank.getmId());	// 계좌가 3개가 넘는지 확인하는 메소드
			if(check) {
			System.out.print("계좌 생성시 입금액 >> ");
			balance2 = sc.nextInt();
			bank.setBalance(balance2);
			
			createAccount(bank);
			} else {
				
				System.out.println("계좌가 3개를 넘었습니다.");
			}
			
			
			
			
		}
		
		
		
		
		
		
	} 
	
	
	

}
