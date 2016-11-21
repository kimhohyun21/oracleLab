/*
  # PL/SQL의 기본 구조
    - 소스프로그램의 기본 단위 : 블록
    - 이름 : 블록의 명칭, 생략시 익명의 블록이 됨
    - 선언부, 실행부, 예외처리부로 구성
    
    1. 선언부
      1) 개념
        - DECLARE로 시작 
        - 실행부와 예외처리부에서 사용하는 각종 변수,상수, 커서 등을 선언
        - 변수 선언과 각 문장 끝에 반드시 세미콜론(;)을 찍어야 함
        
    2. 실행부
      1) 개념
        - 실제 로직을 처리하는 부분
        - 각 종 문장(일반 SQL문, 조거문, 반복문)
        - DML문만 사용 가능
  
    3. 예외처리부 
      1) 개념
        - EXCEPTION절로 시작
        - 실행부에서 로직 처리 중 오류 발생시 처리 내용 기술
        - 생략 가능
      
      2) 대응 범위
        - 컴파일 시 발생하는 오류 대응 ==> 문법오류
        - 런타임 오류 ==> 예외(EXCEPTION)
      
      3) 예외 처리 구문
          EXCEPTION WHEN 예외명 1 THEN 예외처리 구문1
                           WHEN 예외명 2 THEN 예외처리 구문2
                            ......
                            WHEN OTHERS THEN 예외처리 구문n
      4) 시스템 예외 
        - 미리 정의된 예외
          ==> NO_DATA_FOUND : SELECT INTO시 데이터가 한건도 없는 경우 (ORA-01403)
          ==> TOO_MANY_ROWS : SELECT INTO시 결과가 한 로우 이상일 때 (ORA-01403)
                .......
*/
/*
SET SERVEROUTPUT ON;

ACCEPT pno PROMPT '사번: '
DECLARE
  vempno        emp.empno%TYPE:=&pno;
  vname         emp.ename%TYPE;
BEGIN
  SELECT ename INTO vname FROM emp WHERE empno LIKE '%'||vempno||'%';
  DBMS_OUTPUT.PUT_LINE('이름:'||vname);
EXCEPTION 
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('사람을 찾을 수 없습니다.');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('두 명 이상의 사원이 존재 합니다.');
END;
/
*/
/*
  # PROCEDURE
    : 지정된 처리를 실행하는 서브 프로그램의 한 유형
    
  # PACKAGE(패키지)
    1. ORACLE PACKAGE
    2. 패키지는 연관성이 높은 함수나 프로시저를 하나의 그룹으로 묶어두는 개념
    3. 패키지 선언부와 몸체부로 구분  
      1) 패키지 선언부 : 해당 패키지에서 사용할 함수나 프로시저 변수 등에 대한 정의를 선언,
        CREATE [OR REPLACE] PACKAGE package_name
        IS | AS
          public type and item declarations
          subprogame bodies
        END package_name;
          
      2) 패키미 몸체부 : 선언된 함수나 프로시저 등이 실제 구현되는 부분.
        CREATE [OR REPLACE] PACKAGE BODY package_name
        IS | AS
          public type and item declarations
          subprogame bodies
        END package_name;
        
    4. 패키지 실행
    5. 패키지 삭제
      DROP PACKAGE pakage_name;
      DROP PACKAGE BODY pakage_name;
          
  3. FUNCTION
  4. TRIGGER

*/
-- 패키지 사용 예
-- emp 테이블에서 총 급여의 합계와 평균 급여를 구하는 패키지를 작성하라
-- 패키지 선언부 : emp_sum, emp_avg 프로시저
/*
-- 선언부
CREATE OR REPLACE PACKAGE emp_total
AS 
  PROCEDURE emp_sum;
  PROCEDURE emp_avg;
END emp_total;
/
*/
/*
-- 몸체부
CREATE OR REPLACE PACKAGE BODY emp_total
AS 
  PROCEDURE emp_sum
  IS 
    CURSOR emp_total_sum IS
      SELECT COUNT(*), SUM(NVL(sal, 0)) FROM emp;
    total_num NUMBER;
    total_sum NUMBER;
  BEGIN
    OPEN emp_total_sum;
    FETCH emp_total_sum INTO total_num, total_sum;
    DBMS_OUTPUT.PUT_LINE('총 인원수 :'||total_num||', 급여의 합계'||total_sum);
  END emp_sum; -- procedure 끝
  PROCEDURE emp_avg
  IS 
    CURSOR emp_total_avg IS
      SELECT COUNT(*), AVG(NVL(sal, 0)) FROM emp;
    total_num NUMBER;
    total_avg NUMBER;
  BEGIN
    OPEN emp_total_avg;
    FETCH emp_total_avg INTO total_num, total_avg;
    DBMS_OUTPUT.PUT_LINE('총 인원수 :'||total_num||', 급여의 평균'||total_avg);
  END emp_avg; -- procedure 끝
END emp_total; -- 패키지 끝
/
*/
/*
CREATE OR REPLACE PACKAGE pkg_board
IS
  PROCEDURE boardListData(
    pStart        board.no%TYPE,
    pEnd         board.no%TYPE,
    pResult      OUT  SYS_REFCURSOR  
  );
  PROCEDURE  boardTotalPage(
    pNumber   OUT   board.no%TYPE
  );
  PROCEDURE  boardInsert(
    pName    board.name%TYPE,
    pSub      board.subject%TYPE,
    pCont     board.content%TYPE,
    pPwd      board.pwd%TYPE
  );
  PROCEDURE boardContentData(
    pNo             board.no%TYPE,
    pResult OUT  SYS_REFCURSOR
  );
  PROCEDURE boardUpdate(
    pNo             board.no%TYPE,
    pName          board.name%TYPE,
    pSubject        board.subject%TYPE,
    pContent        board.content%TYPE,
    pPwd             board.pwd%TYPE,
    pResult           OUT VARCHAR2
  );
  PROCEDURE boardUpdateData(
    pNo             board.no%TYPE,
    pResult OUT  SYS_REFCURSOR
  );
  PROCEDURE boardDelete(
    pNo               board.no%TYPE,
    pPwd              board.pwd%TYPE,
    pResult           OUT board.name%TYPE
  );
END pkg_board;
/ 
*/

