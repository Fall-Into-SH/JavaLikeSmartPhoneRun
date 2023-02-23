package SmartPhone;

import java.util.Scanner;

public class Run {


	public void caandme(String id) { // 통신 메뉴;
		// UserdataDTO 객체
		MemberDTO member = new MemberDTO();

		// SmartPhone SQL 객체
		SmartPhoneSQL sql = new SmartPhoneSQL();

		// Scanner 개체
		Scanner sc = new Scanner(System.in);

		int menu = 0; // 스캐너로 입력 받은 값을 넣을 변수
		String input = null; // 스캐너로 입력받은 문자열 저장
		sql.connect();
		
		
		while (true) {
			System.out.println("===== 통신 =====");
			System.out.println("1.연락처 \t2.전화 \t3.문자 \t4.나가기");
			System.out.print("입력 >> ");
			menu = sc.nextInt();

			switch (menu) {
			case 1:
				while (true) {
					System.out.println("===== 연락처 =====");
					System.out.println("1.등록 \t2.삭제 \t3.조회 \t4.나가기"); // 수정 의미없어서 안만듬
					System.out.print("입력 >> ");
					menu = sc.nextInt();

					switch (menu) {
					case 1:
						System.out.println("등록할 이름을 입력하여 주십시오.");
						System.out.print("입력 >> ");
						input = sc.next();
						member.setOname(input);
						System.out.println("등록할 전화번호를 입력하여 주십시오");
						System.out.print("입력 >> ");
						input = sc.next();

						member.setOnumber(input);

						// sql 등록 넣을자리
						sql.numberPlus(member);

						break;
					case 2:
						System.out.println("삭제할 번호를 입력하여 주십시오");
						System.out.print("입력 >> ");
						input = sc.next();

						sql.numberDelete(input);

						break;
					case 3:
						System.out.println("조회할 이름을 검색하여 주십시오");
						System.out.print("입력 >> ");
						input = sc.next();

						// sql 조회 넣을 자리

						break;
					case 4:
						System.out.println("연락처를 나갑니다");
						break;
					default:
						System.out.println("잘못입력 하였습니다.");
						break;

					}
					if (menu == 4)
						break;
				}
				break;
			case 2:
				System.out.println("===== 전화 =====");
				System.out.println("상대방의 번호나 이름을 입력해주십시오");

				input = sc.next();
				// 나중에 보강
				break;
			case 3:
				// 나중에 보강
				break;
			case 4:
				System.out.println("통신을 나갑니다.");
				break;
			default:
				System.out.println("잘못 입력하였습니다.");
				break;

			}
			if (menu == 4)
				break;

		}
	} // 통신 메소드 끝

	private void calling(String id) { // 전화 메소드


	}// 전화메소드 끝

	public void number(String id) { // 연락처 메뉴
		

	} // 연락처 메소드 끝

	public void message(String id) { // 메세지 메소드

	} // 메세지 메소드 끝

	public void app(String id) { // 앱 메소드
		// Scanner 개체
		Scanner sc = new Scanner(System.in);

		// 다른패키지에 있는 앱을 실행시킬 insert 패키지 객체
		InsertPackage ip = new InsertPackage();

		int menu = 0; // 스캐너로 입력 받은 값을 넣을 변수
		
		
		while (true) {
			System.out.println("1.금융 \t2.소셜 네트워킹 \t3.엔터 테인먼트 \t4.유틸리티");
			System.out.println("5.여행 \t6.비즈니스 \t7.라이프스타일 \t8.게임");
			System.out.println("9.나가기");
			System.out.print("선택 >> ");
			menu = sc.nextInt();

			switch (menu) {
			case 1:
				ip.finance(id);
				break;
			case 2:
				ip.social(id);
				break;
			case 3:
				ip.entertain(id);
				break;
			case 4:
				ip.util(id);
				break;
			case 5:
				ip.trip(id);
				break;
			case 6:
				ip.busy(id);
				break;

			case 7:
				ip.lifestyle(id);
				break;
			case 8:
				ip.game(id);
				break;
			case 9:
				System.out.println("앱을 나갑니다.");
				break;
			default:
				System.out.println("잘못 입력하였습니다");
				break;

			}
			if (menu == 9)
				break;
		}
	} // 앱 메소드 끝

	public void SetUp(String id) {
		// UserdataDTO 객체
		MemberDTO member = new MemberDTO();

		// SmartPhone SQL 객체
		SmartPhoneSQL sql = new SmartPhoneSQL();

		// Scanner 개체
		Scanner sc = new Scanner(System.in);


		int menu = 0; // 스캐너로 입력 받은 값을 넣을 변수
		String input = null; // 스캐너로 입력받은 문자열 저장
		sql.connect();
		
		while (true) {
			System.out.println("=========================== 설정 MENU ===========================");
			System.out.println("1. 계정 정보\t 2. 계정 수정\t 3. 나가기\t");

			System.out.println("================================================================");
			System.out.print("메뉴 선택 >> ");
			menu = sc.nextInt();

			switch (menu) {
			case 1:
				System.out.println("================");
				// 현재 ID 기반으로 sql 작성
				sql.DataInfo(id);
				break;
			case 2:
				while (true) {
					System.out.println("===수정 선택===");
					System.out.println("1.이름 \t2.나이 \t3.생년월일 \t4.나가기");
					menu = sc.nextInt();

					switch (menu) {
					case 1:
						System.out.println("수정할 이름을 적어주세요");
						System.out.print("입력 >> ");
						input = sc.next();

						// sql 문 작성
						sql.UserDataUpdate(input, 1, id);
						break;

					case 2:
						System.out.println("수정할 나이를 적어주세요");
						System.out.print("입력 >> ");
						int age = sc.nextInt();

						// sql 문 작성
						sql.UserDataUpdate(input, 2, id);
						break;
					case 3:
						System.out.println("수정할 생년월일을 적어주세요");
						System.out.print("입력 >> ");
						input = sc.next();

						// sql 문 작성
						sql.UserDataUpdate(input, 3, id);
						break;
					case 4:
						System.out.println("나가겠습니다");
						break;
					default:
						System.out.println("잘못 입력하였습니다.");
						break;
					}

					if (menu == 4)
						break;
				}
				break;
			case 3:
				System.out.println("설정메뉴를 나갑니다.");
				break;
			default:
				System.out.println("잘못 입력하였습니다.");
				break;
			}
			if (menu == 3)
				break;
		}

	}// 설정메뉴 끝

	public void SetUp2() { // 계정 수정 메소드
	
	}
}
