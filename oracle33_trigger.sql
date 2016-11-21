/*
    4. 트리거(trigger)
      1) 개념
        - 데이터의 변경(Insert, Delete, Upadte==>triggering event(트리거링 사건))문이 실행될 때,
          자동으로 따라 실행되는 프로시저
        - 선언절, 실행절, 예외절을 가지는 PL/SQL 블록 구조를 가지고
           데이터베이스에 저장되어야 함
        - 특정 사건(Insert, Delete, Update)이 발생될 때마다,
          자동으로(묵시적)으로 해당 PL/SQL블록(trigger)이 실행됨
        - 서브 프로그램
    
      2) 유형: FOR EACH ROW 옵션절 사용 유무로 구분함 ==> 사용하면 행 트리거
        - 문장 레벨(Statement Level)의 트리거
            ==> 오직 한번만 트리거를 실행시키는 방법
            ==> 보안 기능의 트리거
            
        - 행레벨(Row Level) 트리거
            ==> 데이터가 복수 개의 행일 때 각 행의 대해 트리거를 발생시키는 방법
            ==> 감시 기능의 트리거
            ==> 컬럼의 각 데이터 생이 변경될 때마다 실행
            ==> 실제 그 데이터 행의 값을 제어할 수 있는 트리거
            ==> 실제 값을 수정, 변경 또는 저장하기 위해 사용
            ==> 행 트리거에서 실제 데이터를 제어하기 위해 사용하는 인자
                  a) : old
                  b) : new
            ==> SQL문에 따른 사용 방법
                  a) INSERT문의 경우 : 입력할 데이터의 값이 ":new.컬럼이름"에 저장
                  b) UPDATE문의 경우 : 변경 전에는 ":old.컬럼이름"에 저장되고, 새로운 데이터 값은 ":new.컬럼이름"에 저장
                  c) DELETE문의 경우 : 삭제하는 컬럼값이 "old.컬럼이름"에 저장
    
      3) 트리거 타이밍
        - before 타이밍
          ==> 어떤 테이블에 어떤 트리커 이벤트문이 실행될 때
                해당 문장이 실행되기 전에 트리거가 가지고 있는 
                begin~end 문장이 먼저 실행됨
                
        - after 타이밍
        
      4) 형식
              CREATE OR REPLACE TRIGGER t_insert
         --> timing
         --> event1[or event2]
         --> on {tablename}
         --> 유형(statement or row)
              DECLARE
         --> 변수선언     
              BEGIN
         --> trigger body
         --> 바인드 변수
              END;
      
      5) 오라클 트리거 사용범위
        - DB테이블 생성과정에서 참조 무결성, 데이터 무결성등의 복잡한 제약 조건을 생성하는 경우
        - DB 테이브르이 데이터에 생기는 작업의 감시, 보완
        - DB 테이블에 생기는 변화에 따라 필요한 다른 프로그램을 실행하는 경우      
                 
      6) 트리거 이벤트
        - INSERT
        - DELETE
        - UPDATE
        
        
*/

DROP TABLE 상품 CASCADE CONSTRAINTS;
CREATE TABLE 상품(
  상품코드    CHAR(6)  PRIMARY KEY,
  상품명       VARCHAR2(20)  NOT NULL,
  제조사       VARCHAR2(20),
  소비자가격 NUMBER,
  재고수량    NUMBER DEFAULT 0
);

DROP TABLE 입고 CASCADE CONSTRAINTS;	
CREATE TABLE 입고(
  입고번호     NUMBER PRIMARY KEY,
  상품코드     CHAR(6),
  입고일자     CHAR(8),
  입고수량     NUMBER,
  입고단가     NUMBER,
  입고금액     NUMBER
);

DROP TABLE 출고 CASCADE CONSTRAINTS;
CREATE TABLE 출고(
  출고번호    NUMBER PRIMARY KEY,
  상품코드    CHAR(6),
  출고일자    CHAR(8),
  출고수량    NUMBER,
  출고단가    NUMBER,
  출고금액    NUMBER
);


INSERT INTO 상품 VALUES('A00001', '세탁기','사성',500,0);
INSERT INTO 상품 VALUES('A00002', '냉장고','HG',1000,0);
INSERT INTO 상품 VALUES('A00003', '노트북','HP',500,0);
INSERT INTO 상품 VALUES('A00004', '스마트폰','사성',900,0);
INSERT INTO 상품 VALUES('A00005', 'TV','사오미',400,0);
COMMIT;

SELECT * FROM 상품;

-- 재고 수량 갱신(입고) 트리거
CREATE OR REPLACE TRIGGER t_insert
  AFTER INSERT ON 입고    -- '입고' 테이블에 입력하고 나서 트리거 실행.
  FOR EACH ROW             -- FOR EACH ROW => 행 트리거 생성.
  
  DECLARE
    v_cnt   NUMBER;
    v_m     VARCHAR2(20);
    v_g     VARCHAR2(20);
BEGIN
  -- trigger body
  -- 바인드 변수
  
  SELECT 제조사,상품명 INTO v_m,v_g FROM 상품
  WHERE 상품코드=:NEW.상품코드;
  
  UPDATE 상품 SET 재고수량=재고수량+:NEW.입고수량
  WHERE 상품코드=:NEW.상품코드;
END;
/

SELECT * FROM 입고;
SELECT * FROM 상품;

INSERT INTO 입고 VALUES (1, 'A00001', '20161118',10,500,5000);
INSERT INTO 입고 VALUES (2, 'A00002', '20161118',20,1000,20000);
COMMIT;

-- 입고 수량 수정 트리거
CREATE OR REPLACE TRIGGER t_update
  AFTER UPDATE ON 입고
  FOR EACH ROW
BEGIN
  UPDATE 상품 SET 재고수량=재고수량+(-:OLD.입고수량+:NEW.입고수량)
  WHERE 상품코드=:NEW.상품코드;
END;
/

UPDATE 입고 SET 입고수량=3 WHERE 입고번호=1;
COMMIT;



CREATE OR REPLACE TRIGGER t_output_insert
  AFTER INSERT ON 출고
  FOR EACH ROW
BEGIN
  UPDATE 상품 SET 재고수량=재고수량-:NEW.출고수량
  WHERE 상품코드=:NEW.상품코드;
END;
/

INSERT INTO 출고 VALUES(1,'A00001','20161118', 2, 500, 1000);
COMMIT;

SELECT * FROM 입고;
SELECT * FROM 출고;
SELECT * FROM 상품;