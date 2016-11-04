-- 2016.08.19 DDL, 제약조건 활용 테이블 생성하기
/*
                    판매전표
   ===================================================
    컬럼명      전표번호    판매일자     고객명      총액
   ===================================================
    P|U|N       PK         NN         NN
   ===================================================
    참조테이블
   ===================================================
    참조 컬럼
   ===================================================
    CHECK                                      > 0
   ===================================================
    타입        VARCHAR2   DATE    VARCHAR2    NUMBER
   ===================================================
    길이           12                 34
   ===================================================
*/

CREATE TABLE 판매전표(
  전표번호 VARCHAR2(12) CONSTRAINT 판매전표_전표번호_PK PRIMARY KEY,
  판매일자 DATE CONSTRAINT 판매전표_판매일자_NN NOT NULL,
  고객명 VARCHAR2(34) CONSTRAINT 판매전표_고객명_NN NOT NULL,
  총액 NUMBER CONSTRAINT 판매전표_총액_CK CHECK(총액 > 0)
);

SELECT * FROM 판매전표;


/*
  형식)
    1) 제약조건에 이름을 부여하는 방법
    ==>   [컬럼명] [데이터타입] CONSTRAIN [제약조건이름] [제약조건]
    ==> Ex)
          전표번호 VARCHAR2(20) CONSTRAIN 판매전표_전표번호_NN NOT NULL

    2) 제약조건을 맨 뒤에 주는 방법
    ==>   CONSTRAIN [제약조건이름] [제약조건](컬럼명)
    ==> Ex)
          CREATE TABLE 판매전표(
            전표번호 VARCHAR2(12),
            판매일자 DATE CONSTRAIN 판매전표_판매일자_NN NOT NULL,
            CONSTRAIN 판매전표_전표번호_PK PRIMARY KEY(전표번호)
          );
*/

/*
                    제 품
  ==========================================
   컬럼명    제품번호      제품명       제품단가
  ==========================================
   P/U/K     PK          UK
  ==========================================
   참조테이블
  ==========================================
   참조컬럼
  ==========================================
   CHECK                              >0
  ==========================================
   타입    VARCHAR2    VARCHAR2     NUMBER
  ==========================================
   길이       12            12
  ==========================================
*/

CREATE TABLE 제품(
  제품번호 VARCHAR2(12) CONSTRAINT 제품_제품번호_PK PRIMARY KEY,
  제품명 VARCHAR2(12) CONSTRAINT 제품_제품번호_UK UNIQUE,
  제품단가 NUMBER(5) CONSTRAINT 제품_제품단가_CK CHECK(제품단가>0)
);

SELECT * FROM 제품;

/*
                 전표상세
  =========================================================
   컬럼명    전표번호      제품번호       수량     단가     금액
  =========================================================
   P/U/K      PK          NN          NN      NN
  =========================================================
   참조테이블 판매전표       제품
  =========================================================
   참조컬럼   전표번호      제품번호
  =========================================================
   CHECK                                               >0
  =========================================================
   타입     VARCHAR2     VARCHAR2    NUMBER  NUMBER  NUMBER
  =========================================================
   길이       12            12
  =========================================================
*/

CREATE TABLE 전표상세(
  전표번호 VARCHAR2(12) CONSTRAINT 전표상세_전표번호_PK PRIMARY KEY CONSTRAINT 전표상세_전표번호_FK REFERENCES 판매전표(전표번호),
  제품번호 VARCHAR2(12) CONSTRAINT 전표상세_전표번호_NN NOT NULL CONSTRAINT 전표상세_제품번호_FK REFERENCES 제품(제품번호),
  수량 NUMBER(5) CONSTRAINT 전표상세_수량_NN NOT NULL,
  단가 NUMBER(5) CONSTRAINT 전표상세_단가_NN NOT NULL,
  금액 NUMBER(5) CONSTRAINT 전표상세_금액_CK CHECK(금액>0)
);

SELECT * FROM 전표상세;

/*
참조 당하고 있는 판매전표와 제품은 전표상세를 삭제하기 전에는 삭제되지 않음
 */

DROP TABLE 전표상세;
DROP TABLE 제품;
DROP TABLE 판매전표;

