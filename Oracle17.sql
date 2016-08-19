-- 2016.08.19 DDL(데이터 정의 언어)

-- SQL
  1) DQL(SELECT) ***
  2) DML(INSERT, UPDATE, DELETE)
  3) TCL(COMMIT, ROLLBACK)
  4) DCL(GRANT, REVOKE) ==> GRANT TO scott
  5) DDL(CREATE, ALTER, DROP)

-- SQL로 생성할 수 있는 것
  - TABLE, VIEW, SEQUENCE, INDEX, PRCEDURE, FUNCTION, TRIGGER, PACKAGE

-- TABLE : 데이터를 저장하는 공간
  1) 이름 부여
    - 알파벳, 한글로 시작 (30자 이내)
    - 대소문자 구분이 없음 (단, 실제 저장은 대문자로 됨 ==> 가독성을 위해 쿼리문 작성 시는 소문자로 사용)
    - 숫자 사용이 가능 (단, 맨 앞에 사용하는 것은 금지)
    - 특수문자 사용 가능 (_,$,#)
    - 공백은 허용하지 않는다 ==> Ex) my Emp(X)
    - 같은 계정으로 중복된 이름의 테이블 생성은 금지

  2) 컬럼(멤버변수) 선언
    - 자바 : 데이터형 변수명 ==> String id;
    - 오라클 : 컬럼명 데이터타입 ==> id VARCHAR2(30)

  3) 테이블 생성 형식
    : CREATE TABLE table명(
        컬럼명 테이터타입 [제약조건],
        컬럼명 테이터타입 [제약조건],
        컬럼명 테이터타입 ,......
        [제약조건], ==> 제약조건을 마지막에 한번에 정의할 수도 있음
      );

     EX) dept 테이블 생성
     ==> deptno 숫자(2)
         dname 문자(20)
         loc 문자(20)

     ==> CREATE table dept(
          deptno NUMBER(2),
          dname VARCHAR2(20),
          loc VARCHAR2(20)
         );

     EX) emp 테이블 생성
     ==> empno 숫자(4)
         ename 문자(10)
         job 문자(9)
         mgr 숫자(4)
         hiredate 날짜
         sal 숫자(7,2)
         comm 숫자(7,2)
         deptno 숫자(2)

     ==> CREATE table emp(
          empno NUMBER(4)
          ename VARCHAR2(10)
          job VARCHAR2(9)
          mgr NUMBER(4)
          hiredate DATE
          sal NUMBER(7,2)
          comm NUMBER(7,2)
          deptno NUMBER(2)
         );

-- 생성할 수 테이블
/*
게시판 테이블, 회원가입, 영화목록, 극장정보,
시간정보, 예약정보, 장르정보, 등급정보....
 */

-- 게시판 테이블에 들어갈 컬럼
  - 게시글 번호   숫자, 중복없음, PK
  - 이름   문자, NN
  - 이메일   문자
  - 제목   문자, NN
  - 내용   문자, NN
  - 비밀번호   문자, NN
  - 작성일   날짜
  - 조회수   숫자
  =============================
  - 그룹번호   숫자
  - 그룹출력순서  숫자
  - 답변개수  숫자
  - 상위번호  숫자
  ========================================================================
                         번호   그룹번호   그룹출력순서   공백   답변개수 상위번호(직접적인 상위)
  ========================================================================
  AAAAAA                  1       1          1        0       3       0
    =>OOOOOO              8       1          2        1       0       1
    =>BBBBBB              2       1          3        1       1       1
        =>CCCCCC          3       1          4        2       0       2
    =>DDDDDD              4       1          5        1       1       1
        =>KKKKKK          7       1          6        2       0       2
  EEEEEE                  5       2          1        0       1       0
    =>FFFFFF              6       2          2        1       0       1
  =========================================================================