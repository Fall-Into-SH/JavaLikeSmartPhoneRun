package KGV;

import java.util.Scanner;

import Bank.BankSQL;

public class KGVMain {
	public void kgv(String id) {// 메인시작
		KGVDTO kd = new KGVDTO();
		kd.setId(id);
		int menu = 0;
		boolean run = false;
		Scanner sc = new Scanner(System.in);
		boolean acc = false;
		KGVSQL sql = new KGVSQL();
		boolean check = false;
		run = true;
		sql.connect();
		while (run) {
			System.out.println("= 영화 예매 앱은? KGV =");
			System.out.println("1.최신 상영작 보기");
			System.out.println("2.예매 하기 \t3.예매정보 보기");
			System.out.println("4.기프티콘 구매 \t5.결제 계좌 선택");
			System.out.println("6.로그아웃");
			System.out.print("입력 >> ");
			menu = sc.nextInt();

			switch (menu) {
			case 1:
				System.out.println("\n\n\n\n");
				System.out.println("== 최신 상영작 ==");
				sql.movieview();
				break;
			case 2:
				if (acc) {
					System.out.println("== 예매 ==");
					sql.Location(kd);
					sql.bookticket(kd,id);
					
					boolean remit;
					boolean plus;
					int balance;
					
					remit = false; 
					plus = false;
					int price = (kd.getPeople()*7000);
					balance = sql.cashOver(kd.getAccount(),kd);
					
					if(balance>=price) {
						kd.setBalance(price);
						sql.depowith(kd,remit,plus);
						sql.ticketupload(kd);
						
					} else {
						System.out.println("잔액이 부족합니다.");
					}
					
					
				} else {
					System.out.println("결제 계좌를 먼저 선택하세요");
					System.out.println();
				}
				break;
			case 3:
				sql.viewticket(kd);
				break;
			case 4:
				if (acc) {
					System.out.println("준비중입니다.");
					System.out.println("엔터로 넘어가 주세요");
					sc.nextLine().trim();
				} else {
					System.out.println("결제 계좌를 먼저 선택하세요");
				}

				break;
			case 5:
				check = sql.accountCheck(id,kd);
				if (check) {
					kd.setAccount(sql.fixaccount(id,kd));
					System.out.println(kd.getAccount() + "로 설정되었습니다.");
					acc = true;
				} else {
					System.out.println("은행앱에서 계좌를 먼저 만들어 주세요!");
				}
				break;
			case 6:
				run = false;
				System.out.println("로그아웃 합니다.");
				break;
			default:
				System.out.println("잘못 입력하였습니다.");
				break;
			}

		}
	}// 메인 끝
}
