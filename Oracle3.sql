-- 내장 함수
   단일행 함수 | 집합 함수
   =========


-- 문자 함수
   1) 문자 변환
      = UPPER : 대소문자 변환 예) UPPER('abc') => ABC
      = LOWER : 소문자 변환 예) LOWER('ABC') => abc
      = INITCAP : 이니셜 변환, 문자열의 첫번째 알파벳을 대문자로 변환 예) INITCAP('abc def') => Abc Def

   2) 제어
      = ***** TRIM : 좌우 삭제
              대상문자열의 양쪽에 지정 문자를 넣으면 그 문자를 삭제
              문자열만 넣으면 공백제거

      = LTRIM : 왼쪽을 삭제
              대상문자열의 왼쪽부터 지정한 문자들을 삭제

      = RTRIM : 오른쪽을 삭제
              대상문자열의 오른쪽부터 지정한 문자열을 삭제

    3) 제어(추가)
      = LPAD : 앞의 원하는 문자 추가
              대상 문자열의 왼쪽부터 지정한 자리수까지 지정한 문자로 채움

      = ****** RPAD : 뒤에 원하는 문자 추가 (ID찾기, PWD 찾기)
              대상 문자열의 오른쪽부터 지정한 자리수까지 지정한 문자로 채움

    4) 문자 위치 확인, 문자 분해
      = ***** INSTR
      = ***** SUBSTR => SUBSTR(문자열, 시작위치, 개수)

    5) LENGTH : 대상 문자열의 글자수를 반환
       LENGTHB : Byte로 문자열의 글자수 반환

-- 숫자 함수
    1) 반올림 ROUND => ROUND(숫자, m) : 숫자 반올림, m은 반올림 기준 자릿수
                      ROUND(실수, 자릿수) 자릿수+1에서 반올림 실행
                      ROUND(5.36, 1) => 5.40
                      ROUND(15.378, 2) => 15.38
                      ROUND(15.378, 0) => 15

    2) 올림 CEIL
    3) 버림 TRUNC
    4) 나머지 MOD

-- 날짜 함수
    1) 오늘 날짜 => YY/MM/DD : ***** SYSDATE
    2) 요일 => NEXT_DAY(날짜, 요일)
    3) 마지막 날짜 => LAST_DAY(날짜)
    4) 개월수 => MONTH_BETWEEN(최근, 이전)
    5) 개월을 추가 후 날짜 계산 => ADD_MONTHS

--  변환 함수*******
    1) TO_CHAR : 문자변환
    2) TO_NUMBER : 숫자변환
    3) TO_DATE : 날짜변환
-- 기타 함수
    1) ***** NULL을 대체 => NVL(대상, 변환값)
    2) DECODE => switch~CASE
    3) ***** CASE => 다중 if문

-- 문자 변환 실습 : SELECT 뒤에, WHERE 조건
   SELECT ename, LOWER(ename), UPPER(ename), INITCAP(ename) FROM emp;
   SELECT ename, hiredate, sal FROM emp WHERE ename=UPPER('king');

-- 제어 (공백문자 제거, 원하는 문자 제거)
   SELECT ename, LTRIM(ename, 'A') FROM emp;
   SELECT LTRIM('aaabbbaaa', 'a') FROM DUAL;
   SELECT RTRIM('aaabbbaaa', 'a') FROM DUAL;
   SELECT TRIM('a'FROM 'aaabbbaaa') FROM DUAL;

-- RPAD(expr1, n, [expr2]) : expr1(대상문자열)을 n만큼 오른쪽으로 늘려서 결과 반환 늘린 공백은 expr2로 채움.
   SELECT ename, RPAD(ename, 7, '#') FROM emp;
   SELECT ename, RPAD(SUBSTR(ename, 1, 3), LENGTH(ename), '*') FROM emp; -- 이름의 일부가 '*'로 가려져서 출력