CREATE OR REPLACE PACKAGE BODY pkg_board
AS
  PROCEDURE  boardListData(
    pStart        board.no%TYPE,
    pEnd         board.no%TYPE,
    pResult      OUT  SYS_REFCURSOR  
  )
  IS  
  BEGIN
    OPEN pResult FOR
      SELECT no, subject, name, regdate, hit, num
      FROM (SELECT no, subject, name, regdate, hit, Rownum as num
      FROM (SELECT no, subject, name, regdate, hit 
      FROM board ORDER BY no DESC))
      WHERE num BETWEEN pStart AND pEnd;
  END boardListData;
  
  PROCEDURE  boardTotalPage(
    pNumber   OUT   board.no%TYPE
  )
  IS  
  BEGIN
    SELECT CEIL(COUNT(*)/10) INTO pNumber FROM board;
  END boardTotalPage;
  
  PROCEDURE  boardInsert(
    pName    board.name%TYPE,
    pSub      board.subject%TYPE,
    pCont     board.content%TYPE,
    pPwd      board.pwd%TYPE
  )
  IS  
  BEGIN
    INSERT INTO Board (no, name, subject, content, pwd, regdate, hit)VALUES (
      (SELECT NVL(MAX(no)+1, 1) FROM board), 
      pName, pSub, pCont, pPwd, SYSDATE, 0
    );
    COMMIT;
  END boardInsert;
  
  PROCEDURE boardContentData(
    pNo             board.no%TYPE,
    pResult OUT  SYS_REFCURSOR
  )
  IS
  BEGIN
    UPDATE board SET hit=hit+1 WHERE no=pNo;
    COMMIT;
    
    OPEN pResult FOR
      SELECT no, name, subject, content, regdate, hit FROM board WHERE no=pNo;
  END boardContentData;
  
  PROCEDURE boardUpdate(
    pNo             board.no%TYPE,
    pName          board.name%TYPE,
    pSubject        board.subject%TYPE,
    pContent        board.content%TYPE,
    pPwd             board.pwd%TYPE,
    pResult           OUT VARCHAR2
  )
  IS
    db_pwd          board.pwd%TYPE;
  BEGIN
      SELECT pwd INTO db_pwd FROM board WHERE no=pNo;
      IF(pPwd=db_pwd) THEN
        pResult := 'true';
        UPDATE board SET name=pName, subject=pSubject, content=pContent WHERE no=pNo;
        COMMIT;
      ELSE
        pResult := 'false';
      END IF;
  END boardUpdate;
  
  PROCEDURE boardUpdateData(
    pNo             board.no%TYPE,
    pResult OUT  SYS_REFCURSOR
  )
  IS 
  BEGIN
     OPEN pResult FOR
      SELECT no, name, subject, content FROM board WHERE no=pNo;
  END boardUpdateData;
  
  PROCEDURE boardDelete(
    pNo               board.no%TYPE,
    pPwd              board.pwd%TYPE,
    pResult           OUT board.name%TYPE
  )
  IS
    db_pwd          board.pwd%TYPE;
  BEGIN
      SELECT pwd INTO db_pwd FROM board WHERE no=pNo;
      IF(pPwd=db_pwd) THEN
        pResult := 'true';
        DELETE FROM board WHERE no=pNo;
      ELSE
       pResult := 'false';
      END IF;
  END boardDelete;
END pkg_board;
/  



























































