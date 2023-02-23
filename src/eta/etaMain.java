package eta;

import java.util.Scanner;

public class etaMain {

	public void maineta(String mId) {
		Scanner sc=new Scanner(System.in);
		int menu,menu1;
		etaSQL sql=new etaSQL();
		ScdDTO scd=new ScdDTO();	
		boolean check;	
		sql.connect();
		String dotw,subject,period;
		boolean run2=true;
		while(run2) {
			boolean run1=true;
			System.out.println("=====================================================");
			System.out.println("1.시간표 관리\t2.자유게시판\t3.학점계산기\t0.종료");
			System.out.println("=====================================================");
			System.out.print("입력>>");
			int menu2=sc.nextInt();
			boolean run=true;
			switch(menu2) {
			case 1:		
		while(run) {
		System.out.println("=========================================================================");
		System.out.println("1. 시간표 등록 \t 2. 시간표 보기 \t 3.시간표 수정 \t 4.시간표 삭제 \t 0.종료");
		System.out.println("=========================================================================");
		System.out.print("입력>> ");
		menu = sc.nextInt();
		switch(menu) {
		case 1:
			check=sql.idCheck(mId);
			if(check) {
				dotw="월요일";
				sc.nextLine().trim();
				for(int i=1; i<=9;i++)
				{System.out.print(dotw+" "+i+"교시 수업을 입력해주세요>>");
				subject=sc.nextLine();
				period= i+"교시";
				scd.setmId(mId);
				scd.setDotw(dotw);
				scd.setPeriod(period);
				scd.setSubject(subject);
				sql.setScdt(scd);}
				dotw="화요일";
				for(int i=1; i<=9;i++)
				{System.out.print(dotw+" "+i+"교시 수업을 입력해주세요>>");	
				subject=sc.nextLine();			
				period= i+"교시";
				scd.setmId(mId);
				scd.setDotw(dotw);
				scd.setPeriod(period);
				scd.setSubject(subject);
				sql.setScdt(scd);}		
				dotw="수요일";			
				for(int i=1; i<=9;i++)
				{System.out.print(dotw+" "+i+"교시 수업을 입력해주세요>>");
				subject=sc.nextLine();
				period= i+"교시";
				scd.setmId(mId);
				scd.setDotw(dotw);
				scd.setPeriod(period);
				scd.setSubject(subject);
				sql.setScdt(scd);
				}
				dotw="목요일";
				for(int i=1; i<=9;i++)
				{System.out.print(dotw+" "+i+"교시 수업을 입력해주세요>>");
				subject=sc.nextLine();
				period= i+"교시";
				scd.setmId(mId);
				scd.setDotw(dotw);
				scd.setPeriod(period);
				scd.setSubject(subject);
				sql.setScdt(scd);
				}			
				dotw="금요일";
				for(int i=1; i<=9;i++)
				{System.out.print(dotw+" "+i+"교시 수업을 입력해주세요>>");
				subject=sc.nextLine();
				period= i+"교시";
				scd.setmId(mId);
				scd.setDotw(dotw);
				scd.setPeriod(period);
				scd.setSubject(subject);
				sql.setScdt(scd);
				}}
		
			break;
		case 2:
			check=sql.idCheck(mId);
			if(!check) {
			System.out.println("\t1교시\t2교시\t3교시\t4교시\t5교시\t6교시\t7교시\t8교시\t9교시\t");
			dotw="월요일";
			sql.Showsche(mId,dotw);
			dotw="화요일";
			sql.Showsche(mId,dotw);
			dotw="수요일";
			sql.Showsche(mId,dotw);
			dotw="목요일";
			sql.Showsche(mId,dotw);
			dotw="금요일";
			sql.Showsche(mId,dotw);
			}
			else {
				System.out.println("해당 아이디의 시간표가 존재하지 않습니다.");
				System.out.println("시간표를 등록해주세요.");}
			break;
		case 3:
			check=sql.idCheck(mId);
			if(!check) {	
			while(run1) {
			System.out.println("1.요일수정\t2.부분수정\t0.종료");
			System.out.print("입력>>> ");
			menu1=sc.nextInt();
			switch(menu1) {
			case 1:
				sc.nextLine().trim();
				System.out.print("수정할 요일을 입력해주세요>>");
				dotw=sc.nextLine();
			for(int i=1;i<10;i++) {	
			System.out.print(dotw+" "+i+"교시"+" 수업 이름을 입력해주세요>>");
			subject=sc.nextLine();		
			period=i+"교시";
			sql.ScheModify(subject, dotw, period,mId);
			}
			
				break;
			case 2:
			sc.nextLine().trim();
			System.out.print("수정할 요일을 입력해주세요>>");
			dotw=sc.nextLine();
			System.out.print("수정할 시간을 입력해주세요( 예)1교시 ) >>");
			period=sc.nextLine();
			System.out.print("변경될 수업 이름을 입력해주세요>>");
			subject=sc.nextLine();		
			sql.ScheModify(subject, dotw, period,mId);
			break;
			case 0:
				run1=false;
				break;
			default:
				System.out.println("잘못입력하셨습니다.");
				break;}
			}}
			else {
			System.out.println("해당 아이디의 시간표가 존재하지 않습니다.");
			System.out.println("시간표를 등록해주세요.");}
			break;
		case 4:
			check=sql.idCheck(mId);
				if(!check) {
					System.out.println("해당 아이디의 시간표를 삭제하시겠습니까?(1.예 2.아니오)");
					int ans=sc.nextInt();
					if(ans==1) {
						sql.delSche(mId);
					}
				}
				else {
					System.out.println("해당 아이디의 시간표가 존재하지 않습니다.");
					System.out.println("시간표를 등록해주세요.");}
			
			break;
		case 0:
			System.out.println("프로그램을 종료합니다.");
			run=false;
			break;
		default:
			System.out.println("잘못 입력 하셨습니다");
			break;
		}
		}
		break;
			case 2:
				while(run) {
					String tittle,writing;
					System.out.println("======================================================================");
					System.out.println("1.게시글 목록\t2.게시글 검색\t3.글 작성 \t4.게시글 삭제 \t0.종료");
					System.out.println("======================================================================");
					System.out.print("입력>>");
					int postN=sc.nextInt();
					switch(postN) {
					case 1:
						System.out.println("글번호\t제목\t\t아이디\t조회수");
						sql.PSearch();
						break;
					case 2:
						System.out.print("확인할 글 번호를 입력해주세요>>");
						int CH=sc.nextInt();
						sql.pSel(CH);
						sql.pselp(CH);
						break;
					case 3:
						//글 작성 자리
						sc.nextLine().trim();
						System.out.print("제목: ");
						tittle=sc.nextLine();
						System.out.print("내용: ");
						writing=sc.nextLine();
						sql.produce(tittle,writing, mId);
						break;
					case 4:
						sc.nextLine().trim();
						System.out.println("글번호\t제목\t\t조회수");
						sql.delpos(mId);
						System.out.println("삭제할 게시물 번호를 입력해주세요.");
						System.out.print("입력>>");
						CH=sc.nextInt();
						sql.delpos(CH, mId);
						break;
					case 0:
						run=false;
						break;
					default:
						System.out.println("잘못입력하셨습니다.");
						break;
					}
				}
				break;
			
			case 3:
				Credit.Credit();
				break;
			case 0:
				run2=false;
				break;
			default:
				System.out.println("잘못입력하셨습니다.");
				break;
		
		}}
	}
}