-- CEIL(n) : n과 같거나 가까운 가장 작은 정수로 올림하여 반환
   SELECT CEIL(1234.12345678) ceil1, CEIL(0.12345) FROM DUAL;
   SELECT CEIL(15.378), CEIL(123.13245) FROM DUAL;

-- SUBSTR(char, pos, leng) : 문자열 일부를 반환. 지정한 길이 만큼의 문자열을 반환하는 함수
   SELECT SUBSTR('Hello Oracle', 2,3) FROM DUAL;

-- 임의의 테이블 생성
   CREATE TABLE Customer(
    custid NUMBER(2) PRIMARY KEY,
    name VARCHAR2(40),
    adress VARCHAR2(50),
    phone VARCHAR2(20)
   );

-- Customer 테이블에 데이터 입력
   INSERT INTO Customer VALUES(1, '박지성','영국 맨체스터', '000-5000-0001');
   INSERT INTO Customer VALUES(2, '김연아','대한민국 서울', '010-6000-0001');
   INSERT INTO Customer VALUES(3, '장미란','대한민국 강원도', '010-7000-0001');
   INSERT INTO Customer VALUES(4, '추신수','미국 클리브랜드', '010-8000-0001');
   INSERT INTO Customer VALUES(5, '박세리','대한민국 대전', null);
   COMMIT;

   SELECT * FROM Customer;

-- 고객 중에서 같은 성을 0가진 사람이 몇명이나 되는지 성별 인원수를 구하라
   SELECT SUBSTR(name, 1, 1) 성, COUNT(*) 인원 FROM Customer GROUP BY SUBSTR(name, 1, 1);

-- 81년에 입사한 모든 사원을 출력 (이름과 입사일)
   SELECT ename, hiredate FROM emp WHERE SUBSTR(hiredate, 1, 2)=81;

/*
-- ROUND (n, i) : n을 소수점 이하 i+1번째에서 반올림 실행
                  i<0 => 소수점 좌측으로 i번째에서 반올림
*/
   SELECT ROUND(15.378, 2), ROUND(15.378, 1), ROUND(15.378, 0), ROUND(15.378, -1) FROM DUAL;

-- TRUNC(n1, n2) : n1을 n2째에서 잘라냄(버림)
   SELECT TRUNC(15.378,2), TRUNC(15.378,1), TRUNC(15.378, 0), TRUNC(15.378, -1) FROM DUAL;

-- MOD(n2,n1) : n2/n1의 나머지 값을 반환
-- 사번이 홀수인 사원의 이름과 사번
   SELECT empno, ename FROM emp WHERE MOD(empno, 2)<>0;

-- SYSDATE : DBMS 시스템상의 오늘 날짜를 반환하는 함수 (인자 없음)
   SELECT SYSDATE FROM DUAL;
   SELECT NEXT_DAY(SYSDATE, '월') FROM DUAL; -- 지정한 다음번 날짜를 리턴

-- date형의 날짜에서 달의 마지막 날을 리턴해주는 함수
   SELECT LAST_DAY('16/08/01') FROM DUAL;
   SELECT LAST_DAY('16/08/1') FROM DUAL;
   SELECT LAST_DAY(SYSDATE) FROM DUAL;

   SELECT ADD_MONTHS('16/08/01', 6) FROM DUAL;
/*
LENGTH(char) : 문자열의 길이 반환, 글자의 수를 세어주는 함수
               (단위가 byte가 아니고 문자 단위)
 */
   SELECT LENGTH('jung'), LENGTH('정도전'), LENGTHB('jung'), LENGTHB('정도전') FROM DUAL;

-- emp에서 사원에서 이름이 4글자인 사원의 이름과 입사일 출력
   SELECT ename, hiredate FROM emp WHERE LENGTH(ename)=4;

-- 임의의 테이블 생성
   CREATE TABLE Book(
     bookid NUMBER(2) PRIMARY KEY,
     bookname VARCHAR2(40),
     publisher VARCHAR2(40),
     price NUMBER(8)
   );

