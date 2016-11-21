SET SERVEROUTPUT ON;

DECLARE
BEGIN
  FOR no In 1..9 LOOP -- FOR 문
      IF(MOD(no,2)=0) THEN
      DBMS_OUTPUT.PUT_LINE(no);
      END IF;
    END LOOP;
END;
/

/*
   #PL/SQL 
    1. 변수 선언 형식
      1) 일반 변수
        : 변수 데이터형 
          ==> empno NUMBER(4)
          
      2) 기존 컬럼 변수 사용 
        : %TYPE 
          ==> empno emp.empno%TYPE
          
      3) 전체 데이터 형 
        : %ROWTYPE 
          ==> vemp emp%ROWTYPE
          
      4) 원하는 데이터(사용자 정의)
        : RECODE
          ==> TYPE 변수명 IS RECODE(
                  empno NUMBER(4),
                  ename VARCHAR2(20)
                )
                
      5) 값지정
          : 기호 사용 :=
            ==> empno NUMBER(4) := 4000
 
    2. 제어문 
      1) IF, IF~ELSE, IF ELSIF~ELSE
      2) CASE WHEN~
      
    3. BLOCK 선언 형식
        선언부 : 변수 선언
        구현부 : SQL 구현
        예외처리부
        종료
        ===============
        DELCARE 
          변수 선언
        BEGIN
          SQL 구현
        END
   
*/

/*
    emp3 테이블에서 empno가 7900번인 사원의 
    empno, ename, sal을 조회하여 화면에 출력하시오
*/

-- 테이블 생성
CREATE TABLE emp3 AS SELECT empno, ename, sal FROM emp;
SELECT * FROM emp3;

-- PL/SQL로 데이터 조회
DECLARE
  vno       emp3.empno%TYPE;
  vname   emp3.ename%TYPE;
  vsal      emp3.sal%TYPE;
BEGIN
  SELECT empno, ename, sal INTO vno, vname, vsal FROM emp3 WHERE empno=7900;
  DBMS_OUTPUT.PUT_LINE(vno||'     '||vname||'      '||vsal);
END;
/

/*
  RECODE, ROWTYPE ==> ~VO
  CURSOR ==> List ==> ROW의 집합체

  #CURSOR 
    1. 사용 단계 
      1) CURSOR 선언
          CURSOR cur_name IS
            SELECT * FROM emp;
      
      2) CURSOR 오픈
          OPEN cur_name;
      
      3) 인출 
          FETCH cur_name;
            ==> %NOTFOUND
                  **CURSOR 상태
                      %NOTFOUND 더 이상 데이터가 없는 경우
                      %FOUND
                      %ISOPEN
                      %ROWCOUNT
      
      4) CURSOR 닫기
          CLOSE cur_name;
          
   ==> CURSOR는 ViEW와 비슷하지만 메모리에 저장 (일시적)       
*/

DECLARE 
  vempno      emp.empno%TYPE;
  vename      emp.ename%TYPE;
  vsal           emp.sal%TYPE;
  CURSOR c1 IS
    SELECT empno, ename, sal FROM emp; -- 커서 선언

BEGIN
  OPEN c1;  -- 커서 열기
  LOOP
    FETCH c1 INTO vempno, vename, vsal;    -- 커서에서 값 꺼내서 set하기
    EXIT WHEN c1%NOTFOUND;                  -- 반복문 중단 조건 커서 값이 더이상 없을 때
    DBMS_OUTPUT.PUT_LINE(vempno||'   '||vename||'   '||vsal);  -- 스크립트로 출력
  END LOOP;
END;
/

DECLARE 
  vempno    NUMBER(4);
  vename    VARCHAR2(20);
  vsal         NUMBER(7);
  
  CURSOR c1 IS 
    SELECT empno, ename, sal FROM emp WHERE deptno=20;

BEGIN
  OPEN c1;
    DBMS_OUTPUT.PUT_LINE('번호     이름      급여');
    LOOP
      FETCH c1 INTO vempno, vename, vsal;
      EXIT WHEN c1%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(vempno||'   '||vename||'   '||vsal);  
    END LOOP;
    CLOSE c1;
END;
/

/*
  2.프로시저(Procedure)
    1) 개념
      - 지정된 특정 처리를 실행하는 서브 프로그램의 한 유행.
      - 단독(standalone)으로 실행이거나 다는 프로시저, 또는 다른 도구, 앱 등에서 호출되어 실행됨.
    
    2) 생성문법
        CREATE [OR REPLACE] PROCEDURE  프로시저 이름
        [
            파라미터1 데이터 타입1
            파라미터2 데이터 타입2
            ......
        ]
        IS | AS
        PL/SQL BLOCK;
        
      3) 매개변수
        - IN : 일반변수 (입력값) 조건값, 추가, 수정, 삭제
        - OUT : 포인터 변수 (받는값)
        - INOUT : IN, OUT을 동시에 사용
*/

-- 테이블 생성
CREATE TABLE emp2 AS SELECT empno, ename, job, sal, deptno FROM emp;
SELECT * FROM emp2;

-- PROCEDURE 생성
CREATE OR REPLACE PROCEDURE  update_20
IS
BEGIN
  UPDATE emp2 SET job='TEST' WHERE deptno=20;
END;
/

-- PROCEDURE 실행
execute update_20;

DROP TABLE myAddr;
CREATE TABLE myAddr(
  no NUMBER PRIMARY KEY,
  name VARCHAR2(20) NOT NULL,
  addr VARCHAR2(100) NOT NULL,
  tel VARCHAR2(20) NOT NULL,
  gender VARCHAR2(10) CHECK(gender IN('남', '여'))
);

CREATE OR REPLACE PROCEDURE addrInsert(
  pname IN myAddr.name%TYPE,
  paddr IN myAddr.addr%TYPE,
  ptel IN myAddr.tel%TYPE,
  pgender IN myAddr.gender%TYPE
)
IS
BEGIN
  INSERT INTO myAddr VALUES(
    (SELECT NVL(MAX(no)+1, 1) FROM myAddr), 
    pname, paddr, ptel, pgender
  );
  COMMIT;
END;

EXECUTE addrInsert('서헌진', '원주', '010-1234-5678','여');

-- 새로운 Procedure 생성
CREATE OR REPLACE PROCEDURE addrAllData(
  pResult out SYS_REFCURSOR 
)
IS
BEGIN
  OPEN pResult FOR
    SELECT * FROM myAddr;
END;
/











































