-- 오라클 : RDBMS (관계형 데이터 베이스 : 응용프로그램 = 연결 = 메모리)
   1) 중형디비
   2) 문법 : SQL(구조화된 Query Language)

-- SQL
   1) DML (Data Management Language, 데이터 조작 언어)
      SELECT : 데이터 검색 => JOIN (테이블을 연결), SUBQUERY(쿼리문 안에 쿼리문, 쿼리연결)
      INSERT : 데이터 추가
      UPDATE : 데이터 수정
      DELETE : 데이터 삭제

   2) DDL (Data Definition Language, 데이터 정의 언어)
      CREATE   : 생성 (TABLE, SEQUENCE, VIEW, INDEX, PROCEDURE, TRIGGER)
      ALTER    : 수정
               - ADD
               - MODIFY
      DROP     : 삭제
      TRUNCATE : 잘라내기
      RENAME   : 이름변경

   3) DCL (Data Control Language, 데이터 제어 언어)
      GRANT  : 권한부여
      REVOKE : 권한해제

   4) TCL (Transaction Control Language, 트랜젝션(일괄처리) 제어 언어)
      COMMIT : 정상적으로 처리
      ROLLBACK : 비정상 종료 ==> 기존의 명령어를 삭제

-- 데이터 저장 => 저장하는 장소 : 테이블
   테이블 : ROW+COLUMN => 이차원구조
   -------------------------------------
       id        name         gender    ==> column (자바의 멤버변수 : ~ VO)
   -------------------------------------
       aaa       정도전         남자      ==> row (자바의 객체 : ~ VO 클래스)
   -------------------------------------
       bbb        최씨         여자       ==> row (자바의 객체)
   -------------------------------------
   ==> 데이터 검색
       형식)
          SELECT * FROM table명 => 모든 데이터를 추출
          SELECT id, name FROM table명 => 원하는 데이터 검색

          SELECT * | (column1, column2,....)
          FROM table 명
          [
            WHERE 조건절
            GROUP BY 그룹 컬럼명
            HAVING 조건절 (그룹)
            ORDER BY 컬럼명 ASC | DESC (오름차순 | 내림 차순)
          ]

          1) 별칭 : 컬럼명 변경, 테이블명 변경
             ~~ FROM emp e (SELECT문에서 테이블 명 뒤에 한칸 띄우고 지정하는 문자가 별칭이 됨)
             SELECT empno "사번"~~ (SELECT문에서 컬럼명 뒤에 한칸 띄우고 "별칭"을 해주면 컬럼명의 별칭이 됨)
             SELECT empno as sabun ~~ (SELECT문에서 컬럼명 뒤에 한칸 띄우고 as 별칭 해주면 컬럼면의 별칭이 됨)

          2) 문자열 결합 : JAVA : + / SQL : ||
             ename || job

-- 연습용으로 지원하는 테이블

   emp : 사원관리
         column
         - empno (사번)
         - ename (이름)
         - job (직위)
         - mgr (사수)
         - hiredate (입사일)
         - sal (급여)
         - comm (성과급)
         - deptno (부서번호)

   dept : 부서관리
          column
          - deptno (부서번호)
          - dname (부서명)
          - loc (근무지)

-- 테이블 구조 확인 (DESC 테이블명, DataGrip에서는 인식이 안되는 명령어)
   SELECT * FROM emp; -- 전체 데이터를 가지고 온다.
   SELECT empno, ename, hiredate FROM emp;
   SELECT ename, comm FROM emp; -- 데이터가 없는 값은 null로 표기 됨 (SQLPLUS에서는 표기 안됨)

-- SQL 문법적 특징
   1) 문장이 종료되면 ;를 사용한다
   2) 기본적으로 대소문자 구문하지 않는다 : 통상적으로 가독성을 위해서 명령어는 대문자로 써주고 사용자 정의명칭은 소문자로 작성
   3) 대소문자를 구분 ==> 데이터 값
   4) 비절차적인 언어다.

   SELECT * FROM emp;
   SELECT empno, ename FROM emp;

-- 별칭 연습
   SELECT empno "사번", ename "이름", job "직위" FROM emp;
   SELECT empno sabun, ename name FROM emp;
   SELECT empno 사번, ename 이름 FROM emp;
   SELECT empno AS sabun, ename AS name FROM emp;

-- 문자열 결합 연산자 "||" ==>  OR
   SELECT ename || '님의 직위는 ' || job || '입니다.' FROM emp;

-- 입력이 가능한 연산자 "&" ==> java의 scanner와 같은 기능, SQLPLUS에서만 사용 가능
   /*
   SQL> SELECT empno, ename FROM emp WHERE empno=&sabun;
   sabun의 값을 입력하십시오: 7499
   구   2: WHERE empno=&sabun
   신   2: WHERE empno=7499

        EMPNO ENAME
   ---------- ----------
        7499 ALLEN
   */