-- Book 데이터 생성
   INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', '7000');
   INSERT INTO Book VALUES(2, '축구의 역사', '나무수', '13000');
   INSERT INTO Book VALUES(3, '축구의 역사', '대한미디어', '7000');
   INSERT INTO Book VALUES(4, '축구의 역사', '대한미디어', '7000');
   INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', '7000');
   INSERT INTO Book VALUES(6, '역도의 기술', '굿스포츠', '7000');
   INSERT INTO Book VALUES(7, '축구의 역사', '이상미디어', '7000');
   INSERT INTO Book VALUES(8, '축구의 역사', '이상미디어', '7000');
   INSERT INTO Book VALUES(9, '축구의 역사', '삼성당', '7000');
   INSERT INTO Book VALUES(10, '축구의 역사', 'Pearson', '7000');
   COMMIT;

   SELECT * FROM Book;
   SELECT bookname 제목, LENGTH(bookname) 글자수, LENGTHB(bookname) 바이트수
   FROM Book WHERE publisher='굿스포츠';
   -- 글자수는 공백포함하여 카운트

-- TO_CHAR : 날짜형을 문자형으로 변환하는 함수
   SELECT ename, sal, TO_CHAR(sal, '$99,999') FROM emp; -- 형식 지정 가능
   SELECT ename, sal, TO_CHAR(sal, 'L99,999') FROM emp; -- 지역 화폐단위 출력
   SELECT ename, hiredate, TO_CHAR(hiredate, 'YYYY-MM-DD HH24:MI:SS') FROM emp;
   SELECT ename, hiredate, TO_CHAR(hiredate, 'YYYY"년" MM"월" DD"일"') FROM emp;

-- TO_DATE : 문자형으로 저장된 날짜를 날짜형으로 변환하는 함수
   CREATE TABLE Orders (
     orderid NUMBER(2) PRIMARY KEY,
     custid NUMBER(2) REFERENCES Customer(custid),
     bookid NUMBER(2) REFERENCES Book(bookid),
     salprice NUMBER(8),
     orderdate DATE
   );

-- 주문(Orders) 테이블에 데이터 입력
   INSERT INTO Orders VALUES(1,1,1,6000,TO_DATE('2016-07-01', 'yyyy-mm-dd'));
   INSERT INTO Orders VALUES(2,2,2,12000,TO_DATE('2016-07-07', 'yyyy-mm-dd'));
   COMMIT;

   SELECT * FROM Orders;
   SELECT orderid "주문번호", TO_CHAR(orderdate, 'yyyy-mm-dd') "주문일",
          custid 고객번호, bookid 도서번호 FROM Orders
          WHERE orderdate=TO_DATE('20160707', 'yyyy-mm-dd');

-- NULL 값을 확인하는 방법 : IS NULL, IS NOT NULL
-- 임의의 테이블 생성
   CREATE TABLE Mybook(
     bookid NUMBER,
     price NUMBER
   );

-- Mybook 테이블에 데이터 추가
   INSERT INTO Mybook VALUES(1, 10000);
   INSERT INTO Mybook VALUES(2, 20000);
   INSERT INTO Mybook VALUES(3, NULL);
   COMMIT;

   SELECT * FROM Mybook WHERE price IS NULL;
   SELECT * FROM Mybook WHERE price='NULL';--NULL 값 체크가 되지 않는다

-- NVL : 특정 컬럼에 NULL 값이 있는 경우 다른 값으로 대치하여 연산하거나, 다른 값으로 출력
-- NVL(속성, 값) => 속성이 NULL이면 '값'으로 대치한다
   SELECT ename, comm, sal, sal+NVL(comm,0) FROM emp;

   SELECT * FROM Customer;
-- 전화번호가 없는 고객일 경우 '연락처 없음'으로 표기
-- 이름, 전화번호 출력
   SELECT name 이름, NVL(phone, '연락처 없음') 연락처 FROM Customer;