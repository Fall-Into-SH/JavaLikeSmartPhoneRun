package Badal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import SmartPhone.DBConnection;

public class BadalSQL {
	Scanner sc = new Scanner(System.in);
	BadalDTO kd = new BadalDTO();
	
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


	public int cho2(int scode) {
		String sql = "SELECT COUNT(*) FROM BMENUTable where SCODE = ?";
		int count = 0; // 배열 크기 지정
		boolean run = true;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, scode);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String [] name = new String [count];
		int [] price = new int [count];
		int sum=0;
		int [] howmany = new int [count] ;
		boolean onetime = true;
		
		
			sql = "Select SMENU,PRICE FROM BMENUTable WHERE SCODE = ?";
		try {
			while(run) {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, scode);
				rs = pstmt.executeQuery();
				count = 0 ; // 초기화 시켜서 함수 세는데 재활용
				System.out.println("메뉴를 골라주세요");
				while (rs.next()) {
					if(onetime) {
						howmany[count] = 0;
					}
					name[count] = rs.getString(1);
					price[count] = rs.getInt(2);
					System.out.println("["+(count+1)+"] "+name[count]+" 가격 :"+price[count]+" 원");
					
					count++;
				} // 이름 띄우기 끝
				onetime=false;
				System.out.println("["+(count+1)+"] " +"그만 고르기");
				System.out.print("입력 >> ");
				int menu = sc.nextInt();
				System.out.println();
				
				if((menu-1)>=0 && (menu-1)<=count) {
					if((menu-1)==count) {
					boolean stop = false;
					for(int i=0; i<count;i++) {
						if(howmany[i]!=0) {
							System.out.println(name[i]+"   "+howmany[i]+" 개");
						}
					}
					
					System.out.println("해당 내역이 맞으면 1번을 눌러주세요");
					System.out.print("입력 >> ");
					int first = sc.nextInt();
					System.out.println();
					if(first==1) {
						stop = true;
					} else {
						for(int i=0; i<count;i++) {
						if(howmany[i]!=0) {
							howmany[i] = 0;
						}}
					}
					
					if(stop) {
					run = false;
					return sum;
					}}
					else {
						howmany[menu-1]++;
						sum += price[menu-1];
						
					}
					
				}else {
					System.out.println("잘못입력하였습니다.");
				}
				}	// while 문 끝
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}


	public int cho1(int bcode) { // 먼저 총합을 구해서 배열 크기 지정하고, 가게 이름 보여주고 S코드 받아올것
		String sql = "SELECT COUNT(*) FROM BaeminTable where BCODE = ?";
		int count = 0; // 배열 크기 지정
		boolean run = true;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bcode);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String [] name = new String [count];
		int [] namecode = new int [count];
		
		// 가게이름 보여주고 입력값을 받아오기
		sql = "SELECT SNAME,SCODE FROM BaeminTable WHERE BCODE = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bcode);
			rs = pstmt.executeQuery();
			
			while(run) {
			count = 0 ; // 초기화 시켜서 함수 세는데 재활용
			System.out.println("가게를 골라주세요");
			while (rs.next()) {
				name[count] = rs.getString(1);
				namecode[count] = rs.getInt(2);
				System.out.println("["+(count+1)+"] "+name[count]);
				count++;
			} // 이름 띄우기 끝
			System.out.print("입력 >> ");
			int menu = sc.nextInt();
			
			if((menu-1)>=0 && (menu-1)<count) {
				run = false;
				System.out.println(namecode[menu-1]);
				return namecode[menu-1];
				
			}else {
				System.out.println("잘못입력하였습니다.");
			}
			}	// while 문 끝
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return -1;
	}
	
	public boolean accountCheck(String id,BadalDTO dd) {
		String sql = "SELECT COUNT(*) FROM bank where MID = ?";
		boolean checkResult;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				checkResult = true;
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
	public String fixaccount(String id,BadalDTO kd) { // 계좌 고정 메소드
		int count = 0;
		String sql = "SELECT COUNT(*) FROM bank where MID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
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
		
		sql  = "SELECT ACCOUNT,BALANCE FROM BANK WHERE MID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			System.out.println("=============계좌 선택=============");
			while (rs.next()) {
				account[count] = rs.getString(1);
				balance[count] = rs.getInt(2);
				System.out.println("["+count+"]"+account[count]+" : "+"잔액 "+balance[count]+"원");
				count++;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.print("계좌 선택 >>");
		count = sc.nextInt();
		
		
		
		kd.setAccount(account[count]);
		
		return kd.getAccount();							
		
		
	}
	public void depowith(BadalDTO bank, boolean remit, boolean plus) {
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

						System.out.println("결제 성공!");
					} else {
						System.out.println("결제 실패!");
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	// 잔액이 부족한가요?(한개의 계좌만 잔액조회) 메소드
		public int cashOver(String account,BadalDTO kd) {
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
	
	
}
	
	

