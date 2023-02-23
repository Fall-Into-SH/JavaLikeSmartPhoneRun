CREATE TABLE USERDATA(
	MID		NVARCHAR2(20) PRIMARY KEY,   --���� ���̵�
	MPW		NVARCHAR2(12),               --���� ��й�ȣ
	MNAME	NVARCHAR2(5),                --���� �̸�
	MBIRTH	NVARCHAR2(10),               --���� ����
	MPHONE	NVARCHAR2(20),               --���� ��ȣ
    MAGE NVARCHAR2(3),                      --���� ����
	CONSTRAINT MID_LENGTH CHECK(LENGTH (MID) >=5)      --�������� ���� ���̵� 5���� �̻�
) ;

CREATE TABLE PHONUM(
    PPHO NVARCHAR2(20) PRIMARY KEY,       --�� ����ȣ
    PNAME NVARCHAR2(10),                  --�� ���̸�
    MID NVARCHAR2(20),
    CONSTRAINT PHNUM_FK_MID FOREIGN KEY(MID) REFERENCES USERDATA(MID)
);

CREATE TABLE BANK(
    ACCOUNT NVARCHAR2(20) PRIMARY KEY,    --���¹�ȣ
    BALANCE NUMBER,                       --�����ܾ�
    MID NVARCHAR2(20),                    --���� ���̵�(USERDATA���� ������)
    CONSTRAINT BANK_FK_MID FOREIGN KEY(MID) REFERENCES USERDATA(MID)  --USERDATA���� MID�� �������� ��ɾ�
);


CREATE SEQUENCE B_SEQ
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;          --BANKDB ������ ����

CREATE TABLE BANKDT(
     B NUMBER PRIMARY KEY,   -- �ŷ�����(������ ������ �÷�)
     ACCOUNT NVARCHAR2(20),  --���¹�ȣ BANK���̺��� ������
     CATEGORY NVARCHAR2(3),  --�ŷ� ����
     COST NUMBER,            --�ݾ�
     BDATE NVARCHAR2(20),    --�ŷ���¥
    CONSTRAINT BANKDT_FK_ACCOUNT FOREIGN KEY(ACCOUNT) REFERENCES BANK(ACCOUNT)--BANK���� ACCOUNT�� �������� ��ɾ�
);          --����! BANKDT ���̺� INSERT���� 
--INSERT INTO BANKDT VALUES(B_SEQ.NEXTVAL, ?, ?, ? , ?);�� �Ǿտ� ������ ������ ���� B_SEQ.NEXTVAL ���

CREATE TABLE BaeminTable(  
   BCODE    NUMBER NOT NULL,
   SNAME    NVARCHAR2(20) NOT NULL,
   SCODE    NUMBER PRIMARY KEY
   );  -- ��� ���̺� ����
   
   
CREATE SEQUENCE SEQ_BOARD
 START WITH 1
 INCREMENT BY 1;

   
   CREATE TABLE BMENUTable( 
   SCODE    NUMBER,   --  �ܷ�Ű
   SMENU    NVARCHAR2(20) NOT NULL,
   PRICE    NUMBER,
   CONSTRAINT fk_b_m FOREIGN KEY (SCODE) 
   REFERENCES BaeminTable (SCODE)
   );  -- ��� �޴� ���̺� ����
   
   CREATE TABLE MovieTable(  
   MNAME    NVARCHAR2(20) NOT NULL, -- ��ȭ����
   MCODE    NUMBER PRIMARY KEY  -- ��ȭ �ڵ�
   );  -- ��ȭ ���̺� ����
   
   CREATE TABLE MovieTicketTable(  
   MCODE    NUMBER, -- ��ȭ�ڵ�
   MTIME    TIMESTAMP,  -- �󿵽ð� / ���� : YYYY-MM-DD hh:mm:ss / NOT NULL
   LCODE    NUMBER, -- �����ڵ�
   CONSTRAINT fk_m_c FOREIGN KEY (MCODE) 
   REFERENCES MovieTable (MCODE)
   );  -- ���� ���̺� ����
   
   
   CREATE TABLE BuyTicketTable(
    MID NVARCHAR2(20),
    MCODE    NUMBER,
    MTIME    TIMESTAMP,
    PEOPLE   NUMBER,
    LCODE    NUMBER
    );
   
   CREATE TABLE InstaTable(  
   Iid    NVARCHAR2(20) NOT NULL, -- �ν�Ÿ ���̵�
   Ititle NVARCHAR2(20) NOT NULL,  -- ����
   Ihits  NUMBER NOT NULL, -- ��ȸ��
   Ipost  NVARCHAR2(20)  -- �Խñ�
   );  -- �ν�Ÿ ���̺� ����
      
   
   CREATE TABLE RACEWINCOUNT(
   PLAYER NUMBER PRIMARY KEY,
   WIN NUMBER
   );
   INSERT INTO RACEWINCOUNT VALUES(1,0); 
   INSERT INTO RACEWINCOUNT VALUES(2,0); 
   INSERT INTO RACEWINCOUNT VALUES(3,0); 
   INSERT INTO RACEWINCOUNT VALUES(4,0); 
   
   
   --CH������
CREATE SEQUENCE CH_SEQ
  START WITH 1
  INCREMENT BY 1; 

--S������
CREATE SEQUENCE S_SEQ
  START WITH 1
  INCREMENT BY 1; 
--�ð�ǥ���̺�
CREATE TABLE SCHEDULE(
    S NUMBER PRIMARY KEY,
    MID NVARCHAR2(20),              --���̵�
    DOTW NVARCHAR2(6),              --���� �ڵ�
    PERIOD NVARCHAR2(6),            --���� �ڵ�
    SUBJECT NVARCHAR2(15),          --���� �̸�
    CONSTRAINT SCHEDULE_FK_MID FOREIGN KEY(MID) REFERENCES USERDATA(MID)
);
--�Խ������̺�
CREATE TABLE POST(
    CH NUMBER PRIMARY KEY,
    TITTLE NVARCHAR2(20),                --����
    WRITING NVARCHAR2(500),              --�Խñ�
    MID NVARCHAR2(20),                   --���̵�
    VIEWS NUMBER
    );
   --USERDATA�� �����Է�(MID�� ������� ����)
INSERT INTO USERDATA VALUES('abc123', '1234', 'ȫ�浿', '2000-01-01','01012341234','35');

INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '������', '1����', '����');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '������', '2����', '����');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '������', '3����', '����');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '������', '4����', '����');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '������', '5����', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '������', '6����', 'ü��');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '������', '7����', 'ü��');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '������', '8����', '�̼�');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '������', '9����', '�̼�');

INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', 'ȭ����', '1����', '����');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', 'ȭ����', '2����', 'C���');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', 'ȭ����', '3����', 'C���');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', 'ȭ����', '4����', '�ڹ�');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', 'ȭ����', '5����', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', 'ȭ����', '6����', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', 'ȭ����', '7����', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', 'ȭ����', '8����', '����');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', 'ȭ����', '9����', '����');

INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '������', '1����', 'C���');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '������', '2����', 'C���');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '������', '3����', 'C���');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '������', '4����', '����');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '������', '5����', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '������', '6����', '����');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '������', '7����', '����');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '������', '8����', '����');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '������', '9����', '����');

INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '�����', '1����', 'ü��');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '�����', '2����', 'ü��');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '�����', '3����', 'ü��');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '�����', '4����', 'ü��');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '�����', '5����', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '�����', '6����', 'C++');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '�����', '7����', 'C++');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '�����', '8����', 'C++');
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '�����', '9����', NULL);

INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '�ݿ���', '1����', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '�ݿ���', '2����', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '�ݿ���', '3����', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '�ݿ���', '4����', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '�ݿ���', '5����', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '�ݿ���', '6����', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '�ݿ���', '7����', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '�ݿ���', '8����', NULL);
INSERT INTO SCHEDULE VALUES( S_SEQ.NEXTVAL, 'abc123', '�ݿ���', '9����', NULL);

