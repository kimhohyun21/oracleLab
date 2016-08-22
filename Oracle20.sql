-- 2016.8.22 CREATE TABLE 정리

데이터 저장 공간 (TABLE) : 이차원(ROW+COLUMN)
  =>COLUMN 단위

  1) 생성방법
    *복사 (기존의 테이블 복사)
    => CREATE TABLE table 명
       AS SELECT * FROM emp; => 한개 이상의 테이블 복사

    예) CREATE TABLE table 명
        AS SELECT empno,ename,job,hiredate,dname,loc,grade
        FROM emp,dept,salgrade
        WHERE emp.deptno=dept.deptno
        AND sal BETWEEN losal AND hisal;
    *직접 생성
      => CREATE TABLE table 명 (
          컬럼명 데이터형 [제약조건], =>컬럼레벨
          컬럼명 데이터형 [제약조건],
          컬럼명 데이터형 [제약조건],
          [제약조건] => 테이블레벨
        );

  2) 데이터형
    - 문자(String)
      CHAR => 1,200(BYTE): 고정(배열)
      VARCHAR2 => 1~4000(BYTE) : 가변(컬렉션)***
      CLOB => 4GB (대용량 데이터 : 빅데이터)
    - 숫자(int, double)
      NUMBER(1~38) => 정수, 실수, 생략시 14자리
    - 날짜(java.util.date)
      DATE : 날짜 저장 'YY/MM/DD'
      TIMESTAMP : 1/1000초까지 저장(DATE를 확장), 기록 경주
    - 기타 (java.io.InputStream) : 동영상, 사진, 그림, 파일
      BLOB: 4GB =>  바이너리 데이터
      BFILE : 4GB => 파일형태로 저장

  3) 제약조건
    - 테이블에 부적절한 자료가 입력되는 것ㅇ르 방지하기 위해서 여러거지 규칙을 적용해 놓는 것
    - 즉, 테이블 안에서 데이터의 성격을 정의하는 것
    - 데이터의 무결성을 유지하기 위해서 사용자가 지정할 수 있는 성질이다
    - 모든 CONSTRAINT는 데이터 사전(DATA DICTIONARY)에 저장됨
    - 제약조건은 테이블 생성할 당시에 지정할 수도 있고, 테이블 생성 후 구조변경(ALTER) 명령어를
      통해서 추가도 가능함
    - NOT NULL : 반드시 입력값이 필요함
    - UNIQUE :  유일한 값(NULL허용함)
    - PRIMARY KEY : NOT+UNIQUE => 기본키
      = 하나의 테이블에서 그 행을 유일하게 식별할 수 있는 컬럼
      = FOREIGN KEY 컬럼이 참조하는 컬럼은 반드시 PRIMARY KEY가 지정된 컬럼이어야 함
    - FOREIGN KEY : 참조키
      = 컬럼의 값이 다릉 테이블의 PRIMARY KEY컬럼인 컬럼에 대해 사용
    - CHECK : 지정된 데이터만 사용이 가능
    - DEFAULT : 입력값이 없는 경우에 자동으로 값을 채운다
