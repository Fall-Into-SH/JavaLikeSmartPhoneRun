CREATE TABLE USERDATA(
	MID		NVARCHAR2(20) PRIMARY KEY,   --유저 아이디
	MPW		NVARCHAR2(12),               --유저 비밀번호
	MNAME	NVARCHAR2(5),                --유저 이름
	MBIRTH	NVARCHAR2(10),               --유저 생일
	MPHONE	NVARCHAR2(20),               --유저 번호
    MAGE NVARCHAR2(3),                      --유저 나이
	CONSTRAINT MID_LENGTH CHECK(LENGTH (MID) >=5)      --제약조건 유저 아이디 5글자 이상
) ;

CREATE TABLE PHONUM(
    PPHO NVARCHAR2(20) PRIMARY KEY,       --폰 폰번호
    PNAME NVARCHAR2(10),                  --폰 폰이름
    MID NVARCHAR2(20),
    CONSTRAINT PHNUM_FK_MID FOREIGN KEY(MID) REFERENCES USERDATA(MID)
);

CREATE TABLE BANK(
    ACCOUNT NVARCHAR2(20) PRIMARY KEY,    --계좌번호
    BALANCE NUMBER,                       --계좌잔액
    MID NVARCHAR2(20),                    --유저 아이디(USERDATA에서 가져옴)
    CONSTRAINT BANK_FK_MID FOREIGN KEY(MID) REFERENCES USERDATA(MID)  --USERDATA에서 MID를 가져오는 명령어
);


CREATE SEQUENCE B_SEQ
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;          --BANKDB 시퀀스 생성

CREATE TABLE BANKDT(
     B NUMBER PRIMARY KEY,   -- 거래순서(시퀀스 적용할 컬럼)
     ACCOUNT NVARCHAR2(20),  --계좌번호 BANK테이블에서 가져옴
     CATEGORY NVARCHAR2(3),  --거래 유형
     COST NUMBER,            --금액
     BDATE NVARCHAR2(20),    --거래날짜
    CONSTRAINT BANKDT_FK_ACCOUNT FOREIGN KEY(ACCOUNT) REFERENCES BANK(ACCOUNT)--BANK에서 ACCOUNT를 가져오는 명령어
);          --주의! BANKDT 테이블 INSERT사용시 
--INSERT INTO BANKDT VALUES(B_SEQ.NEXTVAL, ?, ?, ? , ?);로 맨앞에 시퀀스 적용을 위해 B_SEQ.NEXTVAL 사용

CREATE TABLE BaeminTable(  
   BCODE    NUMBER NOT NULL,
   SNAME    NVARCHAR2(20) NOT NULL,
   SCODE    NUMBER PRIMARY KEY
   );  -- 배민 테이블 생성
   
   
CREATE SEQUENCE SEQ_BOARD
 START WITH 1
 INCREMENT BY 1;

   
   CREATE TABLE BMENUTable( 
   SCODE    NUMBER,   --  외래키
   SMENU    NVARCHAR2(20) NOT NULL,
   PRICE    NUMBER,
   CONSTRAINT fk_b_m FOREIGN KEY (SCODE) 
   REFERENCES BaeminTable (SCODE)
   );  -- 배민 메뉴 테이블 생성
   
   CREATE TABLE MovieTable(  
   MNAME    NVARCHAR2(20) NOT NULL, -- 영화제목
   MCODE    NUMBER PRIMARY KEY  -- 영화 코드
   );  -- 영화 테이블 생성
   
   CREATE TABLE MovieTicketTable(  
   MCODE    NUMBER, -- 영화코드
   MTIME    TIMESTAMP,  -- 상영시간 / 사용식 : YYYY-MM-DD hh:mm:ss / NOT NULL
   LCODE    NUMBER, -- 지점코드
   CONSTRAINT fk_m_c FOREIGN KEY (MCODE) 
   REFERENCES MovieTable (MCODE)
   );  -- 예매 테이블 생성
   
   
   CREATE TABLE BuyTicketTable(
    MID NVARCHAR2(20),
    MCODE    NUMBER,
    MTIME    TIMESTAMP,
    PEOPLE   NUMBER,
    LCODE    NUMBER
    );
   
   CREATE TABLE InstaTable(  
   Iid    NVARCHAR2(20) NOT NULL, -- 인스타 아이디
   Ititle NVARCHAR2(20) NOT NULL,  -- 제목
   Ihits  NUMBER NOT NULL, -- 조회수
   Ipost  NVARCHAR2(20)  -- 게시글
   );  -- 인스타 테이블 생성
      
   
   CREATE TABLE RACEWINCOUNT(
   PLAYER NUMBER PRIMARY KEY,
   WIN NUMBER
   );
   INSERT INTO RACEWINCOUNT VALUES(1,0); 
   INSERT INTO RACEWINCOUNT VALUES(2,0); 
   INSERT INTO RACEWINCOUNT VALUES(3,0); 
   INSERT INTO RACEWINCOUNT VALUES(4,0); 
   
   
   --CH시퀀스
CREATE SEQUENCE CH_SEQ
  START WITH 1
  INCREMENT BY 1; 

--S시퀀스
CREATE SEQUENCE S_SEQ
  START WITH 1
  INCREMENT BY 1; 
--시간표테이블
CREATE TABLE SCHEDULE(
    S NUMBER PRIMARY KEY,
    MID NVARCHAR2(20),              --아이디
    DOTW NVARCHAR2(6),              --요일 코드
    PERIOD NVARCHAR2(6),            --교시 코드
    SUBJECT NVARCHAR2(15),          --수업 이름
    CONSTRAINT SCHEDULE_FK_MID FOREIGN KEY(MID) REFERENCES USERDATA(MID)
);
--게시판테이블
CREATE TABLE POST(
    CH NUMBER PRIMARY KEY,
    TITTLE NVARCHAR2(20),                --제목
    WRITING NVARCHAR2(500),              --게시글
    MID NVARCHAR2(20),                   --아이디
    VIEWS NUMBER
    );
   --USERDATA에 정보입력(MID를 갖고오기 위해)
INSERT INTO USERDATA VALUES('abc123', '1234', '홍길동', '2000-01-01','01012341234','35');

INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '월요일', '1교시', '국어');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '월요일', '2교시', '수학');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '월요일', '3교시', '과학');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '월요일', '4교시', '영어');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '월요일', '5교시', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '월요일', '6교시', '체육');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '월요일', '7교시', '체육');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '월요일', '8교시', '미술');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '월요일', '9교시', '미술');

INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '화요일', '1교시', '수학');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '화요일', '2교시', 'C언어');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '화요일', '3교시', 'C언어');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '화요일', '4교시', '자바');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '화요일', '5교시', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '화요일', '6교시', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '화요일', '7교시', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '화요일', '8교시', '영어');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '화요일', '9교시', '영어');

INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '수요일', '1교시', 'C언어');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '수요일', '2교시', 'C언어');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '수요일', '3교시', 'C언어');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '수요일', '4교시', '영어');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '수요일', '5교시', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '수요일', '6교시', '영어');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '수요일', '7교시', '영어');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '수요일', '8교시', '국어');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '수요일', '9교시', '국어');

INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '목요일', '1교시', '체육');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '목요일', '2교시', '체육');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '목요일', '3교시', '체육');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '목요일', '4교시', '체육');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '목요일', '5교시', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '목요일', '6교시', 'C++');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '목요일', '7교시', 'C++');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '목요일', '8교시', 'C++');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '목요일', '9교시', NULL);

INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '금요일', '1교시', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '금요일', '2교시', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '금요일', '3교시', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '금요일', '4교시', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '금요일', '5교시', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '금요일', '6교시', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '금요일', '7교시', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '금요일', '8교시', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '금요일', '9교시', NULL);