/*
답변형 게시판 replyBoard

게시물번호     no           NUMBER        PRIMARYKEY
이름         name       VARCHAR2(34)      NOT NULL
이메일       email      VARCHAR2(50)       UNIQUE
제목        subject     VARCHAR2(200)     NOT NULL
내용        content         CLOB          NOT NULL
비밀번호      pwd        VARCHAR2(10)      NOT NULL
등록일      regdate          DATE           DEFAULT
조회수        hit          NUMBER           DEFAULT
답변그룹     group_id       NUMBER
답변순서    group_step      NUMBER           DEFAULT
루트         root          NUMBER           DEFAULT
답변개수     depth          NUMBER           DEFAULT

 */
DROP TABLE replyBoard CASCADE CONSTRAINTS;

CREATE TABLE replyBoard(
  no NUMBER CONSTRAINT RB_no_PK PRIMARY KEY,
  name VARCHAR2(34) CONSTRAINT RB_name_NN NOT NULL,
  email VARCHAR2(50) CONSTRAINT RB_email_UQ UNIQUE,
  subject VARCHAR2(200) CONSTRAINT RB_subject_NN NOT NULL,
  content CLOB CONSTRAINT RB_content_NN NOT NULL,
  pwd VARCHAR2(10) CONSTRAINT RB_pwd_NN NOT NULL,
  regdate DATE DEFAULT SYSDATE,
  hit NUMBER DEFAULT 0,
  group_id NUMBER DEFAULT 0,
  group_step NUMBER DEFAULT 0,
  group_tab NUMBER DEFAULT 0,
  root NUMBER DEFAULT 0,
  depth NUMBER DEFAULT 0
);

ALTER TABLE replyBoard DROP UNIQUE(email);

SELECT * FROM replyBoard;

-- 변경 => ALTER
   : 생성된 테이블 속성과 속성에 관련된 제약을 변경하며, 기본키 및 외래키를 변경함
   1) ADD : 컬럼추가
      ALTER TABLE table명 ADD 컬럼명 데이터형 [제약조건]
   2) MODIFY : 컬럼변경
      ALTER TABLE table명 MODIFY 컬럼명(기존) 데이터명 [제약조건]
   3) DROP : 컬럼 삭제
      ALTER TABLE table명 DROP COLUMN column명

-- 삭제 => DROP
   : DROP문은 테이블을 삭제하는 명령. 테이블의 구조와 테이터를 모두 삭제
     ==> 복구 불가, 사용에 주의해야 함
     (데이터만 삭제하려면 DELETE문 사용함)
   DROP TABLE table명 (완전 삭제)

-- 데이터 잘라내기 => TRUNCATE
   TRUNCATE TABLE table명(데이터만 지우기)

-- 테이블명 변경 => RENAME
   RENAME table명 (old) TO table명 (new)

-- CONSTRAINT 추가/수정/삭제
   1) 제약 조건명 지정없이 UNIQUE 제약조건 추가
      ALTER TABLE table명 ADD UNIQUE (컬럼명)
   2) 제약조건명 지정하여 UNIQUE 제약조건 추가
      ALTER TABLE table명 ADD CONSTRAINT 제약조건명 UNIQUE (컬럼명)
   3) PRIMARY KEY 제약조건 추가
      ALTER TABLE table명 ADD PRIMARY KEY (컬럼명)
   4) 테이블의 PRIMARY KEY 제약조건 삭제
      ALTER TABLE table명 DROP PRIMARY KEY
   5) 제약조건명 삭제
      ALTER TABLE table명 DROP CONSTRAINT 제약조건명
   6) 테이블과 관련 제약조건 일관삭제
      DROP TABLE table명 CASCADE CONSTRAINTS;

-- 시퀀스(SEQUENCE)
   1) 특정 컬럼에 대해 유일(UNIQUE)한 값을 연속적으로 생성하기 위해 사용
   2) 시퀀스를 생성하기 위해서는 CREATE SEQUENCE 권한을 가지고 있어야 함
   3) 시퀀스 생성하기
      CREATE SEQUENCE 시퀀스명 (옵션)
   4) 생성 옵션
     - START WITH : 시퀀스의 시작 값을 지정. n을 1로 지정 => 1부터 순차적으로 증가
     - INCREMENT BY n : 시퀀스의 증가 값. n을 2로 지정 => 2씩 증가
                         기본값은 1이고 0이될 순 없음
     - CYCLE | NOCYCLE : NOCYCLE은 시퀀스가 최대 값까지 증가했을 때 순환하지 않도록 지정
                         NOCYCLE이 디폴트

