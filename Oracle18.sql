-- 2016.08.19 TABLE

-- TABLE (2차원) => ROW + COLUMN
-- TABLE 작성방법
   1) 복사 (기존의 테이블)
   2) 직접 생성(*)
      - 데이터타입
        => 문자형
           CHAR : CHAR(n) n=> 1~2000byte 고정메모리
                  ==> 메모리의 낭비가 발생
                      Ex) CHAR(4) => 'A' => 메모리의 크기(4)
                          CHAR(4) => 'AB' => 메모리의 크기(4)
                          CHAR(4) => 'ABC' => 메모리의 크기(4)
                          CHAR(4) => 'ABCD' => 메모리의 크기(4)

           VARCHAR2 : VARCHAR2(n) n => 1~4000byte 가변메모리
                      ==> 메모리의 낭비가 없음
                          Ex) VARCHAR2(4) => 'A' => 메모리의 크기(1)

           CLOB(4GB) : 대용량 문자 => 가변메모리

        => 숫자형
           NUMBER(4) ==> 0~9999
           NUMBER(7,2) ==> 9999.99

        => 날짜형
           DATE => 날짜 저장 'YY/MM/DD'
           TIMESTAMP

        => 기타형
           BLOB(4GB) : 바이너리 데이터
           BFILE(4GB) : 파일형태 저장 (사진, 동영상)

      - 제약조건
        => PRIMARY KEY : 기본키 ==> 중복없는 데이터 (UNIQUE + NOT NULL)
        => FOREIGN KEY : 외래키(참조키)
        => NOT NULL : 반드시 값 입력
        => UNIQUE : 중복이 없는 값(NULL 값 허용)
        => CHECK : 지정된 데이터만 입력
        => DEFAULT : 입력값이 없는 경우 자동 첨부

-- 기존 테이블 삭제
   DROP TABLE myEmp;

-- 테이블 신규 생성 : 복사
   CREATE TABLE myEmp AS SELECT empno, ename, job, hiredate, sal FROM emp;
   SELECT * FROM myEmp;

-- emp 테이블 구성 분석
/*
   empno : 사번 => NUMBER PRIMARY KEY
   ename : 이름 => VARCAHR2 NOT NULL
   job : 직위 => VARCHAR2 CHECK('사장', '부장', '대리', '사원')
   mgr : 사수번호 => NUMBER (NULL 허용)
   hiredate : 입사일 => DATE DEFAULT
   sal : 급여 => NUMBER NOT NULL
   comm : 성과급 => NUMBER (NULL 허용)
   deptno : 부서번호 => NUMBER NOT NULL FOREIGN KEY CHECK(10,20,30,40)
*/

-- 기존 테이블 삭제
   DROP TABLE myEmp;

-- 테이블 신규 생성 : 직접 생성
   CREATE TABLE myEmp(
     empno NUMBER(4) PRIMARY KEY,
     ename VARCHAR2(34) NOT NULL,
     job VARCHAR2(20) CHECK(job IN('부장', '대리', '사원')),
     mgr NUMBER(4),
     hiredate DATE DEFAULT SYSDATE,
     sal NUMBER(7,2) NOT NULL,
     comm NUMBER(7,2),
     deptno NUMBER(2) NOT NULL  CHECK(deptno IN(10,20,30,40))
   );

   SELECT * FROM myEmp;

-- 테이블 수정
   -- 컬럼 추가 :
   ALTER TABLE myEmp ADD dname VARCHAR2(20) NOT NULL;
   -- 컬럼 삭제
   ALTER TABLE myEmp DROP COLUMN dname;
   -- 컬럼명 수정
   ALTER TABLE myEmp RENAME COLUMN empno TO sabun;
   -- 컬럼속성 수정
   ALTER TABLE myEmp MODIFY sal NUMBER(7);
   ALTER TABLE myEmp MODIFY comm NUMBER(10);

-- 회원가입 테이블 생성
   CREATE TABLE member(
     id VARCHAR2(20) NOT NULL PRIMARY KEY,
     password VARCHAR2(10) NOT NULL,
     name VARCHAR2(34) NOT NULL,
     age NUMBER(3),
     addr VARCHAR2(100)
   );

-- 가입 날짜 추가
   ALTER TABLE member ADD regDate DATE DEFAULT SYSDATE;

-- 데이터 추가, 변경
   INSERT INTO member VALUES('aaa','1234','오해영','25','서울',SYSDATE);
   INSERT INTO member VALUES('bbb','1234','박도경','35','서울','16/08/19');
   INSERT INTO member(id,password,name,age,addr) VALUES('ccc','1234','이진상','35','경기');
   UPDATE member SET addr='인천', age=33 WHERE id='ccc';
   DELETE FROM member WHERE id='bbb'; ==> DELETE는 행단위로 진행

   SELECT * FROM member;

-- INSERT : 데이터 추가
   1) 원하는 데이터만 추가
   INSERT INTO myEmp(empno,ename,sal,hiredate,comm) VALUES(1000,'aaa',1000,'16/08/19',NULL);
   2) 전체 데이터 추가
   INSERT INTO myEmp VALUES(......);

-- UPDATE : 데이터 수정
   UPDATE myEmp SET empno=값, ename=값,....WHERE empno=값;

-- DELETE : 데이터 삭제 ==> row(튜플) 단위로 진행
   DELETE FROM emp WHERE empno=값;
