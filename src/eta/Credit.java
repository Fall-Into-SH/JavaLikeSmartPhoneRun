package eta;

import java.util.Scanner;

public class Credit {
public static void Credit() {
		
		// 점수는 사용자에게 입력받을 것이기 때문에 
		// Scanner 객체 생성  
		Scanner sc = new Scanner( System.in );
		System.out.println("------------------------");
		System.out.println("2학점 수업 갯수를 입력해주세요");
		System.out.print("입력>>");	
		int S2=sc.nextInt();//2학점 수업 갯수
		double su2=0;
		double su=0;
		double sum=0;
		for(int i=0;i<S2;i++) {		
			// 성적을 입력 받음.
		do {
			System.out.print( "당신의 "+(i+1)+"번째 수업 성적을 입력하세요 : " );
			sum = sc.nextDouble();
			if(sum>4.5) {
				System.out.println("잘못입력하셨습니다! 다시입력해주세요");}}
		while(sum>4.5);
		su2+=sum;
		}
		System.out.println("------------------------");
		System.out.println("3학점 수업 갯수를 입력해주세요");
		System.out.print("입력>>");	
		int S3=sc.nextInt();//3학점 수업 갯수
		double su3=0;
		for(int i=0;i<S3;i++) {		
			// 성적을 입력 받음.
		do {
			System.out.print( "당신의 "+(i+1)+"번째 수업 성적을 입력하세요 : " );
			sum = sc.nextDouble();
			if(sum>4.5) {
				System.out.println("잘못입력하셨습니다! 다시입력해주세요");}}
		while(sum>4.5);
		su3+=sum;
		}
		su=((su2*2)+(su3*3))/(S2*2+S3*3);
		
				System.out.println("당신의 평균 학점은 "+(double)Math.round((su)*100)/100+" 입니다");
				System.out.println("프로그램을 종료합니다. 엔터를 눌러주세요.");
				sc.nextLine().trim();
				sc.nextLine().trim();
				
}	}