--게시판 데이터
INSERT INTO POST VALUES(CH_SEQ.NEXTVAL,'쉬워요','쉽습니다.','abcd',0);
INSERT INTO POST VALUES(CH_SEQ.NEXTVAL,'너무 어려워요','어려워요.','cdef',0);
INSERT INTO POST VALUES(CH_SEQ.NEXTVAL,'수업이 졸려요','zzzzzzzzzzzzz','abcdef',20);
INSERT INTO POST VALUES(CH_SEQ.NEXTVAL,'수업이 졸려요','zzzzzzzzzzzzz...','abcd',0);
INSERT INTO POST VALUES(CH_SEQ.NEXTVAL,'집가고 싶다','2시간 남았다....','ccccc',40);
INSERT INTO POST VALUES(CH_SEQ.NEXTVAL,'필독! !','주의!!!!!!!!','admin',495);
INSERT INTO POST VALUES(CH_SEQ.NEXTVAL,'수업이 졸려요','zzzzzzzzzzzzz...','abcd',0);
INSERT INTO POST VALUES(CH_SEQ.NEXTVAL,'','zzzzzzzzzzzzz...','abcd',0);
   
   
    -- 인스타 테이블 데이터 삽입 (아이디, 제목, 조회수, 게시글)
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('BLACKPINK', '빠져버리는', '99999', 'Kick in the door');  
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('IVE', '남들', '9996', '또 모르지 내 마음이');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('NewJeans', '너도 말해줄래', '5456', 'You and me 내 맘이 보이지');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('NewJeans', '누가 내게 뭐라든', '7878', 'NewJeans 1st EP');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('IVE', '재미없어 어쩌지', '4564', 'LOVE DIVE');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('GIRLS GENERATION', '예민하대 나', '56178', 'FOREVER 1');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('WSG', '그때 그 순간 그대로', '782657', 'WSG워너비 1집');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('ITZY', 'SNEAKERS', '7116', 'CHECKMATE');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('WSG', '보고싶었어', '617', 'WSG워너비 1집');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('TEMPEST', 'Cant Stop Shining', '781678', 'SHINING UP');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('TEMPEST', 'START UP', '7816', 'SHINING UP');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('TEMPEST', '하루만', '1876', 'SHINING UP');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Xydo', '한강이나 갈까', '7816', '한강이나 갈까');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('KEY', '가솔린', '5416', 'Gasoline - The 2nd Album');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('TWICE', 'BETWEEN', '7862', 'Talk that Talk');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('DINDIN', '비 내리던 그날처럼', '17', 'Feat. 윤명');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('J_Park', 'Bite', '8762', 'Bite');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('LUCY', '놀이', '7618', 'Childhood');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('IVE', 'My Satisfaction', '7816', 'After LIKE');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('abba45', '아무', '1586', '저 날씨처럼 바뀔지');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('ac/dc11', '비워 ', '7861', '날 나조차 다 알 수 없으니');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('david bowie436', '봐 ', '111', '그게 뭐가 중요하니');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('eagles45', '10CM', '8768', '지금 네게 완전히');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('earth38', '빈칸에게 ', '7777', '푹 빠졌단 게');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('eurythmics', '비밀이야 ', '868', '중요한 거지');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('fleetwood', '몽롱한 ', '786', '아마 꿈만 같겠지만');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('hendrix', '걸음걸이', '786', '분명 꿈이 아니야');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('zepplind99', '거리', '785367', '달리 설명할 수 없는');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('marvin737', 'tummy ', '53', '이건 사랑일 거야');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('micheal', '불려가 ', '453', '방금 내가 말한 감정');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('jackson', 'Follow ', '37', '감히 의심하지 마');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('floyd', 'Growing ', '8', '그냥 좋다는 게 아냐');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('beatles', '끌어당김', '4534', 'You and I');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Bab', '자유로운 기분', '78', '밤은 다시 길고');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('razy', '고민', '787385', '깊어졌네');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('cars ', '색안경 끼고', '374734', '나는 점점 너로 잠 못 들게 돼');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('sharona', '보는 게', '853', '글로 적어내긴 어려운 이 기분을');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('underground ', '죄지', '7853', '너도 느꼈으면 좋겠는데');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('sharona', 'not ', '77', '너는 아무 생각 없이 몇 번');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('arctic ', '내 멋대로', '35838', '나를 지나가며 웃은 거라지만');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('coldplay ', '갈 거야', '73', '나의 하얀 옷에 너의 잉크가 묻어');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('killers', '필요 없어', '72', '닦아낼 수 없을 만큼 번졌네');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('stevens ', '난 언제든', '38', '달콤한 색감이 물들어 조금씩');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('radiohead ', '원래 두려운 게', '435', '정신을 차렸을 땐 알아볼 수도 없지');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('onerepublic ', '없어 난', '728', '가득 찬 마음이');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('verve ', '상관없어', '768', '여물다 못해 터지고 있어');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('weezer ', 'call ', '245', '내일은 말을 걸어봐야지');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('2pac ', '나로 살고 싶어', '475', '요즘 노랜 뭔가 맘에 안 들어');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('50cent ', '턱 끝을 치켜올린 채로', '78', '네게 불러 주기엔 좀 어려워서');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('wayne ', '하나 ', '4', '나름 며칠 밤을 새워 연습했지만');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('roots ', '멀리 가보자고', '45', '네게 들려주기엔 무리인 것 같아');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('aphex ', '기다리던 순간', '76', '너는 번질수록 진해져 가고');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('punk ', '빨리', '34', '나의 밤은 좀 더 길고 외롭지만');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('daft ', '심장', '768', '하루종일 떠오르는 너의 얼굴은');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('clan ', '불태워', '5', '방을 가득 채워 무지개같이');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('prodigy ', '지금 ', '786', '달콤한 색감이 물들어 조금씩');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('zedd ', '시작', '7', '정신을 차렸을 땐 알아볼');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Symphony', '안 했어', '453', 'Wake up in the morning');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Closer', '요즘', '73', '원래 와야 할 문자가 저 어디');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Youth', '하나 있지', '13', '다른 데로 갔나 봐 저 멀리');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Sivan', '상관없어', '13', '난 찾는 중이야 넌 월리');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Grande', 'call me trouble', '2', '난 경찰이고 넌 범인');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Lauv', '나로 살고 싶어', '783', '추격전을 벌였어 길거리');
   
   -- INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   -- VALUES ('ㅐㅐ', 'ㅐㅐ', 'ㅐㅐ', 'ㅐㅐ');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Bandit', '너에게는', '28', '나도 알아 나의 엇인지');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Clean ', '범인', '7786', '난 못났고 별 볼일 없지');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Chainsmokers', '월리', '7853', '그 애가 나를한다는 게');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('this', '멀리', '54', '슬프지만 내가 뭐라고');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Anne ', '비행기 ', '453', '빛나는 누군갈 는 일에');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Marie', '어디', '73', '기준이 있는 거라면');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Gomez', '와야 ', '53', '이해할 수 없지만 걸');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Selena ', '일들', '123', '난 안경 쓴 샌님이니까');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Charlie ', ' 사라지는 1', '3453', '내가 이렇게 는데');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Puth', '말해왔지 ', '453', '나는 아무것도 할 수');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Rae ', '팔색 ', '78', '내가 그렇게 불편할까요 내가 ');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Owl ', '공백으로 ', '453', '아마도 내일도 그 애는 ');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Avicii', '수영이 ', '453', '이제 알아 나의 할 ');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('MAroon5', '언제쯤 ', '783', '다 포기하고 참아야 하지');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Passenger', '끝나', '453', '저 잘나가는 너의');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('direction', '나도 ', '453', '되고 싶지만 불가능하지');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Maps', '알아 ', '783', '빛나는 누군갈 좋아하는 일에');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('do', '무엇인지', '4', '기준이 있는 거라면');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Perfect', '볼일 ', '453', '이해할 수 없지만');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Sheeran', '한다는 ', '12', '난 안경 쓴 샌님이니까');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Ed ', '뭐라고', '4', '내가 이렇게 사랑하는데');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Passenger', '빛나는 ', '873', '아마도 내일도 그 애는');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Goulding', '누군갈 ', '58', '아마도 내일도 그 애는');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Ellie ', '좋아하는 ', '53', '이듬해 질 녘 꽃 피는 봄 ');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('direction', '일에', '8', '한여름 밤의 꿈');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('What ', '있는 ', '853', '가을 타 겨울 내릴 눈');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Queen', '거라면', '3', '1년 네 번 또다시 봄');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('kill ', '이해할 ', '8', '정들었던 내 젊은 날');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Rock ', '없지만 ', '78', '이제는 안녕');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Now', '샌님이니까', '53', '아름답던 우리의');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Life', '이렇게 ', '523', '봄 여름 가을 겨울');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('chyna ', '사랑하는데 ', '1', 'Four seasons');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Upside ', '원하는데', '83', '비 갠 뒤에 비애');
   
   -- 여기서 부터 시작 0901
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('방 ', '안에선 ', '234234', '안전하니 ');     
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('외출은  ', '야  ', '12343', 'UGRS  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('카메라는  ', '어렵더라  ', '213', '거리서 ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('눈도  ', '마주치지  ', '7575', 'party  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('넌  ', '눈도  ', '531', '마주치지  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('party  ', '불나요  ', '3434', '데일라  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('make  ', 'call  ', '3243', '난  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('반대로 ', '불냈지  ', '43', '개구린  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Now  ', 'got  ', '43341', '물음표  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('질문이 ', '수두룩  ', '43543', 'How  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('1llibition  ', '이상  ', '4356', '이상  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Yah  ', 'countin ', '5262', 'paper  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('미래  ', '지폐가  ', '2346', '공장은  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('동갑이  ', '형의  ', '124', '필요하다고  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Um ', 'yah bition ', '32543', '콜록  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('콜록  ', '소화기 ', '34324', '찾아놔  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('불난다  ', '단위로는  ', '43132', '몇천  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('불이야  ', '소방차도  ', '14343', '불내요  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('아브라카다브라  ', '내리라고  ', '46354', 'bring  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('the  ', 'fire  ', '46324', 'Call  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('my  ', '덤빈다면  ', '513543', '그냥  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('파열  ', 'fan  ', '326345', '웃으며  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('줘라  ', '안녕  ', '143', '그에  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('반해  ', '나야  ', '1435', '끓여  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('먹어  ', '라면 ', '53776', '걔네들  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('맛대로  ', '맞춰 ', '53757', '봤자  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('어차피  ', '인스턴트  ', '657457', '같은  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('애들  ', '힙합은  ', '34525', '염치없이  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('그냥  ', '안에선 ', '76576', '안전하니 ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('댄스  ', '몸은  ', '6875', '옆에서  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('like  ', '안에선 ', '5437', '레시피  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('없던  ', '연말엔  ', '7687', 'sofa  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('일대일  ', '평온해진   ', '34567', '더욱  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('수업  ', '받네  ', '76857', '싸움닭  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('헬기  ', '타고  ', '789778', '깨끗하게  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('정리  ', '상구형  ', '625456', '머리처럼  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES (' 가끔은  ', '불을  ', '567546', '불로  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('끄지  ', '안에선 ', '63456', 'like  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('거기서  ', '거기잖아  ', '3452', '말풍선 ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('입만  ', '샴페인  ', '5674', '터지는 ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('삐뽀  ', '필요해  ', '785685', '많은  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('시선  ', '필요해  ', '345634', '많은  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('인정  ', '피쳐링  ', '6785678', '많은  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('일정  ', '못해  ', '7896978', '칩거를  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('돼가지  ', '돼가지  ', '345', '빌런  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('여기  ', '내  ', '758', '멍석 ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('깔지  ', '너흰 ', '5768', 'bring  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('맞춰가네  ', '어떤  ', '789', '타입  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('맞춰가  ', 'customize  ', '4536', '벌려가지  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('온도  ', '차  ', '567', '불  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('꺼져  ', '스튜디오  ', '4563', '들어온  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('remix ', '동전한  ', '4356', '들어온  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('느그들 ', '은  ', '6543', 'American ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('woo  ', '이렇게 ', '757', '하는  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('맞나  ', '빼끼면   ', '578', '되나 ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('YouTube  ', '보고  ', '6585', '좋은  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('약빤  ', '얘네들  ', '3456', '빨리  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('데려가  ', '달려라 ', '6578', 'ambulance  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('목적진  ', '신촌  ', '78365', 'Severance  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('주치의는  ', 'beats  ', '74386', 'Dr ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('GRAY ', '다시  ', '852', '가져와  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('불꽃  ', '수록곡처럼 ', '2678', '불법  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('조명이 ', '꺼져도 ', '6989', '쉬어  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('그녀와  ', '같이  ', '68769', '타고 ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('있어  ', 'suck  ', '7986', 'my  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('사랑  ', '사랑  ', '2786', '부를까  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('이제  ', '워밍업 ', '527', '사버린  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('기대 ', '말로만  ', '3786', '떠드는  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('랩퍼들  ', '비일비재  ', '6573', '후에  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('작업  ', 'dm  ', '78389', '날카로워  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('bitch  ', '때로는  ', '387', '부드럽지 ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('멋은  ', '척관  ', '7839', '다르지 ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('예상이 ', '되니  ', '6368', '움직임  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('점수나  ', '매겨  ', '7863', '방을  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('먹여  ', '드림  ', '8763', '뭐라  ');  
    INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('하던 ', '양질의  ', '782', '음악을 ');     
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('퍼다   ', 'Hustlin  ', '7862', '삶이지  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('말이지   ', '그냥   ', '87629', '행동은 ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('유행이라고   ', '따라  ', '8729', 'got  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('own   ', 'shit  ', '782', '간지지   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('파도   ', '등에    ', '7829', 'city   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('다니지   ', '메고   ', '852 ', 'but  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('fuck  ', 'you   ', '82', 'ride    ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('wit   ', 'Easy   ', '2052', 'money   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('날치기  ', 'Heavy   ', '852', 'weight   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('단백질   ', 'Beef   ', '4524', '원하면  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('갈비찜   ', 'Hater  ', '782', '화이팅   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Check   ', 'your   ', '636', 'flex   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Nike   ', 'Take   ', '36873', 'your   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('bitch  ', 'yah like  ', '2772', '나이스  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('내가  ', '너무  ', '738', 'thug  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('life   ', '이지   ', '639', 'verse  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('니까   ', '마음이지   ', '27', 'one  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('nine   ', '진짜가   ', '2345', '떴지  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('쌔끈한   ', '크루  ', '662872', '대충  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('뱉어도  ', '예술로   ', '1872', '박히는   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('쓰리쿠  ', '랩은   ', '57427', 'splash  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('these   ', 'face   ', '2654', '대빵만   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('호스는   ', '게임  ', '84467', '현찰이   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('카드   ', '긁어  ', '7487', '세상   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('모든   ', '쌔비지  ', '3463', '철구도  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('놀라  ', 'songs  ', '252', 'drop   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('labels   ', 'Real   ', '7547', 'boss   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('they   ', 'speak ', '2364', 'fabels  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('멋있는지   ', '설명하려면   ', '743', '정도   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('밤새   ', '나는  ', '8467', '싸는   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('달아나', '불같이   ', '657', '물집  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('불같이   ', 'Bull    ', '373', '불같이   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('금식  ', '다이어트   ', '56436', '불나는   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('파이리  ', '스탈은   ', '324523', 'HypeBeast   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('검정   ', '반짝이는   ', '75637', '오데마  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES (' 사장님  ', '필요하면   ', '878', '사지  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('기리보이   ', '팔랑귀  ', '74745', '아크로님   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('팔락이지   ', 'Ooh  ', '2356', 'Make  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('가랑비   ', '올해는  ', '2828', '반박불가 ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('쫄리면   ', '필요해  ', '4848', '뒈지라   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('삼팔광이야   ', '애인들은   ', '2373', '이뻐   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('TMI   ', '하나  ', '84856', '폰은  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('개고   ', '언니들은  ', '6784', '꽝이야   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('내년도 ', '우리꺼  ', '2745', '손목에   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('전세를  ', '찬다  ', '7245', '아님  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('돼지   ', '새대갈  ', '7456', '조선에   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('주옥같은  ', '가산   ', '86786', 'much  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('information  ', 'Ooh  ', '96578', '돌아   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('거지   ', '같은   ', '5435', 'metaphor ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('꼴에  ', '비디오래   ', '7376', '굳이   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('봐도  ', '이런   ', '256542', '처음이래   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('타지 ', '삐딱선   ', '423534', '원투펀치 ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('바닥에   ', '엎드려 ', '765', '적자   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('의미로   ', 'ocean   ', '8568', '땜빵  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('plata   ', '資格  ', '3253', '冗談   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('that   ', 'worldwide   ', '7567', '같이   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('타는   ', '티코  ', '32456', '벌어   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('재물   ', '지노처럼   ', '74574', '미쳤어   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('미쳤어   ', '나도   ', '76856', '진흙  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('속에서 ', '핀  ', '45634', '모든   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('얻었고   ', '잃었어 ', '7457547', '확실한   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('가진  ', '실력  ', '15354', '근데  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('요즘   ', '누가  ', '실력으로 ', '매겨  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('순위를   ', '많은   ', '4536', '짱이지   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Double   ', 'higher   ', '5673', '다시   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('쓰는   ', '이력서  ', '27457', 'gone  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('기타를  ', '자랑에  ', '647834', '명품   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('대놓고  ', '주작질   ', '5685', '스윙스   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Hiphop   ', '칸예면   ', '32452', '칸예가   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('선택   ', '뭐든   ', '345325', '희귀종  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('유일무이  ', '껴안아   ', '7346', '너네들과 다르지 ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('밤마다  ', '불러   ', '58465', '밤바다   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('우리   ', 'different   ', '7808', 'countin  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('너흰   ', '가진   ', '94457', '대로만   ');  
   
    -- 영화 테이블 데이터 삽입 (영화제목, 영화코드)
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('탑건: 매버릭', '1');  
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('뽀로로 극장판 드래곤캐슬 대모험', '2');
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('헤어질 결심', '3');
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('한산: 용의 출현', '4');
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('헌트', '5');
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('미니언즈2', '6');
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('명량', '7');
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('극한직업', '8');
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('신과함께_죄와 벌', '9');
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('베테랑', '10');
   
    -- 예매 테이블 데이터 삽입 (영화코드, 지점코드)
      -- 지점 : 1
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('1', '2022-09-03 14:30:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('1', '2022-09-04 17:00:00', '1');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('1', '2022-09-05 13:10:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('1', '2022-09-09 14:30:00', '1');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('2', '2022-09-03 11:30:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('2', '2022-09-04 10:30:00', '1');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('2', '2022-09-07 19:20:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('2', '2022-09-09 19:50:00', '1');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('3', '2022-09-03 11:10:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('3', '2022-09-04 13:20:00', '1');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('3', '2022-09-05 13:10:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('3', '2022-09-08 14:30:00', '1');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('4', '2022-09-03 09:30:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('4', '2022-09-04 19:50:00', '1');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('4', '2022-09-08 13:10:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('4', '2022-09-09 19:20:00', '1');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('5', '2022-09-03 14:30:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('5', '2022-09-04 17:30:00', '1');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('5', '2022-09-05 13:10:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('5', '2022-09-08 14:30:00', '1');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('6', '2022-09-03 11:40:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('6', '2022-09-04 13:50:00', '1');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('6', '2022-09-08 13:10:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('6', '2022-09-09 19:20:00', '1');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('7', '2022-09-05 14:30:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('7', '2022-09-07 11:50:00', '1');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('7', '2022-09-08 19:20:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('7', '2022-09-09 14:30:00', '1');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('8', '2022-09-04 19:20:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('8', '2022-09-08 10:00:00', '1');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('8', '2022-09-09 13:10:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('8', '2022-09-09 19:20:00', '1');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('9', '2022-09-06 11:30:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('9', '2022-09-07 09:50:00', '1');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('9', '2022-09-08 13:10:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('9', '2022-09-09 14:30:00', '1');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('10', '2022-09-08 13:10:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('10', '2022-09-09 10:00:00', '1');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('10', '2022-09-09 13:10:00', '1'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('10', '2022-09-09 19:20:00', '1');
   
   
         -- 지점 : 2
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('1', '2022-09-03 10:00:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('1', '2022-09-04 11:30:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('1', '2022-09-06 09:30:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('1', '2022-09-08 13:10:00', '2');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('2', '2022-09-04 10:30:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('2', '2022-09-05 11:50:00', '2');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('2', '2022-09-06 09:30:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('2', '2022-09-08 13:10:00', '2');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('3', '2022-09-05 10:00:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('3', '2022-09-06 11:30:00', '2');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('3', '2022-09-08 13:10:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('3', '2022-09-09 19:50:00', '2');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('4', '2022-09-04 11:40:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('4', '2022-09-07 17:00:00', '2');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('4', '2022-09-08 13:10:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('4', '2022-09-09 19:50:00', '2');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('5', '2022-09-06 10:00:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('5', '2022-09-07 10:30:00', '2');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('5', '2022-09-08 09:30:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('5', '2022-09-09 19:20:00', '2');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('6', '2022-09-04 14:30:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('6', '2022-09-05 11:50:00', '2');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('6', '2022-09-06 09:30:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('6', '2022-09-08 19:50:00', '2');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('7', '2022-09-06 11:30:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('7', '2022-09-07 11:40:00', '2');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('7', '2022-09-08 09:30:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('7', '2022-09-09 19:20:00', '2');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('8', '2022-09-04 10:30:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('8', '2022-09-06 10:00:00', '2');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('8', '2022-09-08 13:10:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('8', '2022-09-09 19:50:00', '2');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('9', '2022-09-03 11:50:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('9', '2022-09-04 11:30:00', '2');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('9', '2022-09-06 09:30:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('9', '2022-09-08 19:20:00', '2');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('10', '2022-09-05 10:30:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('10', '2022-09-07 10:00:00', '2');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('10', '2022-09-08 09:30:00', '2'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('10', '2022-09-09 19:50:00', '2');
  
   
            -- 지점 : 3
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('1', '2022-09-03 11:40:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('1', '2022-09-06 10:00:00', '3');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('1', '2022-09-08 09:30:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('1', '2022-09-09 19:20:00', '3');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('2', '2022-09-04 11:30:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('2', '2022-09-08 10:30:00', '3');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('2', '2022-09-09 09:30:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('2', '2022-09-09 19:50:00', '3');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('3', '2022-09-05 17:00:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('3', '2022-09-08 11:40:00', '3');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('3', '2022-09-08 14:30:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('3', '2022-09-09 19:20:00', '3');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('4', '2022-09-03 13:50:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('4', '2022-09-08 10:00:00', '3');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('4', '2022-09-09 09:30:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('4', '2022-09-09 19:50:00', '3');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('5', '2022-09-04 10:30:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('5', '2022-09-06 13:10:00', '3');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('5', '2022-09-08 13:10:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('5', '2022-09-09 19:20:00', '3');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('6', '2022-09-03 11:30:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('6', '2022-09-05 11:40:00', '3');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('6', '2022-09-06 09:30:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('6', '2022-09-08 19:50:00', '3');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('7', '2022-09-04 10:00:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('7', '2022-09-08 13:50:00', '3');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('7', '2022-09-08 14:30:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('7', '2022-09-09 19:20:00', '3');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('8', '2022-09-04 13:10:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('8', '2022-09-05 11:30:00', '3');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('8', '2022-09-06 09:30:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('8', '2022-09-08 19:50:00', '3');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('9', '2022-09-06 10:00:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('9', '2022-09-08 10:30:00', '3');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('9', '2022-09-08 09:30:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('9', '2022-09-09 19:20:00', '3');
   
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('10', '2022-09-04 11:40:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('10', '2022-09-05 10:00:00', '3');
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('10', '2022-09-06 09:30:00', '3'); 
   INSERT INTO MovieTicketTable (MCODE, MTIME, LCODE)
   VALUES ('10', '2022-09-08 19:20:00', '3');
   
   
   

  -- 보쌈족발 데이터  BCODE : 1
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '마왕족발', '1');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '고향보쌈왕족발', '2');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '장충왕족발', '3');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '원할머니보쌈족발', '4');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '가장맛있는족발', '5');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '궁전왕족발보쌈', '6');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '고려왕족발보쌈', '7');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '족발상회', '8');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '약선족발', '9');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '냠냠족발보쌈', '10');  
  
  
   -- 탕, 찌개 데이터  BCODE : 2
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '바우네나주곰탕', '11');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '닭치고닭요리', '12');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '찌개짜글', '13');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '만두빚는곰집', '14');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '용진이네 꽂도리탕', '15');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '명가 찌개랑', '16');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '부대찌개119', '17');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '땡글이감자탕', '18');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '열정닭볶음탕', '19');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '창영이 알탕', '20');  
   
   
   -- 일식 데이터  BCODE : 3
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '인정 수제 돈까스', '21');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '저온숙성카츠골든카츠', '22');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '배터지는생돈가스', '23');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '어복스시', '24');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '용카츠', '25');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '유미카츠', '26');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '보노참치', '27');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '베풀장', '28');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '초장집', '29');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '카츠백', '30');  
   
   
   -- 피자 데이터  BCODE : 4
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', '피자마루', '31');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', '빅스타피자', '32');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', '피자구뜨', '33');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', '오구쌀피자', '34');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', '탐나는피자', '35');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', '볼빨간피자', '36');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', '비스트로피자', '37');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', '킴브로스피자', '38');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', '유로코피자', '39');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', '피자알볼로', '40');  
   
   
   -- 고기 데이터  BCODE : 5
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', '김준호의 고기만 배달되지', '41');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', '석쇠로770', '42');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', '황제제육', '43');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', '주가네 닭갈비', '44');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', '조선육회', '45');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', '맵돈 매운갈비찜', '46');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', '따띠삼겹', '47');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', '오리도니', '48');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', '혼삼', '49');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', '배달삼겹직구삼', '50');  
   
   
   -- 치킨 데이터  BCODE : 6
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', '훌랄라바베큐', '51');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', '하나닭강정', '52');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', '후라이드참잘하는집', '53');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', '프랑킨숯불양념구이치킨', '54');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', '네네치킨', '55');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', '굽네치킨', '56');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', '지코바', '57');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', 'BHC', '58');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', '페리카나', '59');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', '자담치킨', '60');  
   
   
   -- 분식 데이터  BCODE : 7
  INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '불스떡볶이', '61');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '떡참', '62');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '신세계떡볶이', '63');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '돼지게티', '64');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '만나김밥', '65');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '은하수분식', '66');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '마피아떡볶이', '67');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '떡볶쓰', '68');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '떡의작품', '69');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '김밥나라', '70');  
   
   
   -- 패스트푸드 데이터  BCODE : 8
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', '버텍스', '71');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', '프랭크버거', '72');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', '롯데리아', '73');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', 'OG버거', '74');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', '노브랜드버거', '75');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', '버거킹', '76');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', '맘스터치', '77');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', '써브웨이', '78');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', '버거앤프라이즈', '79');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', '텐버거', '80');  
   
   
   -- 카페 데이터  BCODE : 9
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', '캔카페', '81');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', '메가커피', '82');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', '카페인중독', '83');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', '딜리바리1리터', '84');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', '카페보스', '85');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', '셀렉트커피', '86');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', '노스트', '87');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', '블랙커피', '88');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', '블랙콩', '89');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', '이디야커피', '90');  
   
   
   -- 디저트 데이터  BCODE : 10
  INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', '시월십오일', '91');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', '파리바게뜨', '92');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', '케리디저트랜드', '93');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', '타조디저트카페', '94');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', '홀리앤졸리', '95');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', '레벤스', '96');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', '푸룻라운지', '97');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', '샐러리아', '98');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', '디저트박스', '99');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', '빠띠프랑', '100');  
   
   
   --  한식 밀키트 테이블  BCODE : 11 
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '식사준비', '5001');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '이차돌', '5002');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '동대문엽기떡볶이', '5003');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '담꾹', '5004');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '두마리찜닭 두찜', '5005');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '집밥뚝딱', '5006');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '낙성낙곱새', '5007');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '두부품은 육개장', '5008');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '집어가', '5009');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '유가네닭갈비', '5010');  
   
   
   --  중식 밀키트 테이블  BCODE : 5002
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '락궁', '5011');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '행복짬뽕', '5012');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '보배반점', '5013');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '대한성', '5014');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '차즈융성', '5015');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '대가짬뽕', '5016');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '홍짜장', '5017');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '소백양', '5018');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '래격', '5019');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '태화루', '5020');  
   
   
   --  일식 밀키트 테이블  BCODE : 5003
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '도도야', '5021');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '정담', '5022');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '에바돈카츠', '5023');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '초미남', '5024');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '스시 오무무', '5025');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '사이쵸', '5026');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '참 진', '5027');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '유키', '5028');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '구천', '5029');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '지구당', '5030');  
   
   
   --  양식 밀키트 테이블  BCODE : 5004
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', '숩', '5031');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', '로사안젤라', '5032');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', '어썸레스토', '5033');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', '샤이바나', '5034');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', '잇츠', '5035');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', '포지타노', '5036');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', '챔프박스', '5037');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', '앤의식탁', '5038');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', '리틀 포레스트', '5039');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', '카페모리아', '5040');  
   
   

   
         -- 배민 메뉴 테이블 생성
      
      --마왕족발 메뉴
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('1', '천사세트', '42000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('1', '반반세트', '45000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('1', '마왕통구이', '30000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('1', '보쌈구이', '30000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('1', '족발볶음밥', '7000');  

  -- 고향보쌈왕족발
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('2', '한방왕족발', '38000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('2', '김치보쌈', '37000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('2', '배추보쌈', '37000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('2', '고향 쟁반국수', '12000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('2', '실속족발', '25000');  
  
  --장충왕족발
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('3', '족발(앞다리)', '31000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('3', '마늘족발', '34000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('3', '모듬세트', '50000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('3', '매운불족발', '31000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('3', '마늘보쌈', '34000');  
  
  --원할머니보쌈족발
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('4', '의성마늘떡맵쌈', '38000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('4', '솜씨맵쌈', '34000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('4', '모둠보쌈', '31000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('4', '실속원쌈', '29000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('4', '커플원쌈', '31000');  
  
  --가장맛있는족발
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5', '보쌈구이', '30000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5', '모둠보쌈', '35000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5', '매운불족발', '31000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5', '마늘보쌈', '29000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5', '실속족발', '26000');  
  
  --궁전왕족발보쌈
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('6', '보쌈구이', '34000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('6', '매운불족발', '31000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('6', '실속보쌈', '28000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('6', '실속족발', '28000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('6', '커플보쌈', '30000');  
  
  --고려왕족발보쌈
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('7', '족발세트', '34000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('7', '보쌈세트', '34000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('7', '족보세트', '35000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('7', '화덕족발', '35000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('7', '냉채족발', '34000');  
  
  --족발상회
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('8', '마늘보쌈', '31000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('8', '보쌈구이', '34000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('8', '실속족발', '28000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('8', '매운불족발', '34000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('8', '모듬세트', '37000');  
  
  --약선족발
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('9', '족발(앞다리)', '37000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('9', '보쌈', '35000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('9', '모듬세트(앞다리)', '37000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('9', '반반세트(앞다리)', '38000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('9', '마늘족발(앞다리)', '35000');  
  
  --냠냠족발보쌈
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('10', '족발세트(국내산 앞다리)', '37000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('10', '보쌈세트', '38000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('10', '불족발세트', '35000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('10', '불미니족세트', '31000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('10', '냉채족발', '30000');
  
  
   --탕 찌개 메뉴
   
   --바우네나주곰탕
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('11', '바우네곰탕', '9500');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('11', '맑은나주곰탕', '9500');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('11', '얼큰우거지곰탕', '10000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('11', '내장탕', '12000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('11', '소머리곰탕', '12000');   
   
   --닭치고닭요리
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('12', '닭볶음탕', '23000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('12', '찜닭', '25000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('12', '김치찜닭볶음탕', '23000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('12', '순살닭볶음', '20000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('12', '순살김치찜닭도리', '23000');  
   
   --찌개짜글
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('13', '돼지김치짜글이세트', '19000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('13', '차돌짜글이세트', '20000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('13', '햄짜글이세트', '18000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('13', '참치김치짜글이세트', '16000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('13', '석쇠불고기세트', '19000');  
   
   --만두빚는곰집
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('14', '도가니곰탕', '15000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('14', '소고기곰탕', '9000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('14', '고기왕만두', '7000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('14', '김치왕만두', '7000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('14', '한우사골왕만두국', '10000');  
   
   --용진이네 꽂도리탕
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('15', '꽃도리탕', '18000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('15', '새도리탕', '15000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('15', '정통닭도리탕', '18000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('15', '묵은지닭도리탕', '19000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('15', '황금로제닭도리탕', '21000');  
   
   --명가 찌개랑
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('16', '통돼지김치찌개', '18000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('16', '동태탕', '16000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('16', '알탕', '15000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('16', '닭볶음탕', '18000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('16', '골뱅이무침', '19000');  
   
   --부대찌개119
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('17', '119스페셜부대찌개', '18000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('17', '롱부대찌개', '18000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('17', '119부대찌개', '12000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('17', '킬바사 부대찌개', '16000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('17', '모듬부대찌개', '16000');   
   
   --땡글이감자탕
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('18', '1인 감자탕', '15000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('18', '묵은지 감자탕', '28000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('18', '감자탕', '26000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('18', '뼈해장국', '10000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('18', '수제비뼈해장국', '12000');  
   
   --열정닭볶음탕
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('19', '열정닭볶음탕', '18000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('19', '불닭볶음탕', '16000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('19', '열정찜닭', '19000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('19', '우삼겹닭볶음탕', '23000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('19', '묵은지닭볶음탕', '20000');  
   
   --창영이 알탕
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('20', '새우알탕', '19000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('20', '창영이알탕', '16000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('20', '낙지알탕', '20000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('20', '쭈꾸미알탕', '20000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('20', '꽃게알탕', '19000');  
  
  
  --일식 메뉴
  
     --인정 수제 돈까스
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('21', '등심커틀렛', '8000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('21', '치즈롤커틀렛', '8500');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('21', '커플세트 A', '15000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('21', '커플세트 B', '16000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('21', '커플세트 C', '18000');  
   
   --저온숙성카츠골든카츠
     INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('22', '카츠 마제세트', '16000');
     INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('22', '모리소바세트', '16000');  
     INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('22', '로스카츠', '9500');  
     INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('22', '히레카츠', '9500');  
     INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('22', '수제통모짜렐라카츠', '12000'); 
   
   --배터지는생돈가스
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('23', '배터지는 생돈가스', '9500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('23', '쫄면만난 생돈가스', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('23', '바다탈출 생선가스', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('23', '나이스짱 모듬정식', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('23', '돌아온 피자까스', '10000'); 
   
   --어복스시
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('24', '모듬초밥', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('24', '특선초밥', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('24', '스페셜초밥', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('24', '모듬사시미', '38000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('24', '어복2인세트조합', '34000'); 
   
   --용카츠
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('25', '로스카츠 정식', '10000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('25', '히레카츠 정식', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('25', '특로스카츠 정식', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('25', '상로스카츠 정식', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('25', '미니우동', '3000'); 
   
   --유미카츠
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('26', '유미카츠', '8500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('26', '토마호크카츠', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('26', '치즈카츠', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('26', '유미정식 가', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('26', '유미정식 나', '15000'); 
   
   --보노참치
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('27', '혼술기본 참치회', '19000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('27', '혼술특선 참치회', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('27', '혼술스페셜 참치회', '25000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('27', '보노기본', '28000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('27', '보노특선', '34000'); 
   
   --베풀장
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('28', '모듬 숙성회', '31000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('28', '특선 참치회', '37000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('28', '스페셜 참치회', '38000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('28', '모듬 초밥 A', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('28', '모듬 초밥 B', '23000'); 
   
   --초장집
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('29', '광어', '16000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('29', '우럭', '30000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('29', '광어+우럭', '31000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('29', '광어+우럭+연어', '34000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('29', '생연어', '28000'); 
   
   --카츠백
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('30', '통치즈까츠', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('30', '통등심까츠', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('30', '새우까츠', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('30', '로스까츠', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('30', '등심스틱카츠', '9500'); 
  
   
   --피자 메뉴
   
      --피자마루
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('31', '갓성비세트', '21000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('31', '마그마피자', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('31', '꿀고구마피자', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('31', '콤비네이션', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('31', '페퍼로니치즈폭탄피자', '20000');
   
   --빅스타피자
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('32', '라자냐 시카고', '21000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('32', '페퍼로니', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('32', '콰트로 디트로이트', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('32', '디트로이트 켄터키 치킨', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('32', '치폴레쉬림프', '25000');
   
   --피자구뜨
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('33', '스파게티 세트', '28000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('33', '윙봉 세트', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('33', '반반피자', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('33', '골드포테이토', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('33', '왕치킨피자', '21000');
   
   --오구쌀피자
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('34', '반반피자', '23000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('34', '반미터피자', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('34', '육해공골드', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('34', '불새피자', '25000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('34', '오굿박스', '31000');
   
   --탐나는피자
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('35', '소불고기 피자', '29000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('35', '로제 올 미트', '28000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('35', '치즈폭탄피자', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('35', '고르곤졸라', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('35', '알로하와이안', '20000');
   
   --볼빨간피자
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('36', '트리플 치즈', '25000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('36', '부대찌개 피자', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('36', '두부김치 피자', '20000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('36', '돼지불백 피자', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('36', '반반 피자', '23000');
   
   --비스트로피자
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('37', '4비트 피자', '25000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('37', '베이컨체다치즈피자', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('37', '페퍼로니피자', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('37', '비트박스', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('37', '훈제반마리', '10000');
   
   --킴브로스피자
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('38', '아메리칸핫페퍼로니', '23000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('38', '갈릭훈제치킨피자', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('38', '폴드포크쉬림프피자', '25000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('38', '피자+파스타', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('38', '반반피자', '23000');
   
   --유로코피자
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('39', '페퍼로니피자', '23000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('39', '불고기피자', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('39', '포테이토피자', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('39', '토마토 파스타', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('39', '크림 파스타', '12000'); 
   
   --피자알볼로
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('40', '쉬림프핫골드피자', '21000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('40', '대세피자', '20000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('40', '쉬반단반피자', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('40', '꿈을피자', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('40', '단호박피자', '23000');

   
   -- 고기 메뉴
   
    --김준호의 고기만 배달되지
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('41', '고기만 + 고기만 세트', '25000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('41', '돼지양념구이', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('41', '벌집목살구이', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('41', '제육볶음', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('41', '매운돼지양념구이', '15000');
   
   --석쇠로770
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('42', '석쇠직화불고기 간장 SET
', '18000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('42', '석쇠돼지불고기 고추장 SET
', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('42', '석쇠돼지불고기 가족 SET
', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('42', '연탄 간장불고기(中)
', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('42', '석쇠돼지불고기 반반 SET', '26000'); 
   
   --황제제육
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('43', '돼지짜글(짜글이)', '18000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('43', '동태탕', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('43', '매콤닭볶음탕', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('43', '간장마늘에빠진찜닭', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('43', '낙지볶음', '21000'); 
   
   --주가네
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('44', '닭갈비(중)', '26000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('44', '닭갈비(소)', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('44', '치즈 닭갈비', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('44', '제육볶음정식(1인분200g)', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('44', '치즈 닭갈비(소)', '23000'); 
   
   --조선육회
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('45', '마장동클라스 생육회', '21000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('45', '등심육사시미', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('45', '순창 고추장육회', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('45', '생육회 듬뿍 비빔밥', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('45', '얼큰소고기국밥', '21000'); 
   
   --맵돈
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('46', '돼지갈비찜', '21000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('46', '닭발', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('46', '닭갈비찜', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('46', '초계국수', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('46', '초계비빔국수', '18000'); 
   
   --따띠삼겹
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('47', '간단삼겹 고기만', '23000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('47', '양념삼겹 고기만', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('47', '간장삼겹 고기만', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('47', '수제 소세지 세트', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('47', '수제 저염 통 소세지', '18000'); 
   
   --오리도니
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('48', '오리 참나무장작 바베큐', '23000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('48', '통삼겹 참나무장작 바베큐', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('48', '모듬 참나무장작 바베큐', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('48', '매운숯불 바베큐', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('48', '꿀마늘 참나무장작 바베큐', '26000'); 
   
   --혼삼
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('49', '한우차돌구이정식', '26000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('49', '커플세트 2인', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('49', '고기만', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('49', '고기 + 비빔 막국수 세트', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('49', '혼삼 오리지널 + 막국수 세트', '21000'); 
   
   --배달삼겹직구삼
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('50', '직화 삼겹살 한상', '26000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('50', '레드삼겹게티', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('50', '직화 삼겹 고기만', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('50', '냉면 세트', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('50', '비냉 세트', '21000'); 
   
   --치킨 메뉴
   
   --훌랄라바베큐
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('51', '불갈비참숯바베큐', '16000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('51', '홍갈비참숯바베큐', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('51', '투블랙간장바베큐', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('51', '순살참숯핫바베큐', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('51', '참숯스위트바베큐', '19000'); 
   
   --하나닭강정
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('52', '순한 닭강정 반박스', '10000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('52', '매운 닭강정 반박스', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('52', '마늘간장 닭강정', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('52', '똥집튀김', '9500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('52', '데리야끼', '12000');  
   
   --후라이드참잘하는집
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('53', '후라이드 치킨', '15000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('53', '반반 치킨', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('53', '양념치킨', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('53', '눈꽃치즈치킨', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('53', '허니버터치킨', '18000');  
   
   --프랑킨숯불양념구이치킨
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('54', '숯불양념구이', '18000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('54', '치밥세트(순살)', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('54', '소맥세트', '25000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('54', '순살양념반순살소금반', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('54', '뼈양념반뼈소금반', '18000'); 
   
   --네네치킨
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('55', '청양마요치킨', '20000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('55', '오리엔탈파닭', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('55', '뼈 반반치킨', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('55', '닭다리', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('55', '스노윙치킨', '20000'); 
   
   --굽네치킨
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('56', '오븐바사삭', '19000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('56', '불금치킨', '20000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('56', '고추바사삭', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('56', '치즈바사삭', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('56', '오리지널', '16000'); 
   
   --지코바
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('57', '순살 소금구이', '20000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('57', '뼈 소금구이', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('57', '순살 양념구이', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('57', '뼈 양념구이', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('57', '순살양념반순살소금반', '21000');  
   
   --BHC
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('58', '치퐁당 후라이드', '20000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('58', '뿌링클 콤보', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('58', '골드킹 콤보', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('58', '맛초킹 콤보', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('58', '하바네로 포테킹 후라이드', '23000');  
   
   --페리카나
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('59', '순살 간장치킨', '20000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('59', '후라이드 치킨', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('59', '양념치킨', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('59', '양념반 + 후라이드반', '20000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('59', '순살 세트', '21000'); 
   
   --자담치킨
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('60', '후라이드치킨', '18000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('60', '불패치킨', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('60', '맵슐랭치킨', '20000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('60', '스리라차치킨', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('60', '생그라나치킨', '21000'); 
   
   --분식 메뉴
   
   --불스떡볶이
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('61', '커플떡볶이', '15000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('61', '불스 떡볶이', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('61', '로제떡볶이', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('61', '불치 세트', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('61', '치즈차돌떡볶이', '18000'); 
   
   --떡참
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('62', '떡순튀 세트', '18000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('62', '트러플 크림떡볶이', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('62', '멕시칸더블치즈떡볶이', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('62', '떡치치 세트', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('62', '맵달국물떡볶이', '16000');  
   
   --신세계떡볶이
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('63', '꾸덕로제떡볶이', '18000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('63', '신세계떡 2인 세트', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('63', '수제 오뎅 튀김', '3000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('63', '신세계 오돌밥', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('63', '꾸덕로제 맵닭발', '16000'); 
   
   --돼지게티
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('64', '막창토핑 + 스파게티 2인', '18000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('64', '페퍼크림 파스타', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('64', '로제 함박파스타', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('64', '어니언 하바네로 치킨', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('64', '갈릭 파마산 치킨', '18000'); 
   
   --만나김밥
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('65', '만나김밥', '3000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('65', '참치김밥', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('65', '떡볶이', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('65', '쫄면', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('65', '만나세트', '15000'); 
   
   --은하수분식
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('66', '매콤쫄면', '7500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('66', '만두세트', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('66', '떡볶이', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('66', '항정덮밥', '8500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('66', '직화연탄불고기덮밥', '8500'); 
   
   --마피아떡볶이
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('67', '마피아 허니버터 떡볶이', '15000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('67', '마피아 떡볶이', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('67', '마피아 로제 떡볶이', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('67', '마피아 세트 1', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('67', '마피아 세트 2', '21000'); 
   
   --떡볶쓰
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('68', '불맛가득 치즈불닭떡볶이', '15000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('68', '고기듬뿍 차돌박이 떡볶이', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('68', '크리미 로제 떡볶이', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('68', '진한국물 사골치즈떡볶이', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('68', '무뼈 직화닭발', '12000'); 
   
   --떡의작품
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('69', '해물짬뽕가래떡볶이', '9500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('69', '어니언 와르르 가래떡볶이', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('69', '나홀로 치킨 세트', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('69', '치킨 커플 세트', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('69', '순대 커플 세트', '12000'); 
   
   --김밥나라
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('70', '등심돈까스', '7500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('70', '순두부', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('70', '제육덮밥', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('70', '김치볶음밥', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('70', '쫄면', '7000'); 
   
   
   --패스트푸드 메뉴
   
       --버텍스
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('71', '미국식 닭고기 덮밥', '10000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('71', '미국식 새우 닭고기 덮밥', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('71', '버텍스 1인 메뉴', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('71', '미국식 닭고기 플레터', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('71', '라이너스 BBQ 풀드 포크 덮밥', '10000'); 
   
   --프랭크버거
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('72', '플랭크버거', '7500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('72', '쉬림프버거', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('72', '치즈버거세트', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('72', '베이컨치즈버거세트', '9500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('72', '머쉬룸버거세트', '9500'); 
   
   --롯데리아
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('73', '캡틴팩', '16000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('73', '더블캡틴팩', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('73', '더블 한우불고기 세트', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('73', '한우 트러플머쉬품세트', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('73', '모짜렐라 인 더 버거 세트', '9000'); 
   
   --OG버거
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('74', '통살버거', '9500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('74', '더블햄버거', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('74', '클래식비프버거', '9500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('74', '울트라버거', '9500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('74', '순살치킨', '15000'); 
   
   --노브랜드버거
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('75', '크레이지 레드해쉬 세트', '18000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('75', '더블치즈 베이컨 시그니처 세트', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('75', '시그니처 투게더팩', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('75', '시그니처 파티팩', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('75', '크런치 윙', '18000'); 
   
   --버거킹
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('76', '더블텍사스칠리와퍼', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('76', '콰트로치즈와퍼', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('76', '몬스터와퍼', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('76', '타바스코 더블비프 세트', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('76', '와퍼 세트', '10000'); 
   
   --맘스터치
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('77', '그릴드더블비프버거', '8000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('77', '불싸이버거', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('77', '딥치즈싸이버거', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('77', '싸이버거세트', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('77', '화이트갈릭버거', '2000'); 
   
   --써브웨이
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('78', '이탈리안 비엠티', '7000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('78', '에그마요', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('78', '햄', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('78', '참치', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('78', '베지', '7000'); 
   
   --버거앤프라이즈
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('79', '치즈버거', '7500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('79', '베이컨치즈버거', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('79', '리코타베이컨버거', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('79', '통새우칠리버거', '8500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('79', '화이트치즈감자튀김', '3000');  
   
   --텐버거
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('80', '불고기버거', '7000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('80', '오리지널치즈버거', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('80', '핫슈피뇨버거', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('80', '시그니쳐버거', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('80', '다이어트싱글버거', '7000'); 
   
   
   --카페 메뉴
   
    --캔카페
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('81', '바닐라라떼', '3500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('81', '아메리카노', '3000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('81', '카페라떼', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('81', '카페사이공(연유)', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('81', '헤이즐넛라떼', '3500');
   
   --메가커피
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('82', '플레인 퐁크러쉬', '4000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('82', '딸기 요거트 스무디', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('82', '쿠키 프라페', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('82', '딸기쿠키 프라페', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('82', '딸기주스', '3500');
   
   --카페인중독
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('83', '에스프레소', '3000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('83', '카페 라떼', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('83', '카페 모카', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('83', '바닐라 라떼', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('83', '헤이즐넛 라떼', '4000');
   
   --딜리바리1리터
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('84', '수제 딸기라떼', '5000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('84', '토피넛 라떼', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('84', '메로나 라떼', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('84', '그린티 라떼', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('84', '오곡라떼', '4000');
   
   --카페보스
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('85', '보스캔(아메리카노)', '3000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('85', '빅보틀(1리터 음료)', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('85', '딸기에이드', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('85', '체리에이드', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('85', '레몬에이드', '4000');
   
   --셀렉트커피
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('86', '흑당밀크 버블티', '4000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('86', '다방커피 버블티', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('86', '달고나 버블티', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('86', '타로 버블티', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('86', '초코 버블티', '5000');
   
   --노스트
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('87', '인절미빙수', '7500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('87', '팥빙수', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('87', '블루베리빙수', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('87', '복숭아빙수', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('87', '아메리카노', '2000');
   
   --블랙커피
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('88', '배꿀스무디', '4000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('88', '블랙초코', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('88', '돌체 콜드브루', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('88', '아이스티', '3000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('88', '녹차라떼', '3000');
   
   --블랙콩
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('89', '아메리카노', '2000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('89', '카페라떼', '3000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('89', '카푸치노', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('89', '바닐라 라떼', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('89', '카페모카', '3000');
   
   --이디야커피
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('90', '애플 루이보스티', '3500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('90', '살얼음 식혜', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('90', '달고나 믹스치노', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('90', '연유 밀크티', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('90', '제주 호지차라떼', '3000');
   
   
   -- 디저트 메뉴
   
       --시월십오일
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('91', '초코소라빵', '3500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('91', '조각치즈케이크', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('91', '바닐라마카롱', '8500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('91', '딸기마카롱', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('91', '초코마카롱', '18000');
   
   --파리바게뜨
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('92', '추억의 소세지빵', '3500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('92', '후레쉬크림샌드빵', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('92', '런치 샌드위치', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('92', '로스트치킨 샐러드', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('92', '화끈한 콘치즈불닭빵', '5000');
   
   --케리디저트랜드
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('93', '플레인 마카다미아 쿠키', '3000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('93', '말차화이트스모어 쿠키', '3000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('93', '순우유맛 마카롱', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('93', '버터바', '3000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('93', '쿠키스모어쿠키', '3500');
   
   --타조디저트카페
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('94', '생크림 쌀 와플', '3500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('94', '수제 옛날 바닐라 와플', '3000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('94', '수제 옛날 초코 와플', '3000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('94', '순수우유 케익', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('94', '악마의 초코케익', '4000');
   
   --홀리앤졸리
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('95', '마스카포네생크림케이크', '3500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('95', '수제 사블레쿠키', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('95', '수제 콘 쿠키', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('95', '바삭한 크로와상', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('95', '햄치즈에그샌드위치', '4000');
   
   --레벤스
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('96', '후랑크 소세지 샐러드', '7000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('96', '매콤 닭가슴살 샐러드', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('96', '건강 단호박 샐러드', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('96', '바삭치킨텐더 샐러드', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('96', '달콤한 떡갈비 샐러드', '7500');
   
   --푸룻라운지
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('97', '훈제 오리 샐러드', '8000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('97', '수비드 닭가슴살 샐러드', '8500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('97', '구운버섯 두부 샐러드', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('97', '아보카도 명란 포케', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('97', '수제 그래놀라 그릭 요거트', '6000');
   
   --샐러리아
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('98', '샐러리아 포케', '8000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('98', '생 연어 포케', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('98', '부채살스테이크 포케', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('98', '오리지널닭가슴살 포케', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('98', '오동통새우 포케', '9500');
   
   --디저트박스
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('99', '끼리치즈과일타르트', '5000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('99', '프리미엄쿠키', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('99', '망고퓨레 빙수', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('99', '스모어 쿠키', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('99', '우유인절미빙수', '6000');
   
   --빠띠프랑
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('100', '육쪽마늘빵', '5000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('100', '뉴욕소세지', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('100', '단호박쉬폰', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('100', '올리브치아버터', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('100', '깜장블루', '3000');
   
   --밀키트 
   
   -- 한식 밀키트 메뉴
      --식사준비
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5001', '제육덮밥', '9000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5001', '오돌뼈', '8500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5001', '부대찌개', '9500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5001', '김치볶음밥', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5001', '깍두기볶음밥', '8000');
   
   --이차돌
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5002', '차돌세트', '9000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5002', '차돌초밥', '9500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5002', '차돌된장찌개', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5002', '삼겹살덮밥', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5002', '차돌덮밥', '9000');
   
   --동대문엽기떡볶이
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5003', '엽기메뉴', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5003', '로제메뉴', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5003', '크림메뉴', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5003', '엽기닭볶음탕', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5003', '엽기닭발', '10000');
   
   --담꾹
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5004', '부대찌개', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5004', '춘천식닭갈비', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5004', '오징어볶음', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5004', '제육볶음', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5004', '코다리조림', '15000');
   
   --두마리찜닭
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5005', '간장찜닭', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5005', '매운찜닭', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5005', '로제찜닭', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5005', '매운닭갈비', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5005', '로제닭갈비', '12000');
   
   --집밥뚝딱
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5006', '정통소고기마라탕', '15000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5006', '레드와인 스테이크', '20000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5006', '통마늘 찹스테이크', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5006', '부대찌개', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5006', '함박스테이크', '9500');
   
   --낙성낙곱새
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5007', '낙곱새', '16000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5007', '나홀로 1인 세트', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5007', '꼬들대창', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5007', '낙삼새', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5007', '낙소', '15000');
   
   --두부품은
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5008', '얼큰육개장', '9000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5008', '얼큰순두부육개장', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5008', '맑은순두부육개장', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5008', '모두부', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5008', '사골떡만두국', '8000');
   
   --집어가
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5009', '감바스 알 아히요', '8500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5009', '깐새우장', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5009', '프리미엄 모듬 해물탕', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5009', '알찬 얼큰 알탕', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5009', '한우사골 부대전골', '16000'); 
   
   --유가네닭갈비
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5010', '유가네 닭갈비 세트', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5010', '매운 닭갈비 세트', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5010', '닭갈비 철판볶음밥', '9500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5010', '갈릭 철판볶음밥', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5010', '콘치즈닭갈비 세트', '15000'); 
   
   
   -- 중식 밀키트 메뉴
    --락궁
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5011', '짬뽕', '4000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5011', '짜장면', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5011', '불짜장면', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5011', '볶음밥', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5011', '잡채밥', '6000'); 
   
   --행복짬뽕
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5012', '불짬뽕', '7000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5012', '차돌짬뽕', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5012', '해물짬뽕', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5012', '짜장면', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5012', '삼선짜장면', '5000'); 
   
   --보배반점
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5013', '짜장면', '5000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5013', '삼선짜장면', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5013', '삼선짬뽕 ', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5013', '짬뽕밥', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5013', '잡채밥', '6000'); 
   
   --대한성
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5014', '짜장면', '4000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5014', '짬뽕', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5014', '볶음밥', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5014', '잡채밥', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5014', '특밥', '8500'); 
   
   --차즈융성
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5015', '짜장면', '5000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5015', '짬뽕', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5015', '불짜장면', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5015', '불짬뽕', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5015', '고추잡채', '8000'); 
   
   --대가짬뽕
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5016', '불짬뽕', '5000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5016', '불짜장면', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5016', '짬뽕밥', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5016', '잡채밥', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5016', '고추잡채', '8000'); 
   
   --홍짜장
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5017', '불짜장면', '7500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5017', '볶음밥', '8500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5017', '짜장면', '8500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5017', '삼선짜장면', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5017', '쟁반짜장', '9500'); 
   
   --소백양
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5018', '삼선짬뽕', '5000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5018', '삼선짜장면', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5018', '쟁반짜장', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5018', '볶음밥', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5018', '잡채밥', '8000');
   
   --래격
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5019', '특밥', '8500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5019', '고추잡채', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5019', '팔보채', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5019', '볶음밥', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5019', '꽃빵', '5000');
   
   --태화루
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5020', '짬뽕', '5000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5020', '짜장면', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5020', '불짜장면', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5020', '차돌짬뽕', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5020', '볶음밥', '5000');
   
   
   -- 일식 밀키트 메뉴
    --도도야
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5021', '스키야키', '16000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5021', '밀푀유나베', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5021', '나가사키짬뽕', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5021', '밀푀유나베4인분', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5021', '스키야키샤브샤브세트', '18000'); 
   
   --정담
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5022', '관동식 스키야키', '23000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5022', '밀푀유나베키트', '20000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5022', '나가사키짬뽕', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5022', '한우 모츠나베', '20000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5022', '관동식 샤브세트', '18000');
   
   --에바돈카츠
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5023', '등심돈까스', '9000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5023', '치즈돈까스', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5023', '통돈까스', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5023', '떡볶이 세트', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5023', '치킨까스', '7500'); 
   
   --초미남
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5024', '6다이닝 꽃갈비살', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5024', '차돌박이 고기초밥', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5024', '목살 고기초밥', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5024', '삼겹살 고기초밥', '9500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5024', '부채살 고기초밥', '15000');
   
   --스시 오무무
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5025', '한우유부초밥', '15000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5025', '간편한 유부초밥', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5025', '초쭈꾸미', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5025', '새우초밥', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5025', '알탕 밀키트 3인분', '18000');
   
   --사이쵸
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5026', '밀푀유나베', '19000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5026', '모츠나베', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5026', '나가사키짬뽕', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5026', '샤브샤브세트', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5026', '한우나베4인분', '20000 ');
   
   --참 진
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5027', '미소 모츠나베 3인분', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5027', '간사이풍 소고기 스키야키', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5027', '반조리 밀푀유 나베', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5027', '소고기 전골 밀키트 2인분', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5027', '광동풍 소고기 스키야키', '16000 '); 
   
   --유키
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5028', '스키야키 샤브샤브2인분', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5028', '담백육수 전골 밀푀유나베', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5028', '동래복국', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5028', '소고기밀푀유나베 3인분', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5028', '소불고기 곱창전골', '16000');
   
   --구천
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5029', '일품나가사끼짬뽕탕2인분', '10000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5029', '아지모토 나베 큐브 전골찌개', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5029', '밀푀유나베', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5029', '스키야키밀키트 2인분', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5029', '샤브샤브 밀키트 3인분', '10000');
   
   --지구당
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5030', '반조리 밀푀유나베', '18000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5030', '반조리 알탕', '15000 ');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5030', '반조리 대구탕', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5030', '우삼겹 소대창전골', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5030', '마라 밀푀유나베', '18000');
   
   
   -- 양식 밀키트 메뉴
     --숩
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5031', '찹스테이크', '23000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5031', '목살스테이크', '28000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5031', '채끝스테이크', '29000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5031', '함박스테이크', '29000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5031', '콘치즈바베큐치킨', '23000');
   
   --로사안젤라
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5032', '문어오븐구이뽈뽀', '30000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5032', '블랙페퍼스테이크', '34000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5032', '연어스테이크', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5032', '수비드토마호크', '37000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5032', '포터하우스스테이크', '35000');
   
   --어썸레스토
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5033', '레드와인스테이크', '31000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5033', '전복매쉬드포테이토', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5033', '삼겹살바베큐', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5033', '화이트라구소스파스타', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5033', '시스트로치킨스테이크', '15000');
   
   --샤이바나
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5034', '양갈비스테이크', '30000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5034', '스페인이베리코프리미엄', '34000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5034', '에그함박스테이크', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5034', '랍스타플래터', '38000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5034', '바베큐폭립', '37000');
   
   --잇츠
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5035', '마리네이드양갈비', '38000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5035', '캐나다자숙랍스터', '37000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5035', '웻에이징립아이', '35000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5035', '블랙타이거시푸드플래터', '30000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5035', '트리플머쉬룸스테이크', '31000');
   
   --포지타노
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5036', '멕시칸척아이롤', '29000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5036', '전복매쉬드포테이토', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5036', '블랙페퍼스테이크', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5036', '랍스타플래터', '30000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5036', '삼겹살바베큐', '19000');
   
   --챔프박스
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5037', '바베큐폭립', '28000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5037', '연어스테이크', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5037', '화이트라구소스파스타', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5037', '멕시칸척아이롤', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5037', '블랙타이거시푸드플래터', '19000');
   
   --앤의식탁
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5038', '목살스테이크', '20000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5038', '연어스테이크', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5038', '포터하우스스테이크', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5038', '레드와인스테이크', '29000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5038', '매쉬드포테이토', '8000');
   
   --리틀 포레스트
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5039', '라구소스파스타', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5039', '랍스타플래터', '20000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5039', '바베큐폭립', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5039', '리조또', '8500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5039', '시스트로치킨스테이크', '21000');
   
   --카페모리아
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5040', '치킨스테이크세트', '20000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5040', '이베리코', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5040', '양갈비', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5040', '폭립', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5040', '바베큐치킨', '16000');
   
   commit;