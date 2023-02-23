package KGV;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import Badal.BadalDTO;
import SmartPhone.DBConnection;

public class KGVSQL {
	int menu = 0;
	Scanner sc = new Scanner(System.in);
	KGVDTO kd = new KGVDTO();

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

	public String fixaccount(String id, KGVDTO kd) { // 계좌 고정 메소드
		int count = 0;
		kd.setId(id);
		String sql = "SELECT COUNT(*) FROM bank where MID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, kd.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String account[] = new String[count];
		int balance[] = new int[count];
		count = 0;

		sql = "SELECT ACCOUNT,BALANCE FROM BANK WHERE MID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, kd.getId());

			rs = pstmt.executeQuery();

			System.out.println("=============계좌 선택=============");
			while (rs.next()) {
				account[count] = rs.getString(1);
				balance[count] = rs.getInt(2);
				System.out.println("[" + count + "]" + account[count] + " : " + "잔액 " + balance[count] + "원");
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

	public boolean accountCheck(String id, KGVDTO kd) {
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

	public void movieview() { // 영화목록보기
		
		
		String sql = "SELECT MNAME FROM MovieTable";
		int sum = 0;
		try {
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				sum++;
				System.out.println(sum + " : " + rs.getString(1));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("나갈려면 엔터 눌러주세요");
		sc.nextLine().trim();
		System.out.println("\n\n\n");
	}

	public void bookticket(KGVDTO kd, String id) { // 상영시간표 가져와서 보여주고 결제후에 예매정보에 저장
		System.out.println("\n\n\n");
		String sql = "SELECT COUNT(*) FROM MovieTable";
		int cc = 0;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				cc = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String[] mname = new String[cc];
		int[] mcode = new int[cc];

		cc = 0;
		boolean run = true;

		sql = "SELECT * FROM MovieTable";
		try {
			while (run) {
				run = false;
				System.out.println("영화를 골라주세요");
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					mname[cc] = rs.getString(1);
					mcode[cc] = rs.getInt(2);
					System.out.println((cc + 1) + ". " + mname[cc]);
					cc++;
				}
				System.out.print("입력 >> ");
				menu = sc.nextInt();
				if ((menu - 1) < 0 && (menu - 1) >= cc) {
					System.out.println("잘못 입력 하였습니다.");
					System.out.println("엔터를 누른후 다시 입력해주십시오.");
					sc.nextLine().trim();
					sc.nextLine().trim();
					run = true;
				} else {

					kd.setMcode(menu);
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		sql = "SELECT count(*) FROM MovieTicketTable WHERE MCODE = ? AND LCODE = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, kd.getMcode());
			pstmt.setInt(2, kd.getLcode());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cc = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		sql = "SELECT MTIME FROM MovieTicketTable WHERE MCODE = ? AND LCODE = ?";
		String[] mtime = new String[cc];
		String Lname = Location2(kd);
		cc = 0;
		try {
			run=true;
			while (run) {
				run = false;
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, kd.getMcode());
				pstmt.setInt(2, kd.getLcode());
				rs = pstmt.executeQuery();
				System.out.println(mname[menu - 1] + "상영 정보");

				while (rs.next()) {
					mtime[cc] = rs.getString(1);
					System.out.println("[" + (cc + 1) + "] 지점 :" + Lname + " 시간 :" + mtime[cc]);
					cc++;
				}
				System.out.print("입력 >> ");
				menu = sc.nextInt();
				if ((menu - 1) < 0 && (menu - 1) >= cc) {
					System.out.println("잘못 입력 하였습니다.");
					System.out.println("엔터를 누른후 다시 입력해주십시오.");
					sc.nextLine().trim();
					sc.nextLine().trim();
					run = true;
				} else {
					kd.setDate(mtime[menu - 1]);
					run = true;
					while (run) {
						run = false;
						System.out.println("몇 자리를 예약하십니까? (숫자로 입력해주세요)");
						System.out.println("1명당 7000원 입니다.");
						System.out.print("입력 >> ");
						menu = sc.nextInt();
						if (menu <= 0) {
							System.out.println("잘못된 입력입니다.");
							run = true;
						} else {
							kd.setPeople(menu);
						}
					}
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private String Location2(KGVDTO kd2) {
		String name = "";

		switch (kd2.getLcode()) {
		case 1:
			name = "주안점";
			break;
		case 2:
			name = "부평점";
			break;
		case 3:
			name = "송도점";
			break;
		}

		return name;
	}

	public void Location(KGVDTO kd) {
		boolean run = true;
		while (run)
			run = false;
		System.out.println("지점을 선택해 주세요");
		System.out.println("1. 주안점  2.부평점  3.송도점 ");
		System.out.print("입력 >> ");
		menu = sc.nextInt();

		switch (menu) {
		case 1:
		case 2:
		case 3:
			kd.setLcode(menu);
			break;
		default:
			System.out.println("잘못 입력하였습니다.");
			run = true;
			break;

		}

	}
	
	public void depowith(KGVDTO kd, boolean remit, boolean plus) {
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
			pstmt.setInt(1, kd.getBalance());
			pstmt.setString(2, kd.getAccount());

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

	public int cashOver(String account,KGVDTO kd) {
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

	public void ticketupload(KGVDTO kd) {
		String sql = "INSERT INTO  BuyTicketTable VALUES(?, ?, ?, ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,kd.getId());
			pstmt.setInt(2, kd.getMcode());
			pstmt.setString(3,kd.getDate());
			pstmt.setInt(4, kd.getPeople());
			pstmt.setInt(5, kd.getLcode());
			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void viewticket(KGVDTO kd) {
		int cc = 0;
		String sql = "SELECT COUNT(*) FROM BuyTicketTable WHERE MID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,kd.getId());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				cc = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int [] mcode = new int [cc];
		String [] mname = new String [cc];
		
		cc=0;
		sql = "SELECT MCODE FROM BuyTicketTable WHERE mId = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,kd.getId());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				mcode[cc] = rs.getInt(1);
				cc++;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		// 여기서부터 작성할것
		sql = "SELECT MNAME FROM MovieTable WHERE MCODE = ?";
		for(int i = 0; i<cc;i++) {
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,mcode[i]);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					mname[i] = rs.getString(1);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		sql = "SELECT MID, MTIME, PEOPLE, LCODE FROM BuyTicketTable WHERE mId = ?";
		cc = 0;
		String Lname="";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,kd.getId());
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				System.out.println();
				System.out.println("구매자 : "+rs.getString(1));
				System.out.println("영화 : "+mname[cc]);
				System.out.println("상영시작 시간 : "+rs.getString(2));
				System.out.println("입장 인원수 : "+ rs.getInt(3)+"명");
				kd.setLcode(rs.getInt(4));
				Lname = Location2(kd);
				System.out.println("지점 : "+Lname);
				System.out.println();
				System.out.println();
				
				
				
				
				
				cc++;
			}
			
			System.out.println("엔터로 나가주세요");
			sc.nextLine().trim();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	}
