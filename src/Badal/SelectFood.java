package Badal;

import java.util.Scanner;

public class SelectFood {

	public void Select() {

		// Scanner 객체 sc 만들기
		Scanner sc = new Scanner(System.in);

		// 프로그램 구동을 위한 run 변수과 menu 변수 생성
		boolean run = true;
		int menu = 0;

		while (run) {
			System.out.println("");
			System.out.println("=================음식 추천===============");
			System.out.println("================음식 카테고리==============");
			System.out.println("1.나라 별\t 2.간편식\t 3.안주");
			System.out.println("4.랜덤으로 정하기 5.나가기");
			System.out.println("=======================================");
			System.out.println("1~5 중 카테고리를 고르시오.");
			System.out.print("메뉴 선택 >> ");
			menu = sc.nextInt();
			System.out.println("");

			switch (menu) {
			case 1: // 나라 별 음식 : 한식 일식 중식 양식
				boolean run1 = true;
				int menu1 = 0;

				while (run1) {
					System.out.println("==============나라 별 카테고리==============");
					System.out.println("1.한식\t 2.일식\t 3.양식\t 4.중식");
					System.out.println("5.메인");
					System.out.println("=======================================");
					System.out.println("1~5 중 고르시오.");
					System.out.print("메뉴 선택 >> ");
					menu1 = sc.nextInt();
					System.out.println("");

					switch (menu1) {
					case 1: // 한식
						System.out.println("==============한식 메뉴==============");
						System.out.println("1.제육볶음\t 2.비빔밥\t 3.갈비탕\t 4.삼겹살");
						System.out.println("5.김치찌개\t 6.된장찌개\t 7.불고기\t 8.국밥");
						System.out.println("");

						break;

					case 2: // 일식
						System.out.println("==============일식 메뉴==============");
						System.out.println("1.초밥\t 2.덮밥\t 3.라멘\t 4.나베");
						System.out.println("5.돈까스\t 6.메밀소바\t 7.우동\t 8.일식 카레");
						System.out.println("");
						break;

					case 3: // 양식
						System.out.println("==============양식 메뉴==============");
						System.out.println("1.피자\t 2.파스타\t 3.햄버거\t 4.리조또");
						System.out.println("5.필라프\t 6.스테이크\t 7." + "\t 8.");
						System.out.println("");
						break;

					case 4: // 중식
						System.out.println("==============중식 메뉴==============");
						System.out.println("1.짜장면\t 2.짬뽕\t 3.볶음밥\t 4.잡채밥");
						System.out.println("5.마라탕(마라샹궈)\t 6.마라롱샤\t 7.\t 8.");
						System.out.println("");
						break;

					case 5:

						System.out.println("메인 화면으로 나갑니다.");
						System.out.println("");
						break;

					default:
						System.out.println("잘못입력했습니다.");
						System.out.println("");
						break;

					}
					run1 = false;
				}
				break;

			
			case 2: // 간편식
				boolean run3 = true;
				int menu3 = 0;

				while (run3) {
					System.out.println("=================간편식=================");
					System.out.println("1.간단한 식사\t 2.간식\t 3.메인");
					System.out.println("======================================");
					System.out.println("1~3 중 고르시오.");
					System.out.print("메뉴 선택 >> ");
					menu3 = sc.nextInt();
					System.out.println("");

					switch (menu3) {
					case 1: // 간단한 식사
						System.out.println("==============간단한 식사==============");
						System.out.println("1.김밥\t 2.주먹밥\t 3.밥버거\t 4.도시락");
						System.out.println("5.시리얼\t 6.샌드위치   7.간장계란밥   8.");
						System.out.println("");
						break;

					case 2: // 간식
						System.out.println("==============간식================");
						System.out.println("1.쿠키\t 2.조각케익\t 3.초콜릿\t 4.젤리");
						System.out.println("5.과일\t 6.빵\t 7.아이스크림   8.떡");
						System.out.println("");
						break;

					case 3: // 종료
						run3 = false;
						System.out.println("메인 화면으로 나갑니다.");
						System.out.println("");
						break;

					default:
						System.out.println("잘못입력했습니다.");
						System.out.println("");
						break;
					}
					run3 = false;
				}
				break;

			case 3: // 안주
				boolean run4 = true;
				int menu4 = 0;

				while (run4) {
					System.out.println("==============주종 카테고리==============");
					System.out.println("1.소주\t 2.맥주\t");
					System.out.println("3.메인");
					System.out.println("======================================");
					System.out.println("1~3 중 고르시오.");
					System.out.print("메뉴 선택 >> ");
					menu4 = sc.nextInt();
					System.out.println("");

					switch (menu4) {
					case 1: // 소주
						System.out.println("==============소주 안주==============");
						System.out.println("1.오돌뼈\t 2.육회\t 3.해물찜\t 4.회");
						System.out.println("5.족발/보쌈\t 6.타코와사비\t 7.\t 8.");
						System.out.println("");
						break;

					case 2: // 맥주
						System.out.println("==============맥주 안주==============");
						System.out.println("1.먹태\t 2.치킨\t 3.닭꼬치\t 4.견과류");
						System.out.println("5.감자튀김\t 6.골뱅이 소면\t 7.\t 8.");
						System.out.println("");
						break;

					case 3: // 종료
						run4 = false;
						System.out.println("메인 화면으로 나갑니다.");
						System.out.println("");
						break;

					default:
						System.out.println("잘못입력했습니다.");
						System.out.println("");
						break;
					}
					run4 = false;
				}
				break;
				
			case 4: // 랜덤으로 음식 고르기
				boolean run5 = true;
				int menu5 = 0;

				while (run5) {
					System.out.println("==============랜덤 카테고리==============");
					System.out.println("1.고민 중인 메뉴 중 랜덤으로 정하기");
					System.out.println("2.메인");
					System.out.println("======================================");
					System.out.println("1~2 중 고르시오.");
					System.out.print("선택 >> ");
					menu5 = sc.nextInt();
					System.out.println("");

					switch (menu5) {
					case 1: // 고민 중인 메뉴 중 랜덤으로 정하기
						System.out.println("고민 중인 메뉴가 몇 개인지 입력하세요.");
						System.out.print("몇 개 >> ");
						Scanner answer = new Scanner(System.in);
						int answer2 = answer.nextInt();
						String[] li = new String[answer2]; 
						
						System.out.println("고민 중인 메뉴를 입력해 주세요");
						for(int i = 0; i < answer2 ; i++) {
							Scanner name = new Scanner(System.in);
							System.out.print("입력 >> ");
							String names = name.next();
							li[i]=""+names;
						}
						int index = (int)Math.floor(Math.random()*answer2);
						System.out.println(li[index] + "(으)로 결정!");
					break;

					case 2: // 종료
						run5 = false;
						System.out.println("메인 화면으로 나갑니다..");
						System.out.println("");
						break;

					default:
						System.out.println("잘못입력했습니다.");
						System.out.println("");
						break;
					}
					run5 = false;
				}
				break;


			case 5:
				run = false;
				System.out.println("\n\n\n\n\n");
				break;

			default:
				System.out.println("잘못입력했습니다.");
				System.out.println("");
				break;
			}

		} // 음식 별 카테고리 끝

	}

}
