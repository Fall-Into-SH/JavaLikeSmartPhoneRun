package SmartPhone;

import java.util.Scanner;

public class SmartPhoneMain {
	public static void main(String[] args) {

		// 비밀번호 암호화 객체 -> 암호화만 해주고 결과값 리턴
		Encryption enc = new Encryption();

		// BankDTO 객체
		MemberDTO member = new MemberDTO();

		// BankSQL 객체
		SmartPhoneSQL sql = new SmartPhoneSQL();

		// Scanner 개체
		Scanner sc = new Scanner(System.in);
		Run Run = new Run();

		boolean run = true; // 기본 선택
		boolean run1 = true; // MENU
		boolean check = false; // 체크할때 활용하세요
		sql.connect();

		int menu = 0;
		while (run) { // 첫 while 문 시작
			System.out.println("=================================================");
			System.out.println("1.계정이 있습니다. \t 2.계정이 없습니다.\t 3.프로그램 종료");
			System.out.println("=================================================");
			System.out.print("숫자 선택 >> ");
			menu = sc.nextInt();
			switch (menu) {
			case 1:

				System.out.print("계정 아이디 >>");
				String sId = sc.next();

				System.out.print("비밀번호 >> ");
				String sPw = sc.next();
				sPw = enc.encryption(sPw);
				check = sql.idCheck(sId, sPw);
				

				if (check) {
					while (run1) { // 메인 munu while문 실행
						System.out.println("=========================== MENU ==============================");
						System.out.println("1. 설정\t\t 2. 앱\t\t 3. 통신\t\t 4. 종료");

						System.out.println("===============================================================");
						System.out.print("메뉴 선택 >> ");
						menu = sc.nextInt();
						switch (menu) { // 메인 메뉴 스위치문
						case 1:
							// 설정
							Run.SetUp(sId);
							break;

						case 2:
							// 앱
							Run.app(sId);
							break;

						case 3:
							// 통신
							Run.caandme(sId);
							break;

						case 4:
							// 종료
							System.out.println("== 종료합니다. ==");
							run1 = false;
							break;
						default:
							System.out.println("잘못 입력했습니다.");
							break;

						}

					}
				}
				else{
					System.out.println("계정정보가 일치하지 않습니다.");
				}// 메인 munu while문 종료
				break;
			case 2: // 계정이 없습니다.
				System.out.println("계정정보를 입력해주세요!");

				System.out.print("전화번호 >> ");
				String sPhone = sc.next();

				System.out.print("계정 아이디(5자에서 20자 사이로 입력해주세요) >> ");
				sId = sc.next();

				System.out.print("패스워드(4글자로 입력해 주세요) >> ");
				sPw = sc.next();

				System.out.print("이름 >> ");
				String sName = sc.next();

				System.out.print("생년월일 >> ");
				String sBirth = sc.next();

				System.out.print("나이 >> ");
				String sAge = sc.next();

				// 4자리 비밀번호 12자리로 암호화
				sPw = enc.encryption(sPw);

				// 입력받은 정보를 member객체에 저장
				member.setmId(sId);
				member.setmPw(sPw);
				member.setmName(sName);
				member.setmBirth(sBirth);
				member.setmAge(sAge);
				member.setmPhone(sPhone);
				sql.MemberJoin(member); // sql.문 만들어야함

				System.out.println("계정 만들기 성공");

				break;

			case 3:
				run = false;
				System.out.println("프로그램을 종료합니다.");
				sql.conClose();

				break;
			default:
				System.out.println("잘못 입력했습니다.");
				break;

			} // 첫 while의 switch문 종료

		} // 첫 while 문 종료

	}

}