-- no의 자동증가 시퀀스 생성
DROP SEQUENCE rb_no_sec;
CREATE SEQUENCE rb_no_sec START WITH 2 INCREMENT BY 1 NOCYCLE NOCACHE;

-- 시퀀스를 활용하여 게시판 테이블에 데이터 입력
INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id)
       VALUES(rb_no_sec.nextval,'오해영','','답변형 게시판', '답변형 게시판 만들기', '1234',1);

INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id)
       VALUES(rb_no_sec.nextval,'오해영','','답변형 게시판', '답변형 게시판 만들기', '1234',2);

INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id)
       VALUES(rb_no_sec.nextval,'오해영','','답변형 게시판', '답변형 게시판 만들기', '1234',3);

INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id)
       VALUES(rb_no_sec.nextval,'오해영','','답변형 게시판', '답변형 게시판 만들기', '1234',4);

INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id)
       VALUES(rb_no_sec.nextval,'오해영','','답변형 게시판', '답변형 게시판 만들기', '1234',5);

INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id)
       VALUES(rb_no_sec.nextval,'오해영','','답변형 게시판', '답변형 게시판 만들기', '1234',6);

INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id)
       VALUES(rb_no_sec.nextval,'오해영','','답변형 게시판', '답변형 게시판 만들기', '1234',7);

INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id)
       VALUES(rb_no_sec.nextval,'오해영','','답변형 게시판', '답변형 게시판 만들기', '1234',8);

INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id)
       VALUES(rb_no_sec.nextval,'오해영','','답변형 게시판', '답변형 게시판 만들기', '1234',9);

INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id)
       VALUES(rb_no_sec.nextval,'오해영','','답변형 게시판', '답변형 게시판 만들기', '1234',10);

INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id)
       VALUES(rb_no_sec.nextval,'오해영','','답변형 게시판', '답변형 게시판 만들기', '1234',11);

INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id)
       VALUES(rb_no_sec.nextval,'오해영','','답변형 게시판', '답변형 게시판 만들기', '1234',12);

INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id)
       VALUES(rb_no_sec.nextval,'오해영','','답변형 게시판', '답변형 게시판 만들기', '1234',13);

INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id)
       VALUES(rb_no_sec.nextval,'오해영','','답변형 게시판', '답변형 게시판 만들기', '1234',14);

INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id)
       VALUES(rb_no_sec.nextval,'오해영','','답변형 게시판', '답변형 게시판 만들기', '1234',15);

COMMIT;

SELECT * FROM replyBoard;

SELECT count(no) FROM (SELECT*FROM replyBoard WHERE no BETWEEN 1 AND 26);

SELECT no, subject, name, regdate, hit, group_tab FROM replyBoard ORDER BY group_id DESC, group_step ASC;

SELECT no, subject, name, regdate, hit, group_tab, rownum as num
FROM (SELECT no, subject, name, regdate, hit, group_tab
FROM replyBoard ORDER BY group_id DESC, group_step ASC);

SELECT no, subject, name, regdate, hit, group_tab, TO_CHAR(regdate, 'YYYY-MM-DD'), num
FROM (SELECT no, subject, name, regdate, hit, group_tab, rownum as num
FROM (SELECT no, subject, name, regdate, hit, group_tab
FROM replyBoard ORDER BY group_id DESC, group_step ASC));

SELECT no, subject, name, regdate, hit, group_tab, TO_CHAR(regdate, 'YYYY-MM-DD'), num
FROM (SELECT no, subject, name, regdate, hit, group_tab, rownum as num
FROM (SELECT no, subject, name, regdate, hit, group_tab
FROM replyBoard ORDER BY group_id DESC, group_step ASC))
WHERE num BETWEEN 11 AND 20;
