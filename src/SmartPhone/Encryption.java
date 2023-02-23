package SmartPhone;

// 4자리 비밀번호 암호화, 복호화 클래스
// 번호입력 -> 암호로 변경 ->결과값 리턴만 실행
// 따로 빼둔 이유 : 다른 앱에서도 암호화를 사용해서 임포트 해야할 경우, 해당 클래스만 임포트 하면 되기 때문.
public class Encryption {

	public String encryption(String enc) {
		
		String save = "";
		int sum = 0;
		int k;

		int[][] ch = new int[3][5];

		for (int i = 0; i <= 3; i++) { // 암호화

			for (int j = 0; j <= 4; j++) {
				sum++;
				if (enc.length() >= sum) {
					k = i + j;
					ch[i][j] = (int) enc.charAt(k);

					switch (j) {
					case 0:
						ch[i][j] += 100; // ㅇ
						break;
					case 1:
						ch[i][j] += 107; // ㅏ
						break;
					case 2:
						ch[i][j] += 97; // ㅁ
						break;
					case 3:
						ch[i][j] += 103; // ㅎ
						break;
					case 4:
						ch[i][j] += 104; // ㅗ
						break;
					}
					save += Integer.toString(ch[i][j]);
				} else {
					break;
				}
			}
			if (enc.length() >= sum) {
				break;
			}
		} // for문 종료

		// save에 저장됌
		return save;
		
	}
	
	public String decryption(String save) {
		String re [] = new String [save.length()/3]; // 복호화할 문자는 암호화된 문자의 1/3 개이기 때문에 배열 크기 지정
		int count = 0;
		int re2[]= new int[save.length()/3];	// 해당 문자열을 숫자로 바꿈 -> 복호화할때 숫자를 빼줘야 하기 때문
		
		for (int i = 0; i <save.length(); i+=3) { // 3개 단위씩 하나의 문자열에 넣고 바로 숫자로 변환
			re[count] = "";
			re[count] +=save.charAt(i);
			re[count] +=save.charAt(i+1);
			re[count] +=save.charAt(i+2);
			
			re2[count]=Integer.parseInt(re[count]); 
			count++;
		}
		
		
		int choice = re2.length;
		String re3="";
		for (int i=0; i<re2.length;i++) { //암호 해제
			choice = i%5;
			switch(choice+1) {
			case 1:
				re2[i]-=100; 
				break;
			case 2:
				re2[i]-=107; 
				break;
			case 3:
				re2[i]-=97;
				break;
			case 4:
				re2[i]-=103;
				break;
			case 5:
				re2[i]-=104;
				break;
			}
			
			 re3 += (char)re2[i];	// 숫자를 문자로 변형하여 문자열에 이어서 삽입
			
		}
		
		return re3;
	}
}