--�Խ��� ������
INSERT INTO POST VALUES(CH_SEQ.NEXTVAL,'������','�����ϴ�.','abcd',0);
INSERT INTO POST VALUES(CH_SEQ.NEXTVAL,'�ʹ� �������','�������.','cdef',0);
INSERT INTO POST VALUES(CH_SEQ.NEXTVAL,'������ ������','zzzzzzzzzzzzz','abcdef',20);
INSERT INTO POST VALUES(CH_SEQ.NEXTVAL,'������ ������','zzzzzzzzzzzzz...','abcd',0);
INSERT INTO POST VALUES(CH_SEQ.NEXTVAL,'������ �ʹ�','2�ð� ���Ҵ�....','ccccc',40);
INSERT INTO POST VALUES(CH_SEQ.NEXTVAL,'�ʵ�! !','����!!!!!!!!','admin',495);
INSERT INTO POST VALUES(CH_SEQ.NEXTVAL,'������ ������','zzzzzzzzzzzzz...','abcd',0);
INSERT INTO POST VALUES(CH_SEQ.NEXTVAL,'','zzzzzzzzzzzzz...','abcd',0);
   
   
    -- �ν�Ÿ ���̺� ������ ���� (���̵�, ����, ��ȸ��, �Խñ�)
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('BLACKPINK', '����������', '99999', 'Kick in the door');  
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('IVE', '����', '9996', '�� ���� �� ������');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('NewJeans', '�ʵ� �����ٷ�', '5456', 'You and me �� ���� ������');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('NewJeans', '���� ���� �����', '7878', 'NewJeans 1st EP');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('IVE', '��̾��� ��¼��', '4564', 'LOVE DIVE');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('GIRLS GENERATION', '�����ϴ� ��', '56178', 'FOREVER 1');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('WSG', '�׶� �� ���� �״��', '782657', 'WSG���ʺ� 1��');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('ITZY', 'SNEAKERS', '7116', 'CHECKMATE');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('WSG', '����;���', '617', 'WSG���ʺ� 1��');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('TEMPEST', 'Cant Stop Shining', '781678', 'SHINING UP');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('TEMPEST', 'START UP', '7816', 'SHINING UP');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('TEMPEST', '�Ϸ縸', '1876', 'SHINING UP');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Xydo', '�Ѱ��̳� ����', '7816', '�Ѱ��̳� ����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('KEY', '���ָ�', '5416', 'Gasoline - The 2nd Album');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('TWICE', 'BETWEEN', '7862', 'Talk that Talk');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('DINDIN', '�� ������ �׳�ó��', '17', 'Feat. ����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('J_Park', 'Bite', '8762', 'Bite');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('LUCY', '����', '7618', 'Childhood');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('IVE', 'My Satisfaction', '7816', 'After LIKE');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('abba45', '�ƹ�', '1586', '�� ����ó�� �ٲ���');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('ac/dc11', '��� ', '7861', '�� ������ �� �� �� ������');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('david bowie436', '�� ', '111', '�װ� ���� �߿��ϴ�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('eagles45', '10CM', '8768', '���� �װ� ������');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('earth38', '��ĭ���� ', '7777', 'ǫ ������ ��');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('eurythmics', '����̾� ', '868', '�߿��� ����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('fleetwood', '������ ', '786', '�Ƹ� �޸� ��������');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('hendrix', '��������', '786', '�и� ���� �ƴϾ�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('zepplind99', '�Ÿ�', '785367', '�޸� ������ �� ����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('marvin737', 'tummy ', '53', '�̰� ����� �ž�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('micheal', '�ҷ��� ', '453', '��� ���� ���� ����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('jackson', 'Follow ', '37', '���� �ǽ����� ��');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('floyd', 'Growing ', '8', '�׳� ���ٴ� �� �Ƴ�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('beatles', '������', '4534', 'You and I');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Bab', '�����ο� ���', '78', '���� �ٽ� ���');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('razy', '���', '787385', '�������');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('cars ', '���Ȱ� ����', '374734', '���� ���� �ʷ� �� �� ��� ��');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('sharona', '���� ��', '853', '�۷� ����� ����� �� �����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('underground ', '����', '7853', '�ʵ� �������� ���ڴµ�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('sharona', 'not ', '77', '�ʴ� �ƹ� ���� ���� �� ��');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('arctic ', '�� �ڴ��', '35838', '���� �������� ���� �Ŷ�����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('coldplay ', '�� �ž�', '73', '���� �Ͼ� �ʿ� ���� ��ũ�� ����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('killers', '�ʿ� ����', '72', '�۾Ƴ� �� ���� ��ŭ ������');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('stevens ', '�� ������', '38', '������ ������ ����� ���ݾ�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('radiohead ', '���� �η��� ��', '435', '������ ������ �� �˾ƺ� ���� ����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('onerepublic ', '���� ��', '728', '���� �� ������');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('verve ', '�������', '768', '������ ���� ������ �־�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('weezer ', 'call ', '245', '������ ���� �ɾ������');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('2pac ', '���� ��� �;�', '475', '���� �뷣 ���� ���� �� ���');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('50cent ', '�� ���� ġ�ѿø� ä��', '78', '�װ� �ҷ� �ֱ⿣ �� �������');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('wayne ', '�ϳ� ', '4', '���� ��ĥ ���� ���� ����������');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('roots ', '�ָ� �����ڰ�', '45', '�װ� ����ֱ⿣ ������ �� ����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('aphex ', '��ٸ��� ����', '76', '�ʴ� �������� ������ ����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('punk ', '����', '34', '���� ���� �� �� ��� �ܷ�����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('daft ', '����', '768', '�Ϸ����� �������� ���� ����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('clan ', '���¿�', '5', '���� ���� ä�� ����������');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('prodigy ', '���� ', '786', '������ ������ ����� ���ݾ�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('zedd ', '����', '7', '������ ������ �� �˾ƺ�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Symphony', '�� �߾�', '453', 'Wake up in the morning');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Closer', '����', '73', '���� �;� �� ���ڰ� �� ���');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Youth', '�ϳ� ����', '13', '�ٸ� ���� ���� �� �� �ָ�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Sivan', '�������', '13', '�� ã�� ���̾� �� ����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Grande', 'call me trouble', '2', '�� �����̰� �� ����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Lauv', '���� ��� �;�', '783', '�߰����� ������ ��Ÿ�');
   
   -- INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   -- VALUES ('����', '����', '����', '����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Bandit', '�ʿ��Դ�', '28', '���� �˾� ���� ������');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Clean ', '����', '7786', '�� ������ �� ���� ����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Chainsmokers', '����', '7853', '�� �ְ� �����Ѵٴ� ��');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('this', '�ָ�', '54', '�������� ���� �����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Anne ', '����� ', '453', '������ ������ �� �Ͽ�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Marie', '���', '73', '������ �ִ� �Ŷ��');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Gomez', '�;� ', '53', '������ �� ������ ��');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Selena ', '�ϵ�', '123', '�� �Ȱ� �� �����̴ϱ�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Charlie ', ' ������� 1', '3453', '���� �̷��� �µ�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Puth', '���ؿ��� ', '453', '���� �ƹ��͵� �� ��');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Rae ', '�Ȼ� ', '78', '���� �׷��� �����ұ�� ���� ');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Owl ', '�������� ', '453', '�Ƹ��� ���ϵ� �� �ִ� ');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Avicii', '������ ', '453', '���� �˾� ���� �� ');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('MAroon5', '������ ', '783', '�� �����ϰ� ���ƾ� ����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Passenger', '����', '453', '�� �߳����� ����');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('direction', '���� ', '453', '�ǰ� ������ �Ұ�������');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Maps', '�˾� ', '783', '������ ������ �����ϴ� �Ͽ�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('do', '��������', '4', '������ �ִ� �Ŷ��');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Perfect', '���� ', '453', '������ �� ������');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Sheeran', '�Ѵٴ� ', '12', '�� �Ȱ� �� �����̴ϱ�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Ed ', '�����', '4', '���� �̷��� ����ϴµ�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Passenger', '������ ', '873', '�Ƹ��� ���ϵ� �� �ִ�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Goulding', '������ ', '58', '�Ƹ��� ���ϵ� �� �ִ�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Ellie ', '�����ϴ� ', '53', '�̵��� �� �� �� �Ǵ� �� ');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('direction', '�Ͽ�', '8', '�ѿ��� ���� ��');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('What ', '�ִ� ', '853', '���� Ÿ �ܿ� ���� ��');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Queen', '�Ŷ��', '3', '1�� �� �� �Ǵٽ� ��');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('kill ', '������ ', '8', '������� �� ���� ��');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Rock ', '������ ', '78', '������ �ȳ�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Now', '�����̴ϱ�', '53', '�Ƹ���� �츮��');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Life', '�̷��� ', '523', '�� ���� ���� �ܿ�');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('chyna ', '����ϴµ� ', '1', 'Four seasons');
   
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Upside ', '���ϴµ�', '83', '�� �� �ڿ� ���');
   
   -- ���⼭ ���� ���� 0901
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�� ', '�ȿ��� ', '234234', '�����ϴ� ');     
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('������  ', '��  ', '12343', 'UGRS  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('ī�޶��  ', '��ƴ���  ', '213', '�Ÿ��� ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����  ', '����ġ��  ', '7575', 'party  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('��  ', '����  ', '531', '����ġ��  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('party  ', '�ҳ���  ', '3434', '���϶�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('make  ', 'call  ', '3243', '��  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ݴ�� ', '�ҳ���  ', '43', '������  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Now  ', 'got  ', '43341', '����ǥ  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('������ ', '���η�  ', '43543', 'How  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('1llibition  ', '�̻�  ', '4356', '�̻�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Yah  ', 'countin ', '5262', 'paper  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�̷�  ', '����  ', '2346', '������  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('������  ', '����  ', '124', '�ʿ��ϴٰ�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Um ', 'yah bition ', '32543', '�ݷ�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ݷ�  ', '��ȭ�� ', '34324', 'ã�Ƴ�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ҳ���  ', '�����δ�  ', '43132', '��õ  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('���̾�  ', '�ҹ�����  ', '14343', '�ҳ���  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ƺ��ī�ٺ��  ', '�������  ', '46354', 'bring  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('the  ', 'fire  ', '46324', 'Call  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('my  ', '����ٸ�  ', '513543', '�׳�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�Ŀ�  ', 'fan  ', '326345', '������  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('���  ', '�ȳ�  ', '143', '�׿�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����  ', '����  ', '1435', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�Ծ�  ', '��� ', '53776', '�³׵�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�����  ', '���� ', '53757', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('������  ', '�ν���Ʈ  ', '657457', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ֵ�  ', '������  ', '34525', '��ġ����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�׳�  ', '�ȿ��� ', '76576', '�����ϴ� ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('��  ', '����  ', '6875', '������  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('like  ', '�ȿ��� ', '5437', '������  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����  ', '������  ', '7687', 'sofa  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ϴ���  ', '�������   ', '34567', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����  ', '�޳�  ', '76857', '�ο��  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('���  ', 'Ÿ��  ', '789778', '�����ϰ�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����  ', '����  ', '625456', '�Ӹ�ó��  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES (' ������  ', '����  ', '567546', '�ҷ�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����  ', '�ȿ��� ', '63456', 'like  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ű⼭  ', '�ű��ݾ�  ', '3452', '��ǳ�� ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�Ը�  ', '������  ', '5674', '������ ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�߻�  ', '�ʿ���  ', '785685', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ü�  ', '�ʿ���  ', '345634', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����  ', '���ĸ�  ', '6785678', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����  ', '����  ', '7896978', 'Ĩ�Ÿ�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�Ű���  ', '�Ű���  ', '345', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����  ', '��  ', '758', '�ۼ� ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����  ', '���� ', '5768', 'bring  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('���簡��  ', '�  ', '789', 'Ÿ��  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('���簡  ', 'customize  ', '4536', '��������  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�µ�  ', '��  ', '567', '��  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����  ', '��Ʃ���  ', '4563', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('remix ', '������  ', '4356', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('���׵� ', '��  ', '6543', 'American ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('woo  ', '�̷��� ', '757', '�ϴ�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�³�  ', '������   ', '578', '�ǳ� ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('YouTube  ', '����  ', '6585', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('���  ', '��׵�  ', '3456', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('������  ', '�޷��� ', '6578', 'ambulance  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('������  ', '����  ', '78365', 'Severance  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('��ġ�Ǵ�  ', 'beats  ', '74386', 'Dr ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('GRAY ', '�ٽ�  ', '852', '������  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�Ҳ�  ', '���ϰ�ó�� ', '2678', '�ҹ�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('������ ', '������ ', '6989', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�׳��  ', '����  ', '68769', 'Ÿ�� ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�־�  ', 'suck  ', '7986', 'my  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('���  ', '���  ', '2786', '�θ���  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����  ', '���־� ', '527', '�����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('��� ', '���θ�  ', '3786', '�����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('���۵�  ', '���Ϻ���  ', '6573', '�Ŀ�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�۾�  ', 'dm  ', '78389', '��ī�ο�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('bitch  ', '���δ�  ', '387', '�ε巴�� ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����  ', 'ô��  ', '7839', '�ٸ��� ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('������ ', '�Ǵ�  ', '6368', '������  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('������  ', '�Ű�  ', '7863', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�Կ�  ', '�帲  ', '8763', '����  ');  
    INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ϴ� ', '������  ', '782', '������ ');     
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�۴�   ', 'Hustlin  ', '7862', '������  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('������   ', '�׳�   ', '87629', '�ൿ�� ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�����̶��   ', '����  ', '8729', 'got  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('own   ', 'shit  ', '782', '������   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ĵ�   ', '�    ', '7829', 'city   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ٴ���   ', '�ް�   ', '852 ', 'but  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('fuck  ', 'you   ', '82', 'ride    ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('wit   ', 'Easy   ', '2052', 'money   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('��ġ��  ', 'Heavy   ', '852', 'weight   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ܹ���   ', 'Beef   ', '4524', '���ϸ�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('������   ', 'Hater  ', '782', 'ȭ����   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Check   ', 'your   ', '636', 'flex   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Nike   ', 'Take   ', '36873', 'your   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('bitch  ', 'yah like  ', '2772', '���̽�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����  ', '�ʹ�  ', '738', 'thug  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('life   ', '����   ', '639', 'verse  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ϱ�   ', '��������   ', '27', 'one  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('nine   ', '��¥��   ', '2345', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ز���   ', 'ũ��  ', '662872', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('��  ', '������   ', '1872', '������   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('������  ', '����   ', '57427', 'splash  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('these   ', 'face   ', '2654', '�뻧��   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('ȣ����   ', '����  ', '84467', '������   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('ī��   ', '�ܾ�  ', '7487', '����   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('���   ', '�غ���  ', '3463', 'ö����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('���  ', 'songs  ', '252', 'drop   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('labels   ', 'Real   ', '7547', 'boss   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('they   ', 'speak ', '2364', 'fabels  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('���ִ���   ', '�����Ϸ���   ', '743', '����   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('���   ', '����  ', '8467', '�δ�   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�޾Ƴ�', '�Ұ���   ', '657', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�Ұ���   ', 'Bull    ', '373', '�Ұ���   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ݽ�  ', '���̾�Ʈ   ', '56436', '�ҳ���   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('���̸�  ', '��Ż��   ', '324523', 'HypeBeast   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����   ', '��¦�̴�   ', '75637', '������  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES (' �����  ', '�ʿ��ϸ�   ', '878', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�⸮����   ', '�ȶ���  ', '74745', '��ũ�δ�   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ȶ�����   ', 'Ooh  ', '2356', 'Make  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('������   ', '���ش�  ', '2828', '�ݹںҰ� ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�̸���   ', '�ʿ���  ', '4848', '������   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('���ȱ��̾�   ', '���ε���   ', '2373', '�̻�   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('TMI   ', '�ϳ�  ', '84856', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����   ', '��ϵ���  ', '6784', '���̾�   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('���⵵ ', '�츮��  ', '2745', '�ո�   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('������  ', '����  ', '7245', '�ƴ�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����   ', '���밥  ', '7456', '������   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ֿ�����  ', '����   ', '86786', 'much  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('information  ', 'Ooh  ', '96578', '����   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����   ', '����   ', '5435', 'metaphor ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ÿ�  ', '������   ', '7376', '����   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����  ', '�̷�   ', '256542', 'ó���̷�   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Ÿ�� ', '�ߵ���   ', '423534', '������ġ ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ٴڿ�   ', '����� ', '765', '����   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ǹ̷�   ', 'ocean   ', '8568', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('plata   ', '��̫  ', '3253', '���   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('that   ', 'worldwide   ', '7567', '����   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Ÿ��   ', 'Ƽ��  ', '32456', '����   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�繰   ', '����ó��   ', '74574', '���ƾ�   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('���ƾ�   ', '����   ', '76856', '����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�ӿ��� ', '��  ', '45634', '���   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�����   ', '�Ҿ��� ', '7457547', 'Ȯ����   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����  ', '�Ƿ�  ', '15354', '�ٵ�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����   ', '����  ', '�Ƿ����� ', '�Ű�  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('������   ', '����   ', '4536', '¯����   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Double   ', 'higher   ', '5673', '�ٽ�   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����   ', '�̷¼�  ', '27457', 'gone  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('��Ÿ��  ', '�ڶ���  ', '647834', '��ǰ   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�����  ', '������   ', '5685', '������   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('Hiphop   ', 'ĭ����   ', '32452', 'ĭ����   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����   ', '����   ', '345325', '�����  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('���Ϲ���  ', '���Ⱦ�   ', '7346', '�ʳ׵�� �ٸ��� ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�㸶��  ', '�ҷ�   ', '58465', '��ٴ�   ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('�츮   ', 'different   ', '7808', 'countin  ');  
   INSERT INTO InstaTable (Iid, Ititle, Ihits, Ipost)
   VALUES ('����   ', '����   ', '94457', '��θ�   ');  
   
    -- ��ȭ ���̺� ������ ���� (��ȭ����, ��ȭ�ڵ�)
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('ž��: �Ź���', '1');  
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('�Ƿη� ������ �巡��ĳ�� �����', '2');
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('����� ���', '3');
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('�ѻ�: ���� ����', '4');
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('��Ʈ', '5');
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('�̴Ͼ���2', '6');
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('��', '7');
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('��������', '8');
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('�Ű��Բ�_�˿� ��', '9');
   INSERT INTO MovieTable (MNAME, MCODE)
   VALUES ('���׶�', '10');
   
    -- ���� ���̺� ������ ���� (��ȭ�ڵ�, �����ڵ�)
      -- ���� : 1
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
   
   
         -- ���� : 2
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
  
   
            -- ���� : 3
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
   
   
   

  -- �������� ������  BCODE : 1
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '��������', '1');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '���⺸�ӿ�����', '2');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '���������', '3');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '���ҸӴϺ�������', '4');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '������ִ�����', '5');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '���������ߺ���', '6');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '��������ߺ���', '7');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '���߻�ȸ', '8');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '�༱����', '9');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('1', '�ȳ����ߺ���', '10');  
  
  
   -- ��, � ������  BCODE : 2
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '�ٿ�׳��ְ���', '11');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '��ġ��߿丮', '12');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '�¥��', '13');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '���κ��°���', '14');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '�����̳� �ȵ�����', '15');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '�� ���', '16');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '�δ��119', '17');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '�����̰�����', '18');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', '�����ߺ�����', '19');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('2', 'â���� ����', '20');  
   
   
   -- �Ͻ� ������  BCODE : 3
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '���� ���� ���', '21');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '���¼���ī�����ī��', '22');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '�������»�������', '23');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '�����', '24');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '��ī��', '25');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '����ī��', '26');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '������ġ', '27');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '��Ǯ��', '28');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', '������', '29');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('3', 'ī����', '30');  
   
   
   -- ���� ������  BCODE : 4
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', '���ڸ���', '31');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', '��Ÿ����', '32');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', '���ڱ���', '33');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', '����������', '34');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', 'Ž��������', '35');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', '����������', '36');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', '��Ʈ������', '37');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', 'Ŵ��ν�����', '38');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', '����������', '39');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('4', '���ھ˺���', '40');  
   
   
   -- ��� ������  BCODE : 5
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', '����ȣ�� ��⸸ ��޵���', '41');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', '�����770', '42');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', 'Ȳ������', '43');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', '�ְ��� �߰���', '44');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', '������ȸ', '45');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', '�ʵ� �ſ����', '46');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', '������', '47');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', '��������', '48');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', 'ȥ��', '49');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('5', '��޻��������', '50');  
   
   
   -- ġŲ ������  BCODE : 6
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', '�Ƕ���ٺ�ť', '51');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', '�ϳ��߰���', '52');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', '�Ķ��̵������ϴ���', '53');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', '����Ų���Ҿ�䱸��ġŲ', '54');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', '�׳�ġŲ', '55');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', '����ġŲ', '56');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', '���ڹ�', '57');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', 'BHC', '58');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', '�丮ī��', '59');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('6', '�ڴ�ġŲ', '60');  
   
   
   -- �н� ������  BCODE : 7
  INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '�ҽ�������', '61');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '����', '62');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '�ż��趱����', '63');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '������Ƽ', '64');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '�������', '65');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '���ϼ��н�', '66');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '���Ǿƶ�����', '67');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '������', '68');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '������ǰ', '69');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('7', '��䳪��', '70');  
   
   
   -- �н�ƮǪ�� ������  BCODE : 8
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', '���ؽ�', '71');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', '����ũ����', '72');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', '�Ե�����', '73');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', 'OG����', '74');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', '��귣�����', '75');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', '����ŷ', '76');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', '������ġ', '77');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', '������', '78');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', '���ž���������', '79');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('8', '�ٹ���', '80');  
   
   
   -- ī�� ������  BCODE : 9
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', 'ĵī��', '81');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', '�ް�Ŀ��', '82');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', 'ī�����ߵ�', '83');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', '�����ٸ�1����', '84');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', 'ī�亸��', '85');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', '����ƮĿ��', '86');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', '�뽺Ʈ', '87');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', '��Ŀ��', '88');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', '����', '89');  
    INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('9', '�̵��Ŀ��', '90');  
   
   
   -- ����Ʈ ������  BCODE : 10
  INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', '�ÿ��ʿ���', '91');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', '�ĸ��ٰԶ�', '92');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', '�ɸ�����Ʈ����', '93');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', 'Ÿ������Ʈī��', '94');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', 'Ȧ��������', '95');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', '������', '96');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', 'Ǫ������', '97');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', '��������', '98');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', '����Ʈ�ڽ�', '99');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('10', '��������', '100');  
   
   
   --  �ѽ� ��ŰƮ ���̺�  BCODE : 11 
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '�Ļ��غ�', '5001');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '������', '5002');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '���빮���ⶱ����', '5003');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '���', '5004');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '�θ������ ����', '5005');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '����ҵ�', '5006');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '����������', '5007');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '�κ�ǰ�� ������', '5008');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '���', '5009');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('11', '�����״߰���', '5010');  
   
   
   --  �߽� ��ŰƮ ���̺�  BCODE : 5002
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '����', '5011');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '�ູ«��', '5012');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '�������', '5013');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '���Ѽ�', '5014');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '��������', '5015');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '�밡«��', '5016');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', 'ȫ¥��', '5017');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '�ҹ��', '5018');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '����', '5019');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('12', '��ȭ��', '5020');  
   
   
   --  �Ͻ� ��ŰƮ ���̺�  BCODE : 5003
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '������', '5021');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '����', '5022');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '���ٵ�ī��', '5023');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '�ʹ̳�', '5024');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '���� ������', '5025');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '������', '5026');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '�� ��', '5027');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '��Ű', '5028');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '��õ', '5029');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('13', '������', '5030');  
   
   
   --  ��� ��ŰƮ ���̺�  BCODE : 5004
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', '��', '5031');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', '�λ������', '5032');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', '��淹����', '5033');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', '���̹ٳ�', '5034');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', '����', '5035');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', '����Ÿ��', '5036');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', 'è���ڽ�', '5037');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', '���ǽ�Ź', '5038');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', '��Ʋ ������Ʈ', '5039');  
   INSERT INTO BaeminTable (BCODE, SNAME, SCODE)
   VALUES ('14', 'ī��𸮾�', '5040');  
   
   

   
         -- ��� �޴� ���̺� ����
      
      --�������� �޴�
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('1', 'õ�缼Ʈ', '42000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('1', '�ݹݼ�Ʈ', '45000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('1', '�����뱸��', '30000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('1', '���ӱ���', '30000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('1', '���ߺ�����', '7000');  

  -- ���⺸�ӿ�����
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('2', '�ѹ������', '38000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('2', '��ġ����', '37000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('2', '���ߺ���', '37000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('2', '���� ��ݱ���', '12000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('2', '�Ǽ�����', '25000');  
  
  --���������
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('3', '����(�մٸ�)', '31000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('3', '��������', '34000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('3', '��뼼Ʈ', '50000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('3', '�ſ������', '31000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('3', '���ú���', '34000');  
  
  --���ҸӴϺ�������
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('4', '�Ǽ����ö��ʽ�', '38000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('4', '�ؾ��ʽ�', '34000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('4', '��Һ���', '31000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('4', '�Ǽӿ���', '29000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('4', 'Ŀ�ÿ���', '31000');  
  
  --������ִ�����
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5', '���ӱ���', '30000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5', '��Һ���', '35000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5', '�ſ������', '31000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5', '���ú���', '29000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5', '�Ǽ�����', '26000');  
  
  --���������ߺ���
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('6', '���ӱ���', '34000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('6', '�ſ������', '31000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('6', '�ǼӺ���', '28000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('6', '�Ǽ�����', '28000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('6', 'Ŀ�ú���', '30000');  
  
  --��������ߺ���
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('7', '���߼�Ʈ', '34000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('7', '���Ӽ�Ʈ', '34000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('7', '������Ʈ', '35000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('7', 'ȭ������', '35000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('7', '��ä����', '34000');  
  
  --���߻�ȸ
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('8', '���ú���', '31000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('8', '���ӱ���', '34000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('8', '�Ǽ�����', '28000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('8', '�ſ������', '34000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('8', '��뼼Ʈ', '37000');  
  
  --�༱����
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('9', '����(�մٸ�)', '37000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('9', '����', '35000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('9', '��뼼Ʈ(�մٸ�)', '37000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('9', '�ݹݼ�Ʈ(�մٸ�)', '38000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('9', '��������(�մٸ�)', '35000');  
  
  --�ȳ����ߺ���
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('10', '���߼�Ʈ(������ �մٸ�)', '37000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('10', '���Ӽ�Ʈ', '38000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('10', '�����߼�Ʈ', '35000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('10', '�ҹ̴�����Ʈ', '31000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('10', '��ä����', '30000');
  
  
   --�� � �޴�
   
   --�ٿ�׳��ְ���
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('11', '�ٿ�װ���', '9500');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('11', '�������ְ���', '9500');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('11', '��ū���������', '10000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('11', '������', '12000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('11', '�ҸӸ�����', '12000');   
   
   --��ġ��߿丮
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('12', '�ߺ�����', '23000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('12', '���', '25000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('12', '��ġ��ߺ�����', '23000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('12', '����ߺ���', '20000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('12', '�����ġ��ߵ���', '23000');  
   
   --�¥��
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('13', '������ġ¥���̼�Ʈ', '19000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('13', '����¥���̼�Ʈ', '20000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('13', '��¥���̼�Ʈ', '18000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('13', '��ġ��ġ¥���̼�Ʈ', '16000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('13', '����Ұ�⼼Ʈ', '19000');  
   
   --���κ��°���
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('14', '�����ϰ���', '15000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('14', '�Ұ�����', '9000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('14', '���ո���', '7000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('14', '��ġ�ո���', '7000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('14', '�ѿ���ո��α�', '10000');  
   
   --�����̳� �ȵ�����
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('15', '�ɵ�����', '18000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('15', '��������', '15000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('15', '����ߵ�����', '18000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('15', '�������ߵ�����', '19000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('15', 'Ȳ�ݷ����ߵ�����', '21000');  
   
   --�� ���
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('16', '�������ġ�', '18000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('16', '������', '16000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('16', '����', '15000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('16', '�ߺ�����', '18000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('16', '����̹�ħ', '19000');  
   
   --�δ��119
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('17', '119����Ⱥδ��', '18000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('17', '�պδ��', '18000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('17', '119�δ��', '12000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('17', 'ų�ٻ� �δ��', '16000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('17', '���δ��', '16000');   
   
   --�����̰�����
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('18', '1�� ������', '15000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('18', '������ ������', '28000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('18', '������', '26000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('18', '�����屹', '10000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('18', '����������屹', '12000');  
   
   --�����ߺ�����
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('19', '�����ߺ�����', '18000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('19', '�Ҵߺ�����', '16000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('19', '�������', '19000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('19', '����ߺ�����', '23000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('19', '�������ߺ�����', '20000');  
   
   --â���� ����
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('20', '�������', '19000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('20', 'â���̾���', '16000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('20', '��������', '20000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('20', '�޲ٹ̾���', '20000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('20', '�ɰԾ���', '19000');  
  
  
  --�Ͻ� �޴�
  
     --���� ���� ���
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('21', '���ĿƲ��', '8000');
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('21', 'ġ���ĿƲ��', '8500');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('21', 'Ŀ�ü�Ʈ A', '15000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('21', 'Ŀ�ü�Ʈ B', '16000');  
  INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('21', 'Ŀ�ü�Ʈ C', '18000');  
   
   --���¼���ī�����ī��
     INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('22', 'ī�� ������Ʈ', '16000');
     INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('22', '�𸮼ҹټ�Ʈ', '16000');  
     INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('22', '�ν�ī��', '9500');  
     INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('22', '����ī��', '9500');  
     INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('22', '�������¥����ī��', '12000'); 
   
   --�������»�������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('23', '�������� ��������', '9500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('23', '�̸鸸�� ��������', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('23', '�ٴ�Ż�� ��������', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('23', '���̽�¯ �������', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('23', '���ƿ� ���ڱ', '10000'); 
   
   --�����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('24', '����ʹ�', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('24', 'Ư���ʹ�', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('24', '������ʹ�', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('24', '����ù�', '38000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('24', '�2�μ�Ʈ����', '34000'); 
   
   --��ī��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('25', '�ν�ī�� ����', '10000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('25', '����ī�� ����', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('25', 'Ư�ν�ī�� ����', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('25', '��ν�ī�� ����', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('25', '�̴Ͽ쵿', '3000'); 
   
   --����ī��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('26', '����ī��', '8500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('26', '�丶ȣũī��', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('26', 'ġ��ī��', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('26', '�������� ��', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('26', '�������� ��', '15000'); 
   
   --������ġ
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('27', 'ȥ���⺻ ��ġȸ', '19000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('27', 'ȥ��Ư�� ��ġȸ', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('27', 'ȥ������� ��ġȸ', '25000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('27', '����⺻', '28000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('27', '����Ư��', '34000'); 
   
   --��Ǯ��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('28', '��� ����ȸ', '31000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('28', 'Ư�� ��ġȸ', '37000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('28', '����� ��ġȸ', '38000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('28', '��� �ʹ� A', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('28', '��� �ʹ� B', '23000'); 
   
   --������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('29', '����', '16000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('29', '�췰', '30000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('29', '����+�췰', '31000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('29', '����+�췰+����', '34000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('29', '������', '28000'); 
   
   --ī����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('30', '��ġ�����', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('30', '���ɱ���', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('30', '�������', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('30', '�ν�����', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('30', '��ɽ�ƽī��', '9500'); 
  
   
   --���� �޴�
   
      --���ڸ���
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('31', '������Ʈ', '21000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('31', '���׸�����', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('31', '�ܰ�������', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('31', '�޺���̼�', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('31', '���۷δ�ġ����ź����', '20000');
   
   --��Ÿ����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('32', '���ڳ� ��ī��', '21000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('32', '���۷δ�', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('32', '��Ʈ�� ��Ʈ����Ʈ', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('32', '��Ʈ����Ʈ ����Ű ġŲ', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('32', 'ġ����������', '25000');
   
   --���ڱ���
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('33', '���İ�Ƽ ��Ʈ', '28000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('33', '���� ��Ʈ', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('33', '�ݹ�����', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('33', '�����������', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('33', '��ġŲ����', '21000');
   
   --����������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('34', '�ݹ�����', '23000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('34', '�ݹ�������', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('34', '���ذ����', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('34', '�һ�����', '25000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('34', '���¹ڽ�', '31000');
   
   --Ž��������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('35', '�ҺҰ�� ����', '29000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('35', '���� �� ��Ʈ', '28000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('35', 'ġ����ź����', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('35', '��������', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('35', '�˷��Ͽ��̾�', '20000');
   
   --����������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('36', 'Ʈ���� ġ��', '25000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('36', '�δ�� ����', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('36', '�κα�ġ ����', '20000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('36', '�����ҹ� ����', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('36', '�ݹ� ����', '23000');
   
   --��Ʈ������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('37', '4��Ʈ ����', '25000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('37', '������ü��ġ������', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('37', '���۷δ�����', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('37', '��Ʈ�ڽ�', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('37', '�����ݸ���', '10000');
   
   --Ŵ��ν�����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('38', '�Ƹ޸�ĭ�����۷δ�', '23000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('38', '��������ġŲ����', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('38', '������ũ����������', '25000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('38', '����+�Ľ�Ÿ', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('38', '�ݹ�����', '23000');
   
   --����������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('39', '���۷δ�����', '23000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('39', '�Ұ������', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('39', '������������', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('39', '�丶�� �Ľ�Ÿ', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('39', 'ũ�� �Ľ�Ÿ', '12000'); 
   
   --���ھ˺���
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('40', '�������ְ������', '21000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('40', '�뼼����', '20000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('40', '���ݴܹ�����', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('40', '��������', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('40', '��ȣ������', '23000');

   
   -- ��� �޴�
   
    --����ȣ�� ��⸸ ��޵���
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('41', '��⸸ + ��⸸ ��Ʈ', '25000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('41', '������䱸��', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('41', '������챸��', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('41', '��������', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('41', '�ſ������䱸��', '15000');
   
   --�����770
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('42', '������ȭ�Ұ�� ���� SET
', '18000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('42', '��������Ұ�� ������ SET
', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('42', '��������Ұ�� ���� SET
', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('42', '��ź ����Ұ��(��)
', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('42', '��������Ұ�� �ݹ� SET', '26000'); 
   
   --Ȳ������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('43', '����¥��(¥����)', '18000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('43', '������', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('43', '���޴ߺ�����', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('43', '���帶�ÿ��������', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('43', '��������', '21000'); 
   
   --�ְ���
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('44', '�߰���(��)', '26000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('44', '�߰���(��)', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('44', 'ġ�� �߰���', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('44', '������������(1�κ�200g)', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('44', 'ġ�� �߰���(��)', '23000'); 
   
   --������ȸ
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('45', '���嵿Ŭ�� ����ȸ', '21000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('45', '�������ù�', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('45', '��â ��������ȸ', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('45', '����ȸ ��� �����', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('45', '��ū�Ұ�ⱹ��', '21000'); 
   
   --�ʵ�
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('46', '����������', '21000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('46', '�߹�', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('46', '�߰�����', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('46', '�ʰ豹��', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('46', '�ʰ�������', '18000'); 
   
   --������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('47', '���ܻ�� ��⸸', '23000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('47', '����� ��⸸', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('47', '������ ��⸸', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('47', '���� �Ҽ��� ��Ʈ', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('47', '���� ���� �� �Ҽ���', '18000'); 
   
   --��������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('48', '���� ���������� �ٺ�ť', '23000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('48', '���� ���������� �ٺ�ť', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('48', '��� ���������� �ٺ�ť', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('48', '�ſ�� �ٺ�ť', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('48', '�ܸ��� ���������� �ٺ�ť', '26000'); 
   
   --ȥ��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('49', '�ѿ�������������', '26000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('49', 'Ŀ�ü�Ʈ 2��', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('49', '��⸸', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('49', '��� + ��� ������ ��Ʈ', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('49', 'ȥ�� �������� + ������ ��Ʈ', '21000'); 
   
   --��޻��������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('50', '��ȭ ���� �ѻ�', '26000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('50', '�������Ƽ', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('50', '��ȭ ��� ��⸸', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('50', '�ø� ��Ʈ', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('50', '��� ��Ʈ', '21000'); 
   
   --ġŲ �޴�
   
   --�Ƕ���ٺ�ť
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('51', '�Ұ��������ٺ�ť', '16000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('51', 'ȫ���������ٺ�ť', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('51', '��������ٺ�ť', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('51', '���������ֹٺ�ť', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('51', '��������Ʈ�ٺ�ť', '19000'); 
   
   --�ϳ��߰���
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('52', '���� �߰��� �ݹڽ�', '10000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('52', '�ſ� �߰��� �ݹڽ�', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('52', '���ð��� �߰���', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('52', '����Ƣ��', '9500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('52', '�����߳�', '12000');  
   
   --�Ķ��̵������ϴ���
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('53', '�Ķ��̵� ġŲ', '15000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('53', '�ݹ� ġŲ', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('53', '���ġŲ', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('53', '����ġ��ġŲ', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('53', '��Ϲ���ġŲ', '18000');  
   
   --����Ų���Ҿ�䱸��ġŲ
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('54', '���Ҿ�䱸��', '18000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('54', 'ġ�似Ʈ(����)', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('54', '�ҸƼ�Ʈ', '25000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('54', '������ݼ���ұݹ�', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('54', '�����ݻ��ұݹ�', '18000'); 
   
   --�׳�ġŲ
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('55', 'û�縶��ġŲ', '20000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('55', '������Ż�Ĵ�', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('55', '�� �ݹ�ġŲ', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('55', '�ߴٸ�', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('55', '������ġŲ', '20000'); 
   
   --����ġŲ
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('56', '����ٻ��', '19000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('56', '�ұ�ġŲ', '20000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('56', '���߹ٻ��', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('56', 'ġ��ٻ��', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('56', '��������', '16000'); 
   
   --���ڹ�
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('57', '���� �ұݱ���', '20000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('57', '�� �ұݱ���', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('57', '���� ��䱸��', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('57', '�� ��䱸��', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('57', '������ݼ���ұݹ�', '21000');  
   
   --BHC
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('58', 'ġ���� �Ķ��̵�', '20000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('58', '�Ѹ�Ŭ �޺�', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('58', '���ŷ �޺�', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('58', '����ŷ �޺�', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('58', '�Ϲٳ׷� ����ŷ �Ķ��̵�', '23000');  
   
   --�丮ī��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('59', '���� ����ġŲ', '20000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('59', '�Ķ��̵� ġŲ', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('59', '���ġŲ', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('59', '���� + �Ķ��̵��', '20000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('59', '���� ��Ʈ', '21000'); 
   
   --�ڴ�ġŲ
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('60', '�Ķ��̵�ġŲ', '18000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('60', '����ġŲ', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('60', '�ʽ���ġŲ', '20000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('60', '��������ġŲ', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('60', '���׶�ġŲ', '21000'); 
   
   --�н� �޴�
   
   --�ҽ�������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('61', 'Ŀ�ö�����', '15000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('61', '�ҽ� ������', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('61', '����������', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('61', '��ġ ��Ʈ', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('61', 'ġ������������', '18000'); 
   
   --����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('62', '����Ƣ ��Ʈ', '18000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('62', 'Ʈ���� ũ��������', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('62', '�߽�ĭ����ġ�����', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('62', '��ġġ ��Ʈ', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('62', '�ʴޱ���������', '16000');  
   
   --�ż��趱����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('63', '�ٴ�����������', '18000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('63', '�ż��趱 2�� ��Ʈ', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('63', '���� ���� Ƣ��', '3000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('63', '�ż��� ������', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('63', '�ٴ����� �ʴ߹�', '16000'); 
   
   --������Ƽ
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('64', '��â���� + ���İ�Ƽ 2��', '18000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('64', '����ũ�� �Ľ�Ÿ', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('64', '���� �Թ��Ľ�Ÿ', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('64', '��Ͼ� �Ϲٳ׷� ġŲ', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('64', '���� �ĸ��� ġŲ', '18000'); 
   
   --�������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('65', '�������', '3000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('65', '��ġ���', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('65', '������', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('65', '�̸�', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('65', '������Ʈ', '15000'); 
   
   --���ϼ��н�
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('66', '�����̸�', '7500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('66', '���μ�Ʈ', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('66', '������', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('66', '��������', '8500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('66', '��ȭ��ź�Ұ�ⵤ��', '8500'); 
   
   --���Ǿƶ�����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('67', '���Ǿ� ��Ϲ��� ������', '15000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('67', '���Ǿ� ������', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('67', '���Ǿ� ���� ������', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('67', '���Ǿ� ��Ʈ 1', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('67', '���Ǿ� ��Ʈ 2', '21000'); 
   
   --������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('68', '�Ҹ����� ġ��Ҵ߶�����', '15000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('68', '����� �������� ������', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('68', 'ũ���� ���� ������', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('68', '���ѱ��� ���ġ�����', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('68', '���� ��ȭ�߹�', '12000'); 
   
   --������ǰ
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('69', '�ع�«�Ͱ���������', '9500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('69', '��Ͼ� �͸��� ����������', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('69', '��Ȧ�� ġŲ ��Ʈ', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('69', 'ġŲ Ŀ�� ��Ʈ', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('69', '���� Ŀ�� ��Ʈ', '12000'); 
   
   --��䳪��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('70', '��ɵ��', '7500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('70', '���κ�', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('70', '��������', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('70', '��ġ������', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('70', '�̸�', '7000'); 
   
   
   --�н�ƮǪ�� �޴�
   
       --���ؽ�
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('71', '�̱��� �߰�� ����', '10000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('71', '�̱��� ���� �߰�� ����', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('71', '���ؽ� 1�� �޴�', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('71', '�̱��� �߰�� �÷���', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('71', '���̳ʽ� BBQ Ǯ�� ��ũ ����', '10000'); 
   
   --����ũ����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('72', '�÷�ũ����', '7500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('72', '����������', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('72', 'ġ����ż�Ʈ', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('72', '������ġ����ż�Ʈ', '9500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('72', '�ӽ�����ż�Ʈ', '9500'); 
   
   --�Ե�����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('73', 'ĸƾ��', '16000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('73', '����ĸƾ��', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('73', '���� �ѿ�Ұ�� ��Ʈ', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('73', '�ѿ� Ʈ���øӽ�ǰ��Ʈ', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('73', '��¥���� �� �� ���� ��Ʈ', '9000'); 
   
   --OG����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('74', '������', '9500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('74', '�����ܹ���', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('74', 'Ŭ���ĺ�������', '9500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('74', '��Ʈ�����', '9500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('74', '����ġŲ', '15000'); 
   
   --��귣�����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('75', 'ũ������ �����ؽ� ��Ʈ', '18000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('75', '����ġ�� ������ �ñ״�ó ��Ʈ', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('75', '�ñ״�ó ���Դ���', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('75', '�ñ״�ó ��Ƽ��', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('75', 'ũ��ġ ��', '18000'); 
   
   --����ŷ
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('76', '�����ػ罺ĥ������', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('76', '��Ʈ��ġ�����', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('76', '���Ϳ���', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('76', 'Ÿ�ٽ��� ������� ��Ʈ', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('76', '���� ��Ʈ', '10000'); 
   
   --������ġ
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('77', '�׸�������������', '8000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('77', '�ҽ��̹���', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('77', '��ġ����̹���', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('77', '���̹��ż�Ʈ', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('77', 'ȭ��Ʈ��������', '2000'); 
   
   --������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('78', '��Ż���� ��Ƽ', '7000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('78', '���׸���', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('78', '��', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('78', '��ġ', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('78', '����', '7000'); 
   
   --���ž���������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('79', 'ġ�����', '7500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('79', '������ġ�����', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('79', '����Ÿ����������', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('79', '�����ĥ������', '8500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('79', 'ȭ��Ʈġ���Ƣ��', '3000');  
   
   --�ٹ���
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('80', '�Ұ�����', '7000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('80', '��������ġ�����', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('80', '�ֽ��Ǵ�����', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('80', '�ñ״��Ĺ���', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('80', '���̾�Ʈ�̱۹���', '7000'); 
   
   
   --ī�� �޴�
   
    --ĵī��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('81', '�ٴҶ��', '3500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('81', '�Ƹ޸�ī��', '3000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('81', 'ī���', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('81', 'ī����̰�(����)', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('81', '������Ӷ�', '3500');
   
   --�ް�Ŀ��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('82', '�÷��� ��ũ����', '4000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('82', '���� ���Ʈ ������', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('82', '��Ű ������', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('82', '������Ű ������', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('82', '�����ֽ�', '3500');
   
   --ī�����ߵ�
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('83', '����������', '3000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('83', 'ī�� ��', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('83', 'ī�� ��ī', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('83', '�ٴҶ� ��', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('83', '������� ��', '4000');
   
   --�����ٸ�1����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('84', '���� �����', '5000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('84', '���ǳ� ��', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('84', '�޷γ� ��', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('84', '�׸�Ƽ ��', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('84', '�����', '4000');
   
   --ī�亸��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('85', '����ĵ(�Ƹ޸�ī��)', '3000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('85', '��Ʋ(1���� ����)', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('85', '���⿡�̵�', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('85', 'ü�����̵�', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('85', '�����̵�', '4000');
   
   --����ƮĿ��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('86', '����ũ ����Ƽ', '4000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('86', '�ٹ�Ŀ�� ����Ƽ', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('86', '�ް� ����Ƽ', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('86', 'Ÿ�� ����Ƽ', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('86', '���� ����Ƽ', '5000');
   
   --�뽺Ʈ
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('87', '�����̺���', '7500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('87', '�Ϻ���', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('87', '��纣������', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('87', '�����ƺ���', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('87', '�Ƹ޸�ī��', '2000');
   
   --��Ŀ��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('88', '��ܽ�����', '4000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('88', '������', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('88', '��ü �ݵ���', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('88', '���̽�Ƽ', '3000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('88', '������', '3000');
   
   --����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('89', '�Ƹ޸�ī��', '2000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('89', 'ī���', '3000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('89', 'īǪġ��', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('89', '�ٴҶ� ��', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('89', 'ī���ī', '3000');
   
   --�̵��Ŀ��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('90', '���� ���̺���Ƽ', '3500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('90', '����� ����', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('90', '�ް� �ͽ�ġ��', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('90', '���� ��ũƼ', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('90', '���� ȣ������', '3000');
   
   
   -- ����Ʈ �޴�
   
       --�ÿ��ʿ���
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('91', '���ڼҶ�', '3500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('91', '����ġ������ũ', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('91', '�ٴҶ�ī��', '8500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('91', '���⸶ī��', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('91', '���ڸ�ī��', '18000');
   
   --�ĸ��ٰԶ�
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('92', '�߾��� �Ҽ�����', '3500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('92', '�ķ���ũ�����廧', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('92', '��ġ ������ġ', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('92', '�ν�ƮġŲ ������', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('92', 'ȭ���� ��ġ��Ҵ߻�', '5000');
   
   --�ɸ�����Ʈ����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('93', '�÷��� ��ī�ٹ̾� ��Ű', '3000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('93', '����ȭ��Ʈ����� ��Ű', '3000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('93', '�������� ��ī��', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('93', '���͹�', '3000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('93', '��Ű�������Ű', '3500');
   
   --Ÿ������Ʈī��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('94', '��ũ�� �� ����', '3500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('94', '���� ���� �ٴҶ� ����', '3000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('94', '���� ���� ���� ����', '3000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('94', '�������� ����', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('94', '�Ǹ��� ��������', '4000');
   
   --Ȧ��������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('95', '����ī���׻�ũ������ũ', '3500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('95', '���� �����Ű', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('95', '���� �� ��Ű', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('95', '�ٻ��� ũ�οͻ�', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('95', '��ġ��׻�����ġ', '4000');
   
   --������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('96', '�Ķ�ũ �Ҽ��� ������', '7000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('96', '���� �߰����� ������', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('96', '�ǰ� ��ȣ�� ������', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('96', '�ٻ�ġŲ�ٴ� ������', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('96', '������ ������ ������', '7500');
   
   --Ǫ������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('97', '���� ���� ������', '8000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('97', '����� �߰����� ������', '8500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('97', '������� �κ� ������', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('97', '�ƺ�ī�� ��� ����', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('97', '���� �׷���� �׸� ���Ʈ', '6000');
   
   --��������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('98', '�������� ����', '8000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('98', '�� ���� ����', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('98', '��ä�콺����ũ ����', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('98', '�������δ߰����� ����', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('98', '��������� ����', '9500');
   
   --����Ʈ�ڽ�
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('99', '����ġ�����Ÿ��Ʈ', '5000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('99', '�����̾���Ű', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('99', '����ǻ�� ����', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('99', '����� ��Ű', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('99', '���������̺���', '6000');
   
   --��������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('100', '���ʸ��û�', '5000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('100', '����Ҽ���', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('100', '��ȣ�ڽ���', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('100', '�ø���ġ�ƹ���', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('100', '������', '3000');
   
   --��ŰƮ 
   
   -- �ѽ� ��ŰƮ �޴�
      --�Ļ��غ�
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5001', '��������', '9000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5001', '������', '8500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5001', '�δ��', '9500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5001', '��ġ������', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5001', '��α⺺����', '8000');
   
   --������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5002', '������Ʈ', '9000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5002', '�����ʹ�', '9500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5002', '���������', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5002', '���쵤��', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5002', '��������', '9000');
   
   --���빮���ⶱ����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5003', '����޴�', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5003', '�����޴�', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5003', 'ũ���޴�', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5003', '����ߺ�����', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5003', '����߹�', '10000');
   
   --���
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5004', '�δ��', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5004', '��õ�Ĵ߰���', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5004', '��¡���', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5004', '��������', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5004', '�ڴٸ�����', '15000');
   
   --�θ������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5005', '�������', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5005', '�ſ����', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5005', '�������', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5005', '�ſ�߰���', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5005', '�����߰���', '12000');
   
   --����ҵ�
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5006', '����Ұ�⸶����', '15000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5006', '������� ������ũ', '20000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5006', '�븶�� ��������ũ', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5006', '�δ��', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5006', '�Թڽ�����ũ', '9500');
   
   --����������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5007', '������', '16000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5007', '��Ȧ�� 1�� ��Ʈ', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5007', '�����â', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5007', '�����', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5007', '����', '15000');
   
   --�κ�ǰ��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5008', '��ū������', '9000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5008', '��ū���κ�������', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5008', '�������κ�������', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5008', '��κ�', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5008', '��񶱸��α�', '8000');
   
   --���
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5009', '���ٽ� �� ������', '8500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5009', '�������', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5009', '�����̾� ��� �ع���', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5009', '���� ��ū ����', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5009', '�ѿ��� �δ�����', '16000'); 
   
   --�����״߰���
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5010', '������ �߰��� ��Ʈ', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5010', '�ſ� �߰��� ��Ʈ', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5010', '�߰��� ö�Ǻ�����', '9500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5010', '���� ö�Ǻ�����', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5010', '��ġ��߰��� ��Ʈ', '15000'); 
   
   
   -- �߽� ��ŰƮ �޴�
    --����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5011', '«��', '4000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5011', '¥���', '3500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5011', '��¥���', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5011', '������', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5011', '��ä��', '6000'); 
   
   --�ູ«��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5012', '��«��', '7000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5012', '����«��', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5012', '�ع�«��', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5012', '¥���', '4000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5012', '�Ｑ¥���', '5000'); 
   
   --�������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5013', '¥���', '5000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5013', '�Ｑ¥���', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5013', '�Ｑ«�� ', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5013', '«�͹�', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5013', '��ä��', '6000'); 
   
   --���Ѽ�
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5014', '¥���', '4000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5014', '«��', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5014', '������', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5014', '��ä��', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5014', 'Ư��', '8500'); 
   
   --��������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5015', '¥���', '5000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5015', '«��', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5015', '��¥���', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5015', '��«��', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5015', '������ä', '8000'); 
   
   --�밡«��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5016', '��«��', '5000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5016', '��¥���', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5016', '«�͹�', '7000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5016', '��ä��', '6000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5016', '������ä', '8000'); 
   
   --ȫ¥��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5017', '��¥���', '7500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5017', '������', '8500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5017', '¥���', '8500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5017', '�Ｑ¥���', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5017', '���¥��', '9500'); 
   
   --�ҹ��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5018', '�Ｑ«��', '5000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5018', '�Ｑ¥���', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5018', '���¥��', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5018', '������', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5018', '��ä��', '8000');
   
   --����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5019', 'Ư��', '8500');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5019', '������ä', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5019', '�Ⱥ�ä', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5019', '������', '7500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5019', '�ɻ�', '5000');
   
   --��ȭ��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5020', '«��', '5000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5020', '¥���', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5020', '��¥���', '5000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5020', '����«��', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5020', '������', '5000');
   
   
   -- �Ͻ� ��ŰƮ �޴�
    --������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5021', '��Ű��Ű', '16000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5021', '��ǣ������', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5021', '������Ű«��', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5021', '��ǣ������4�κ�', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5021', '��Ű��Ű������꼼Ʈ', '18000'); 
   
   --����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5022', '������ ��Ű��Ű', '23000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5022', '��ǣ������ŰƮ', '20000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5022', '������Ű«��', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5022', '�ѿ� ��������', '20000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5022', '������ ���꼼Ʈ', '18000');
   
   --���ٵ�ī��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5023', '��ɵ��', '9000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5023', 'ġ��', '8000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5023', '�뵷�', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5023', '������ ��Ʈ', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5023', 'ġŲ�', '7500'); 
   
   --�ʹ̳�
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5024', '6���̴� �ɰ����', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5024', '�������� ����ʹ�', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5024', '��� ����ʹ�', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5024', '���� ����ʹ�', '9500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5024', '��ä�� ����ʹ�', '15000');
   
   --���� ������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5025', '�ѿ������ʹ�', '15000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5025', '������ �����ʹ�', '9000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5025', '���޲ٹ�', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5025', '�����ʹ�', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5025', '���� ��ŰƮ 3�κ�', '18000');
   
   --������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5026', '��ǣ������', '19000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5026', '��������', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5026', '������Ű«��', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5026', '������꼼Ʈ', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5026', '�ѿ쳪��4�κ�', '20000 ');
   
   --�� ��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5027', '�̼� �������� 3�κ�', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5027', '������ǳ �Ұ�� ��Ű��Ű', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5027', '������ ��ǣ�� ����', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5027', '�Ұ�� ���� ��ŰƮ 2�κ�', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5027', '����ǳ �Ұ�� ��Ű��Ű', '16000 '); 
   
   --��Ű
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5028', '��Ű��Ű �������2�κ�', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5028', '������� ���� ��ǣ������', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5028', '��������', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5028', '�Ұ���ǣ������ 3�κ�', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5028', '�ҺҰ�� ��â����', '16000');
   
   --��õ
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5029', '��ǰ�����糢«����2�κ�', '10000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5029', '�������� ���� ť�� �����', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5029', '��ǣ������', '10000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5029', '��Ű��Ű��ŰƮ 2�κ�', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5029', '������� ��ŰƮ 3�κ�', '10000');
   
   --������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5030', '������ ��ǣ������', '18000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5030', '������ ����', '15000 ');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5030', '������ �뱸��', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5030', '���� �Ҵ�â����', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5030', '���� ��ǣ������', '18000');
   
   
   -- ��� ��ŰƮ �޴�
     --��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5031', '��������ũ', '23000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5031', '��콺����ũ', '28000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5031', 'ä��������ũ', '29000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5031', '�Թڽ�����ũ', '29000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5031', '��ġ��ٺ�ťġŲ', '23000');
   
   --�λ������
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5032', '������챸�̻ʻ�', '30000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5032', '�����۽�����ũ', '34000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5032', '�������ũ', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5032', '������丶ȣũ', '37000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5032', '�����Ͽ콺������ũ', '35000');
   
   --��淹����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5033', '������ν�����ũ', '31000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5033', '�����Ž�����������', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5033', '����ٺ�ť', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5033', 'ȭ��Ʈ�󱸼ҽ��Ľ�Ÿ', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5033', '�ý�Ʈ��ġŲ������ũ', '15000');
   
   --���̹ٳ�
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5034', '�簥������ũ', '30000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5034', '�������̺����������̾�', '34000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5034', '�����Թڽ�����ũ', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5034', '����Ÿ�÷���', '38000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5034', '�ٺ�ť����', '37000');
   
   --����
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5035', '�������̵�簥��', '38000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5035', 'ĳ�����ڼ�������', '37000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5035', '������¡������', '35000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5035', '��Ÿ�̰Ž�Ǫ���÷���', '30000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5035', 'Ʈ���øӽ��뽺����ũ', '31000');
   
   --����Ÿ��
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5036', '�߽�ĭô���̷�', '29000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5036', '�����Ž�����������', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5036', '�����۽�����ũ', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5036', '����Ÿ�÷���', '30000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5036', '����ٺ�ť', '19000');
   
   --è���ڽ�
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5037', '�ٺ�ť����', '28000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5037', '�������ũ', '15000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5037', 'ȭ��Ʈ�󱸼ҽ��Ľ�Ÿ', '12000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5037', '�߽�ĭô���̷�', '23000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5037', '��Ÿ�̰Ž�Ǫ���÷���', '19000');
   
   --���ǽ�Ź
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5038', '��콺����ũ', '20000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5038', '�������ũ', '16000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5038', '�����Ͽ콺������ũ', '26000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5038', '������ν�����ũ', '29000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5038', '�Ž�����������', '8000');
   
   --��Ʋ ������Ʈ
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5039', '�󱸼ҽ��Ľ�Ÿ', '12000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5039', '����Ÿ�÷���', '20000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5039', '�ٺ�ť����', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5039', '������', '8500');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5039', '�ý�Ʈ��ġŲ������ũ', '21000');
   
   --ī��𸮾�
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5040', 'ġŲ������ũ��Ʈ', '20000');
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5040', '�̺�����', '19000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5040', '�簥��', '18000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5040', '����', '21000');  
   INSERT INTO BMENUTable (SCODE, SMENU, PRICE)   VALUES ('5040', '�ٺ�ťġŲ', '16000');
   
   commit;