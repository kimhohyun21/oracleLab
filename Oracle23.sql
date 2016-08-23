-- 2016.08.23 VIEW

-- 정의
   - 하나 이상의 기본 테이블로부터 유도되어 만들어진 가상의 테이블
   - 기본 테이블이 물리적으로 구현되어 실제로 데이터를 저장하는데 비해
     뷰는 물리적으로 구현되지는 않고, 뷰의 정의만 시스템내에 저장해두었다가
     필요시 실행 시간에 테이블 생성
   - 기본적으로 기본 테이블로부터 유도되지만 정의된 뷰가 다른뷰에 의해 사용될 수도 있음

-- 특징
   - 뷰가 정의된 키본 테이블 제거(변경)되면, 뷰도 자동적으로 제거(변경)
   - 한 번 정의된 뷰는 변경할 수 없고, 삭제 후 다시 생성해야 함
   - 뷰에 대한 정의에서는 ALTER문을 이용할 수 없음
   - 뷰는 DROP문을 사용해서 제거할 수 있음
   - 읽기 전용: read only 조건이 필요함
   - 반드시 참조하는 테이블이 한개 이상 존재함
   -

-- 장점
   1) 편리성 : 미리 정의된 뷰를 일반 테이블처럼 사용할 수 있어서 편리함
              사용자가 필요한 정보만 요구에 맞게 가공하여 뷰로 쓸수 있음.
   2) 재사용성 : 자주 사용되는 질의를 뷰로 미리 정의해 놓을 수 있음
   3) 보안성 : 데이터가 메모리에 저장되지 않음

-- 종류
   - 단순 뷰: 테이블 한개를 연결
   - 복합 뷰: 조인, 서브쿼리(두개 이상의 테이블)
   - 인라인 뷰: SELECT ~ FROM (SELECT~~) => TOP-N

-- 샘플 테이블 생성
   CREATE TABLE emp_test AS(SELECT * FROM emp);
   CREATE TABLE dept_test AS(SELECT * FROM dept);

-- 뷰생성
   CREATE VIEW emp_view AS(SELECT empno, ename,job,hiredate,sal FROM emp_test);
   SELECT * FROM emp_view;

   CREATE VIEW dept_view AS(SELECT * FROM dept_test) WITH READ ONLY; -- 읽기 전용 옵션 추가
   SELECT * FROM dept_view;

-- 뷰에 값 추가
   INSERT INTO dept_view VALUES(50,'영업부','서울'); -- read only가 아닐때 값을 추가하면 참조한 테이블에도 동시 값이 추가됨
   COMMIT;

-- 뷰삭제
   DROP VIEW dept_view;

-- 책관련 테이블
   SELECT * FROM book;
   SELECT * FROM customer;
   SELECT * FROM orders;
   DROP TABLE book CASCADE CONSTRAINTS;
   DROP TABLE customer CASCADE CONSTRAINTS;
   DROP TABLE orders CASCADE CONSTRAINTS;

   CREATE TABLE book(
      bookid NUMBER(2) PRIMARY KEY,
      bookname VARCHAR2(40),
      publisher VARCHAR2(40),
      price NUMBER(10)
   );
   INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
   INSERT INTO Book VALUES(2, '축구아는 여자', '나무수', 13000);
   INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 22000);
   INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
   INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
   INSERT INTO Book VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
   INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
   INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
   INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
   INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);
   COMMIT;

   SELECT * FROM book;

   CREATE TABLE customer(
      custid NUMBER(2) PRIMARY KEY,
      name VARCHAR2(40),
      address VARCHAR2(50),
      phone VARCHAR2(20)
   );

   INSERT INTO Customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
   INSERT INTO Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');
   INSERT INTO Customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
   INSERT INTO Customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
   INSERT INTO Customer VALUES (5, '박세리', '대한민국 대전',  NULL);
   COMMIT;

   SELECT * FROM customer;

   CREATE TABLE orders(
      orderid NUMBER(2) PRIMARY KEY,
      custid NUMBER(2) REFERENCES customer(custid),
      bookid NUMBER(2) REFERENCES book(bookid),
      saleprice NUMBER(8),
      orderdate DATE
   );

   INSERT INTO Orders VALUES (1, 1, 1, 6000, TO_DATE('2014-07-01','yyyy-mm-dd'));
   INSERT INTO Orders VALUES (2, 1, 3, 21000, TO_DATE('2014-07-03','yyyy-mm-dd'));
   INSERT INTO Orders VALUES (3, 2, 5, 8000, TO_DATE('2014-07-03','yyyy-mm-dd'));
   INSERT INTO Orders VALUES (4, 3, 6, 6000, TO_DATE('2014-07-04','yyyy-mm-dd'));
   INSERT INTO Orders VALUES (5, 4, 7, 20000, TO_DATE('2014-07-05','yyyy-mm-dd'));
   INSERT INTO Orders VALUES (6, 1, 2, 12000, TO_DATE('2014-07-07','yyyy-mm-dd'));
   INSERT INTO Orders VALUES (7, 4, 8, 13000, TO_DATE( '2014-07-07','yyyy-mm-dd'));
   INSERT INTO Orders VALUES (8, 3, 10, 12000, TO_DATE('2014-07-08','yyyy-mm-dd'));
   INSERT INTO Orders VALUES (9, 2, 10, 7000, TO_DATE('2014-07-09','yyyy-mm-dd'));
   INSERT INTO Orders VALUES (10, 3, 8, 13000, TO_DATE('2014-07-10','yyyy-mm-dd'));
   COMMIT;

   SELECT * FROM orders;
