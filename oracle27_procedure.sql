-- 2016.11.08 PL/SQL
/*

  #수업 내용 중에 꼭 정리해두어야 하는 내용
  
  1. JAVA  
    1) 객체
    2) 오버로딩/오버라이딩
    3) 추상클래스 /인터페이스
    4) 오류처리(예외처리)
    5) 트랜잭션
    6) 은닉화/캡슐화
    7) 상속/포함
    8) 패턴(싱글턴, 팩토리)
  
  2. SQL : 오라클 버전 ==>9i, 10g, 11g, 12c [ i(internet), g(grid), c(component = i+g)]
  
    1) KEY (UNIQUE)
    2) PROCEDURE, FUNCTION, TRIGGER
    3) TRANSACTION
  
  #JSP : MVC
  
  #SPRING : IOC, 컨테이너, DI, AOP  
  
  #기타 : 빅데이터, 인공지능 등
  
*/

/*
   #SQL 명령어
    
    DQL : SELECT * | column1,....
             FROM 테이블 
            [
                WHERE
                GROUP BY
                HAVING
                ORDER BY
            ]
            ==> JOIN, SUBQUERY
                  ====
                  INNER JOIN,   OUTER JOIN(INNER JOIN +@)
                  ==========   ===========
                  EQUI_JOIN     LEFT OUTER JOIN
                  
            ==> 연산자
                  BETWEEN ~ AND
                  LIKE
                  IN
                  IS NULL, IS NOT NULL
    
    DML : INSERT, UPDATE, DELETE
             INSERT INT table명 VALUES(....)
             UPDATE table명 SET
             변경
             WHERE
             DELETE FROM table명 WHERE~
    
    DDL : CREATE, DROP, ALTER(ADD, MODIFY, DROP)
             RENAME, TRUNCATE
    
    DCL : GRANT, REVOKE
    
    TCL : COMMIT, ROLLBACK
*/

/*
   #오라클
    1. PL / SQL
        1) 용어
          - Procedural Language / Structured Query Language
          - 데이터베이스 응용프로그램 작성하는데 사용하는 오라클 SQL 전용 언어.
          - 변수, 제어, 입출력 등의 프로그래밍 기능 추가
          
        2) 구조
          - 선언부(DECLARE) 
              변수 선언
          
          - 실행부, 구현부 
              BEGIN 
               SQL문장 구현
              END
           
           - 예외처리부(EXCEPTION) : 생략 가능
        
        3) 종류
          - 익명 블록 : Anonymous PL/SQL Block
                           일회성으로 사용할 경우 많이 사용
          - 저장된 블록 :  Stored PL/SQL Block
                              서버에서 파싱해서 저장해 놓고
                              주기적으로 반복해서 사용할 경우
                              ==> 서브 프로그램, 프로그램 단위
      
        4) 변수 선언 방법
          - 스칼라 변수 선언 
              : id VARCHAR2(10)
          - 기존의 데이터형 읽기 (=column 단위)
              : empno, emp.empno%TYPE
          - ROW 단위
              : emp emp%ROWTYPE
          - 사용자 정의 : RECODE
          - 전체 데이터 모으기 : CURSOR
        
        5) 제어문
          - 조건문 : if~else
          - 반복문 : FOR WHILE LOOP
          - 
          
    2. PROCEDURE
    3. TRIGGER
*/

SET SERVEROUTPUT ON; 
-- 처리된 문장을 화면에 표시

DECLARE                         -- 선언부 시작 됨
  vno       NUMBER(4);       -- db에서 수행된 결과값을
  vname   VARCHAR2(10);    -- 저장할 변수 2개 선언 함
  
BEGIN                             -- 실행부 시작됨
  SELECT empno, ename INTO vno, vname FROM emp WHERE empno=7900;

  DBMS_OUTPUT.PUT_LINE(vno||'        '||vname);
END;                              -- 실행부 끝남
/                                    -- PL/SQL 실행

DECLARE                       
  vempno       emp.empno%TYPE;       
  vename         emp.ename%TYPE;
  vjob            emp.job%TYPE;

BEGIN 
  SELECT empno, ename, job INTO vempno, vename, vjob FROM emp WHERE empno=7788;
  
  DBMS_OUTPUT.PUT_LINE('******** 결과 *********');
  DBMS_OUTPUT.PUT_LINE('사번 : ' ||vempno);
  DBMS_OUTPUT.PUT_LINE('이름 : ' ||vename);
  DBMS_OUTPUT.PUT_LINE('직위 : ' ||vjob);
END;
/

ACCEPT pno PROMPT '사번:' 
-- '사번 :' 의 값을 받아서 pno에 설정하겠다
DECLARE
  vemp      emp%ROWTYPE;
  vempno   emp.empno%TYPE := &pno;    
