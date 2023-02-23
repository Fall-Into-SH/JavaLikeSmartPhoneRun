package Badal;

import java.util.Scanner;

public class BadalMain {
	public void BadalRun(String id) {
		SelectFood wm = new SelectFood();
		BadalDTO dd = new BadalDTO();
		int menu = 0;
		int price = 0; //가격
		boolean run = true;
		Scanner sc = new Scanner(System.in);
		BadalSQL sql = new BadalSQL();
		boolean check = false;
		int rcode = 0;	// 분류코드
		sql.connect();
		boolean BDAL = false;
		boolean pay = false;
		String addess="";
		
		while(true) {
			addess="";
			BDAL = false;
			price = 0;
			System.out.println("\t\t== 빠름의 민족 ==");
			System.out.println("1.배달/포장 \t\t2.밀키트 \t\t3.뭐먹지? \t\t4.나가기");
			System.out.print("입력 >> ");
			menu = sc.nextInt();
			if(menu==4) {
				System.out.println("빠름의 민족을 나갑니다.");
				break;
			}
			
			switch(menu) {
			case 1:
				run = true;
				while(run) {
				System.out.println();
				System.out.println("\t\t== 먹거리 ==");
				System.out.println("1.족발/보쌈");
				System.out.println("2.탕/찌개");
				System.out.println("3.돈까스/일식");
				System.out.println("4.피자");
				System.out.println("5.고기");
				System.out.println("6.다음 페이지 보기");
				System.out.print("입력 >> ");
				menu = sc.nextInt();
				System.out.println();
				switch(menu) {
				case 1:
					rcode = sql.cho1(1);// 가게 이름 보이는 메소드 return 값이 가게코드
					price = sql.cho2(rcode);
					break;
				case 2:
					rcode = sql.cho1(2);
					price = sql.cho2(rcode);
					break;
				case 3:
					rcode = sql.cho1(3);
					price = sql.cho2(rcode);
					break;
				case 4:
					rcode = sql.cho1(4);
					price = sql.cho2(rcode);
					break;
				case 5:
					rcode = sql.cho1(5);
					price = sql.cho2(rcode);
					sc.nextLine().trim();
					break;
				case 6:
					
					while(run) {
						run = false;
						System.out.println("1.치킨");
						System.out.println("2.분식");
						System.out.println("3.패스트푸드");
						System.out.println("4.카페");
						System.out.println("5.디저트");
						System.out.println("6.나가기");
						System.out.print("입력 >> ");
						menu = sc.nextInt();
						System.out.println();
						switch(menu) {
						case 1:
							rcode = sql.cho1(6);
							price = sql.cho2(rcode);
							break;
						case 2:
							rcode = sql.cho1(7);
							price = sql.cho2(rcode);
							break;
						case 3:
							rcode = sql.cho1(8);
							price = sql.cho2(rcode);
							break;
						case 4:
							rcode = sql.cho1(9);
							price = sql.cho2(rcode);
							break;
						case 5:
							rcode = sql.cho1(10);
							price = sql.cho2(rcode);
							break;
						case 6:
							
							break;
						default:
							System.out.println("잘못 입력하였습니다.");
							run = true;
							break;
						}
					}
					run = true;
					break;
				default:
					System.out.println("잘못 입력하였습니다.");
					break;
					
				}
				while(run) {
				System.out.println("배달/포장을 골라주세요");
				System.out.println("1.배달\t 2.포장");
				System.out.print("입력 >> ");
				menu = sc.nextInt();
				System.out.println();
				pay = true;
				switch(menu) {
				case 1:
					sc.nextLine().trim();
					System.out.println("배달 받을 주소를 입력해주세요");
					System.out.print("입력 >> ");
					addess = sc.nextLine();
					System.out.println("배달팁은 5천원 입니다.");
					System.out.println();
					price += 5000;
					run= false;
					BDAL=true;
					break;
				case 2:
					System.out.println("포장을 선택하셨습니다.");
					run = false;
					break;
				default:
					System.out.println("잘못 입력하였습니다.");
					break;
				}
				}
				
				}//while 문종료
				
				
				
				break;
			case 2:	// 밀키트
				run = true;
				while(run) {
					run = false;
					pay = true;
				System.out.println("\t\t== 밀키트 ==");
				System.out.println("1.한식 \t2.중식 \t3.일식 \t4.양식 \t5.나가기");
				menu = sc.nextInt();
				System.out.println();
				switch(menu) {
				case 1:
					rcode = sql.cho1(11);
					price = sql.cho2(rcode);
					break;
				case 2:
					rcode = sql.cho1(12);
					price = sql.cho2(rcode);
					break;
				case 3:
					rcode = sql.cho1(13);
					price = sql.cho2(rcode);
					break;
				case 4:
					rcode = sql.cho1(14);
					price = sql.cho2(rcode);
					break;
				case 5:
					pay= false;
					break;
				default:
					run = true;
					System.out.println("잘못 입력하였습니다.");
					break;
				}
				
				}
				break;
				
			case 3:
				wm.Select();
				System.out.println("엔터로 나가주세요");
				sc.nextLine().trim();
				sc.nextLine().trim();
				break;
			default:
				System.out.println("잘못 입력하였습니다.");
				break;
			}
		
			if(pay) {
				check = sql.accountCheck(id,dd);
				if (check) {
					boolean remit;
					boolean plus;
					int balance;
					dd.setAccount(sql.fixaccount(id,dd));
					System.out.println(dd.getAccount() + "로 설정되었습니다.");
					remit = false; 
					// 출금 메소드 만들기
					
					plus = false; // 입출금 메소드를  출금으로 실행하여라
					
					
					balance = sql.cashOver(dd.getAccount(),dd);
					
					if(balance>=price) {
						dd.setBalance(price);
						sql.depowith(dd,remit,plus);
						if(BDAL) {
						System.out.println(addess+"로 배달하겠습니다.");
						System.out.println();
						}
					} else {
						System.out.println("잔액이 부족합니다.");
					}
					
				} else {
					System.out.println("은행앱에서 계좌를 먼저 만들어 주세요!");
				}
				
			 pay=false;}
		
		}
		
		
	}
}
