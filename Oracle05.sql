-- 내장 함수
   /*
   단일 함수 | 집합 함수
             ========
             ORDER BY, GROUP BY 등
    */
/*
-- 집합 함수
   => 데이터 전체를 대상으로 처리하는 기능
      - MAX : 최대값 => Sequence
      - MIN : 최소값
      - COUNT : 개수 => 로그인 처리, 중복처리, 총페이지
      - AVG : 평균
      - SUM : 총합
      - RANK : 순위
 */

-- MAX
   SELECT MAX(sal), MIN(sal), AVG(sal), SUM(sal) FROM emp;

-- COUNT
   SELECT COUNT(*), COUNT(comm)FROM emp; -- 전체 row와 comm이 있는 row를 카운팅

-- ORDER BY 정렬 (내림차순:DESC, 올림차순 : ASC)
   SELECT ename, sal, hiredate FROM emp ORDER BY sal DESC;
   SELECT ename, sal, hiredate FROM emp ORDER BY sal; -- default는 오름차순(ASC)
   SELECT ename, sal, hiredate FROM emp ORDER BY ename DESC, sal ASC; -- 복수로 조건 사용 가능, 순서에 따라 차례로 정렬

-- ROWNUM
/*
   - 내장 함수는 아지만 자주 사용하는 문법
   - 오라클에서 내부적으로 생성되는 가상의 Column
   - SQL 조회 결과의 순번을 나타냄
   - 자료의 일부분만 확인하여 처리할 때 유용
 */

-- 고객목록에서 고객번호, 이름, 전화번호를 앞의 두명만 출력하시오
   SELECT * FROM Customer;
   SELECT ROWNUM "순번", custid "고객번호", name, phone FROM Customer WHERE ROWNUM<=2;
   SELECT ROWNUM "순번", ename, hiredate, job, sal FROM emp WHERE ROWNUM<=5;

-- SUBQUERY(구속질의)
/*
   - 하나의 SQL문 안에 다른 SQL문이 중첩된(NESTED) 질의를 말함
   - 다른 테이블에서 가져온 데이터로 현재 테이블에 있는 정보를 찾거나 가공할 때 사용함
   - 조인보다 필요한 데이터만 찾아서 공급해주는 서브쿼리가 성능이 더 좋음
   - 주질의(MAIN QUERY, 외부질의)와 부속 질의 (SUBQUERY, 내부질의)로 구성됨
 */

-- 인라인 뷰(INLINE VIEW, Table Subquery)
/*
    - FROM 절에서 사용되는 부속 질의
    - FROM절에서 나오는 결과가 뷰(VIEW)형태로 반환
 */

   SELECT ename, hiredate, job, sal, num
   FROM (SELECT ename, hiredate, job, sal, ROWNUM as num FROM emp ORDER BY sal DESC)
   WHERE ROWNUM<=5;

   SELECT ename, hiredate, job, sal, ROWNUM FROM emp WHERE ROWNUM<=5 ORDER BY sal DESC;

-- DISTINCT : 중복으로 제거해주는 함수
/*
   - COUNT: 값의 개수 계산 함수, 열에 저장된 값들의 개수
   - COUNT(*) : 전체 행의 개수 계산 함수
 */

   SELECT COUNT(DISTINCT deptno) FROM emp;
   SELECT COUNT(DISTINCT job) "직위", COUNT(DISTINCT deptno) "부서" FROM emp;

-- GROUP BY (그룹 질의)
/*
   - 그룹 질의를 기술할 때 사용
   - 특정 열에 동일한 값을 갑는 행들을 그룹화 한 후 각 그룹에 대해 한개 행씩 질의 결과를 생성
 */

   SELECT COUNT(*), AVG(sal), SUM(sal) FROM emp WHERE deptno=10;
   SELECT COUNT(*), AVG(sal), SUM(sal) FROM emp WHERE deptno=20;
   SELECT COUNT(*), AVG(sal), SUM(sal) FROM emp WHERE deptno=30;

   SELECT deptno, COUNT(*), AVG(sal), SUM(sal) FROM emp GROUP BY deptno;

-- <정리>
/*
1. SELECT 문의 기본 문법
   SELECT [ALL | DISTINCT] 속성 이름(들)
   FROM   테이블 이름(들)
   [WHERE 검색조건(들)]
   [ORDER BY 속성이름 (ASC | DESC)]
   [GROUP BY 속성이름]
   [HAVING  검색조건(들)]
   ------------------------------------
   [] : 대괄호 안의 SQL 예약어들은 선택적으로 사용
   | :  선택가능한 문법들 중 한개를 사용

2. WHERE 절에 조건으로 사용할 수 있는 술어
   술어           연산자
   비교       =, <>, <, <=, >, >=
   범위       BETWEEN
   집합       IN, NOT IN
   패턵       LIKE
   NULL      IS NULL, IS NOT NULL
   복합조건    AND, OR, NOT

3. GROUP BY <속성>
   GROUP BY로 행을 그룹으로 묶은 후에는
   SELECT절에는 GROUP BY에서 사용한 <속성>과 집계함수만 나올 수 있음.

4. HAVING <검색조건>
   GROUP BY절에 의해 구성된 그룹들에 대해 적용할 조건을 기술함
   HAVING절은  1) 반드시 GROUP BY절과 같이 작성
              2) WHERE절보다 뒤에 나와야 함
              3) <검색조건> 에는 집계함수가 와야 함.
                 SUM, AVG, MAX, MIN, COUNT
 */

-- 같은 연도에 입사한 사원들의 인원수, 급여평균, 총급여를 출력하라
   SELECT SUBSTR(hiredate, 1,2), COUNT(*), AVG(sal), SUM(sal)
   FROM emp GROUP BY SUBSTR(hiredate, 1, 2);

-- 각 부서 중에 급여의 평균보다 많은 급여를 받는 사원의 수를 출력하라
   SELECT * FROM emp;
   SELECT AVG(sal) FROM emp;

   SELECT deptno, COUNT(*), SUM(SAL),AVG(SAL)
   FROM emp WHERE sal>(select AVG(sal) from emp) GROUP BY deptno;

   SELECT DEPTNO,COUNT(*),SUM(SAL),AVG(SAL)
   FROM ( SELECT * FROM EMP WHERE SAL>(SELECT AVG(SAL) FROM EMP)) GROUP BY DEPTNO;

-- 각 부서 중에 급여의 평균보다 많은 급여를 받는 부서의 사원의 수를 출력하라
   SELECT deptno, COUNT(*), SUM(sal), AVG(sal)
   FROM emp GROUP BY deptno HAVING AVG(sal)>(SELECT AVG(sal) FROM emp);