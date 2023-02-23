package SmartPhone;

import java.util.Scanner;

import Badal.BadalMain;
import Bank.BankMain;
import KGV.KGVMain;
import Test.RaceMain;
import eta.etaMain;
import insta.InstaMain;

public class InsertPackage {
	
	RaceMain RM = new RaceMain();
	MemberDTO member = new MemberDTO();
	BankMain bank = new BankMain();
	KGVMain KGV = new KGVMain();
	BadalMain BM = new BadalMain();
	InstaMain IM = new InstaMain();
	etaMain EM = new etaMain();
	boolean run = false;
	Scanner sc = new Scanner(System.in);
	int menu = 0;

	public void finance(String id) {// 금융앱 넣는곳
		run = true;
		while (run) {
			System.out.println();
			System.out.println("\t\t== 금융앱 ==");
			System.out.println("1.은행 \t0.종료");
			System.out.print("입력 >> ");
			menu = sc.nextInt();
			System.out.println();
			switch (menu) {
			case 0:
				run=false;
				System.out.println("프로그램을 종료합니다.");
				break;
			case 1:
				bank.bank(id);
				break;
			default:
				System.out.println("잘못입력하였습니다.");
				break;
			}
		}

	} // 다른 앱(패키지)을 추가하는 메소드

	public void social(String id) { // 소셜네트워킹 앱 넣는곳
		run = true;
		while (run) {
			System.out.println();
			System.out.println("\t\t== 소셜 ==");
			System.out.println("1.별스타 \t2.에타 \t0.종료");
			System.out.print("입력 >> ");
			menu = sc.nextInt();
			System.out.println();
			switch (menu) {
			case 0:
				run=false;
				System.out.println("프로그램을 종료합니다.");
				break;
			case 1:
				System.out.println();
				IM.main(id);
				break;
			case 2:
				System.out.println();
				EM.maineta(id);
				break;
			default:
				System.out.println("잘못입력하였습니다.");
				break;
			}
		}

	}

	public void entertain(String id) { // 엔터테인앱 넣는곳
		System.out.println("준비중입니다.");
		System.out.println("엔터로 넘어가 주세요");
		sc.nextLine().trim();
	}

	public void util(String id) { // 유틸 앱 넣는곳
		System.out.println("준비중입니다.");
		System.out.println("엔터로 넘어가 주세요");
		sc.nextLine().trim();
	}

	public void trip(String id) { // 여행앱 넣는곳
		System.out.println("준비중입니다.");
		System.out.println("엔터로 넘어가 주세요");
		sc.nextLine().trim();
	}

	public void busy(String id) { // 비즈니스앱 넣는곳
		System.out.println("준비중입니다.");
		System.out.println("엔터로 넘어가 주세요");
		sc.nextLine().trim();
	}

	public void lifestyle(String id) { // 라이프스타일 앱 넣는곳
		run = true;
		while (run) {
			System.out.println();
			System.out.println("\t\t== 라이프 스타일 ==");
			System.out.println("1.영화앱 \t2.배달앱 \t0.종료");
			System.out.print("입력 >> ");
			menu = sc.nextInt();
			System.out.println();
			switch (menu) {
			case 0:
				run=false;
				System.out.println("라이프스타일을 종료합니다.");
				break;
			case 1:
				KGV.kgv(id);
				// 메소드 집어넣기
				break;
			case 2:
				BM.BadalRun(id);
				break;
			default:
				System.out.println("잘못입력하였습니다.");
				break;
			}
		}
	}

	public void game(String id) { // 게임앱 넣는곳
		run = true;
		while (run) {
			System.out.println();
			System.out.println("\t\t== 게임 ==");
			System.out.println("1.레이싱 \t0.종료");
			System.out.print("입력 >> ");
			menu = sc.nextInt();
			System.out.println();
			switch (menu) {
			case 0:
				run=false;
				System.out.println("게임을 종료합니다.");
				break;
			case 1:
				RM.mainrace();
				// 메소드 집어넣기
				break;
			default:
				System.out.println("잘못입력하였습니다.");
				break;
			}
		}
	}

}
