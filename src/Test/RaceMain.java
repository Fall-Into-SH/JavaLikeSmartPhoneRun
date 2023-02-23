package Test;

import java.util.Scanner;

public class RaceMain {

	public void mainrace() {
		Scanner sc = new Scanner(System.in);
		RaceDTO rd = new RaceDTO();
		RaceSQL sql = new RaceSQL();
		int player=0;
		int menu = 0;
		String go = "";
		String go2 = "";
		String go3 = "";
		String go4 = "";
		String symbol = "▲";
		String symbol2 = "★";
		String symbol3 = "■";
		String symbol4 = "●";
		sql.connect();
		
		
		boolean mainrun = true;
		boolean run = true;
		int ran = 0;
		int win[]=new int[4];
		
		win =sql.raceget(rd);
		
		
		double sum=0;
		
		while (mainrun) {
			System.out.println("경주 게임!");
			System.out.println("1.경주하기 2.우승확률보기 3.종료");
			System.out.print("입력 >> ");
			menu = sc.nextInt();
			switch(menu) {
			
			case 1:
				run=true;
				go = "";
				go2 = "";
				go3 = "";
				go4 = "";
			while (run) {
				ran = (int) (Math.random() * 10000000);

				if (ran >= 1 && ran <= 3) {
					go += "_";
					System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
					System.out.println(go + symbol);
					System.out.println(go2 + symbol2);
					System.out.println(go3 + symbol3);
					System.out.println(go4 + symbol4);

				} else if (ran == 101) {
					go += "__";
					System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
					System.out.println(go + symbol);
					System.out.println(go2 + symbol2);
					System.out.println(go3 + symbol3);
					System.out.println(go4 + symbol4);
				} else if (ran >= 5 && ran <= 7) {
					go2 += "_";
					System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
					System.out.println(go + symbol);
					System.out.println(go2 + symbol2);
					System.out.println(go3 + symbol3);
					System.out.println(go4 + symbol4);
				} else if (ran == 102) {
					go2 += "__";
					System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
					System.out.println(go + symbol);
					System.out.println(go2 + symbol2);
					System.out.println(go3 + symbol3);
					System.out.println(go4 + symbol4);
				} else if (ran >= 8 && ran <= 10) {
					go3 += "_";
					System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
					System.out.println(go + symbol);
					System.out.println(go2 + symbol2);
					System.out.println(go3 + symbol3);
					System.out.println(go4 + symbol4);
				} else if (ran >= 11 && ran <= 13) {
					go4 += "_";
					System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
					System.out.println(go + symbol);
					System.out.println(go2 + symbol2);
					System.out.println(go3 + symbol3);
					System.out.println(go4 + symbol4);
				} else if (ran == 103) {
					go3 += "__";
					System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
					System.out.println(go + symbol);
					System.out.println(go2 + symbol2);
					System.out.println(go3 + symbol3);
					System.out.println(go4 + symbol4);
				} else if (ran == 104) {
					go4 += "__";
					System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
					System.out.println(go + symbol);
					System.out.println(go2 + symbol2);
					System.out.println(go3 + symbol3);
					System.out.println(go4 + symbol4);
				}

				if (go.length() > 50) {
					System.out.println("▲가 우승했습니다.");
					win[0]++;
					run = false;
				} else if (go2.length() > 50) {
					System.out.println("★가 우승했습니다.");
					win[1]++;
					run = false;
				} else if (go3.length() > 50) {
					System.out.println("■가 우승했습니다.");
					win[2]++;
					run = false;
				} else if (go4.length() > 50) {
					System.out.println("●가 우승했습니다.");
					win[3]++;
					run = false;
				}

				while (true) {
					ran = (int) (Math.random() * 2);
					if (ran == 1) {
						break;
					}
				}

			}
			sc.nextLine().trim();
			sc.nextLine().trim();
			break;
			case 2:
				sum=win[0]+win[1]+win[2]+win[3];
				System.out.println("▲의 우승 확률"+(double)Math.round((win[0]/sum)*10000)/100+"%");
				System.out.println("★의 우승 확률"+(double)Math.round((win[1]/sum)*10000)/100+"%");
				System.out.println("■의 우승 확률"+(double)Math.round((win[2]/sum)*10000)/100+"%");
				System.out.println("●의 우승 확률"+(double)Math.round((win[3]/sum)*10000)/100+"%");
				break;
				
			case 3:
				System.out.println("종료합니다.");
				for(int i=0;i<4;i++) {
					player=i+1;
				sql.raceUp(player,win[i]);}
				mainrun=false;
				break;
			default:
				System.out.println("잘못입력하였습니다.");
				break;} //스위치 종료
		} // 메인 while 문 종료
		
	}
}