-- pno에 저장된 값을 empno에 삽입하겠다
BEGIN
  SELECT * INTO vemp FROM emp WHERE empno=vempno;
  
  DBMS_OUTPUT.PUT_LINE('******** 결과 *********');
  DBMS_OUTPUT.PUT_LINE('사번 : ' ||vemp.empno);
  DBMS_OUTPUT.PUT_LINE('이름 : ' ||vemp.ename);
  DBMS_OUTPUT.PUT_LINE('직위 : ' ||vemp.job);
  DBMS_OUTPUT.PUT_LINE('입사일 : ' ||vemp.hiredate);
  DBMS_OUTPUT.PUT_LINE('급여 : ' ||vemp.sal);
END;
/

DECLARE
--VO 선언
  TYPE edsRecord is RECORD(
    empno     emp.empno%TYPE,
    ename     emp.ename%TYPE,
    job          emp.job%TYPE,
    dname     dept.dname%TYPE,
    loc         dept.loc%TYPE,
    grade     salgrade.grade%TYPE
  );

-- edsRecord eds=new edsRecord(); 생성
eds edsRecord;

BEGIN 
  SELECT empno, ename, job, dname, loc, grade INTO eds FROM emp, dept, salgrade
  WHERE emp.deptno=dept.deptno AND sal BETWEEN losal AND hisal
  AND empno=7788;
  
   DBMS_OUTPUT.PUT_LINE('******** 결과 *********');
   DBMS_OUTPUT.PUT_LINE('사번 : '||eds.empno);
   DBMS_OUTPUT.PUT_LINE('이름 : '||eds.ename);
   DBMS_OUTPUT.PUT_LINE('직위 : '||eds.job);
   DBMS_OUTPUT.PUT_LINE('부서 : '||eds.dname);
   DBMS_OUTPUT.PUT_LINE('근무지 : '||eds.loc);
   DBMS_OUTPUT.PUT_LINE('등급 : '||eds.grade);
END;
/
  
/*
  #조건문
    IF(조건문) THEN
      SQL 문
    END IF
*/  
DECLARE 
  vempno NUMBER(4);
  vename VARCHAR2(20);
  vdeptno NUMBER(2);
  vdname VARCHAR2(20) :=NULL;

BEGIN 
  SELECT empno, ename, deptno INTO vempno, vename, vdeptno FROM emp
  WHERE empno=7782;
  IF (vdeptno=10) THEN
    vdname := '개발부';
  END IF;
  IF (vdeptno=20) THEN
    vdname := '총무부';
  END IF;
  IF (vdeptno=30) THEN
    vdname := '영업부';
  END IF;
  IF (vdeptno=40) THEN
    vdname := '기획부';
  END IF;
  
   DBMS_OUTPUT.PUT_LINE('******** 결과 *********');
   DBMS_OUTPUT.PUT_LINE('사번 : '||vempno);
   DBMS_OUTPUT.PUT_LINE('이름 : '||vename);
   DBMS_OUTPUT.PUT_LINE('부서명 : '||vdname);
END;
/

/*
  #조건문
    IF(조건문) THEN
      SQL 문
    ELSIF(조건문) THEN
      SQL 문
    ELSIF(조건문) THEN
      SQL 문
    ELSIF(조건문) THEN
      SQL 문
    END IF
*/  
DECLARE 
  vempno NUMBER(4);
  vename VARCHAR2(20);
  vdeptno NUMBER(2);
  vdname VARCHAR2(20) :=NULL;

BEGIN 
  SELECT empno, ename, deptno INTO vempno, vename, vdeptno FROM emp
  WHERE empno=7782;
  
  IF (vdeptno=10) THEN
    vdname := '개발부';
  ELSIF (vdeptno=20) THEN
    vdname := '총무부';
  ELSIF (vdeptno=30) THEN
    vdname := '영업부';
  ELSIF (vdeptno=40) THEN
    vdname := '기획부';
  END IF;
  
   DBMS_OUTPUT.PUT_LINE('******** 결과 *********');
   DBMS_OUTPUT.PUT_LINE('사번 : '||vempno);
   DBMS_OUTPUT.PUT_LINE('이름 : '||vename);
   DBMS_OUTPUT.PUT_LINE('부서명 : '||vdname);
END;
/


-- IF ~ ELSE

DECLARE
  vempno  NUMBER(4);
  vename  VARCHAR2(20);
  vcomm   emp.comm%TYPE;

BEGIN 
  SELECT empno, ename, comm INTO vempno, vename, vcomm FROM emp
  WHERE empno=7654;
  IF(vcomm>0) THEN
    DBMS_OUTPUT.PUT_LINE(vename||'님의 성과급은 '||vcomm||'입니다.');
  ELSE 
    DBMS_OUTPUT.PUT_LINE(vename||'님의 성과급은 없습니다.');
  END IF;
END;
/









