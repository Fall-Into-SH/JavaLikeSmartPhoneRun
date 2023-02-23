package Bank;

import java.util.Scanner;

public class BankMain {

	public void bank(String id) {

		
		
		// BankDTO객체
		BankDTO bank = new BankDTO();
		
		// BankSQL객체
		BankSQL sql = new BankSQL();
		
		// Scanner객체
		Scanner sc = new Scanner(System.in);
		
		bank.setmId(id);
		boolean run = true;
		boolean check = false;
		boolean plus = true;
		int menu = 0;
		int output = 0;
		sql.connect(); // >> 커넥트를 안하면 에러남;;
		
		
		while(run) {
			System.out.println("========================= PASS ===========================");
			System.out.println("1.계좌선택\t\t 2.입금\t\t 3.출금");
			System.out.println("4.송금\t\t 5.잔액조회\t 6.로그아웃");
			System.out.println("==========================================================");
			System.out.print("메뉴 선택 >> ");
			menu = sc.nextInt();
		
			switch(menu) {
			case 1:
				
				sql.FixAccount(id,bank);
				
				break;
			case 2:
				
				plus = true;	// true = 입금, false = 출금
				boolean remit = false; // 송금인가?
				
				System.out.print("입금액 >> ");
				int balance = sc.nextInt();
				bank.setBalance(balance);
				
				sql.depowith(bank,remit,plus);
				
				break;
			case 3:
				remit = false; 
				// 출금 메소드 만들기
				
				plus = false; // 입출금 메소드를  출금으로 실행하여라
				
				System.out.print("출금액 >> ");
				output = sc.nextInt();
				
				balance = sql.cashOver(bank.getAccount());
				
				if(balance>=output) {
					bank.setBalance(output);
					sql.depowith(bank,remit,plus);
				} else {
					System.out.println("잔액이 부족합니다.");
				}
				
				break;
			case 4:
				remit = true;
				
				
				System.out.print("송금액 >> ");
				output = sc.nextInt();
				
				
				balance = sql.cashOver(bank.getAccount());
				
				if(balance>=output) {
					bank.setBalance(output); // 출금정보
					
					System.out.print("받는분 계좌번호 >> ");
					String account = sc.next();
					
					check = sql.takeAccount(account); // 계좌가 존재하는지?
					
					if(check) {
						plus = false;	// 출금
						sql.depowith(bank,remit,plus); // 출금메소드 -> if문 안에 있어야 받는사람 계좌 존재시 출금
						
						plus = true; // 입금	
						sql.depowith(bank,remit,plus);  // 입금메소드
					} else {
						System.out.println("받는분 계좌가 없습니다.");
					}
				} else {// 잔액 부족시
					System.out.println("잔액이 부족합니다.");
				}
				
				
				break;
			case 5:
				sql.checkBalance(id,bank);
				break;
			case 6:
				run = false;
				System.out.println("로그아웃 하겠습니다.");
				break;
			default:
				System.out.println("잘못 입력하였습니다.");
				break;
			
			}
			} //while문 종료
	}
}
