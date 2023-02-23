package insta;

import java.util.Scanner;

public class InstaMain {

	public  void main(String id) {
		InstaDTO ind = new InstaDTO();
		InstaSQL sql = new InstaSQL();
		Scanner sc = new Scanner(System.in);
		boolean instarun = true;
		boolean pagerun = true;
		int menu = 0;
		sql.connect();
		

		while (instarun) {
			pagerun = true;
			System.out.println("\t\t  ==별스타 그램==");
			System.out.println("\t 1.게시글보기  2.검색  3.글쓰기  4.종료");
			System.out.print("입력 >> ");
			menu = sc.nextInt();
			sc.nextLine().trim();
			System.out.println();
			switch(menu) {
			case 1:
				while(pagerun) {
					sql.nextpage(ind);
					System.out.println("그만 보실려면 s를, 다음글을 보실려면 엔터를 누르세요");
					String ros =sc.nextLine();
					if(ros.equals("s")) {
						pagerun=false;
					}
				}
				break;
			case 2:
				while(pagerun) {
					System.out.println("\t\t== 검색 ==");
					System.out.println("1.내 글보기 \t2.아이디입력 \t3.나가기");
					System.out.print("입력 >> ");
					
					menu = sc.nextInt();
					sc.nextLine().trim();
					
					switch(menu) {
					case 1:
						ind.setId(id);
						sql.search(ind,id);
						System.out.println("마지막 글이였습니다.");
						System.out.println("나가실려면 엔터를 누르세요");
						sc.nextLine().trim();
						System.out.println("\n\n\n\n\n\n\n");
						break;
					case 2:
						System.out.print("아이디 입력 >> ");
						String otherid = sc.next();
						ind.setId(otherid);
						sql.search(ind,otherid);
						System.out.println("마지막 글이였습니다.");
						System.out.println("나가실려면 엔터를 누르세요");
						sc.nextLine().trim();
						sc.nextLine().trim();
						System.out.println("\n\n\n\n\n\n\n");
						break;
					case 3:
						pagerun = false;
						System.out.println("\n\n\n\n\n\n\n");
						break;
					default:
						System.out.println("잘못 입력하였습니다.");
						break;
					}
					
				}
				break;
			case 3: 
				System.out.println("글쓰기!");
				System.out.print("제목 : ");
				String title = sc.nextLine();
				System.out.print("내용 : ");
				String post = sc.nextLine();
				
				ind.setId(id);
				ind.setTitle(title);
				ind.setHits(0);
				ind.setPost(post);
				boolean yon = true;
				while(yon) {
				System.out.println("");
				System.out.println("1.업로드 \t2.취소");
				menu = sc.nextInt();
				switch(menu) {
				case 1:
					System.out.println("업로드 중...");
					sql.upload(ind);
					yon = false;
					break;
				case 2:
					System.out.println("취소합니다");
					yon = false;
					break;
				default:
					System.out.println("잘못 입력하였습니다.");
					break;
				}
				}
				
				break;
			case 4:
				System.out.println("별스타를 종료합니다.");
				instarun=false;
				break;
			default:
				System.out.println("잘못 입력하였습니다.");
				break;
				}// 메뉴 스위치 종료
			
		} // instarun -while 종료

	}

}
