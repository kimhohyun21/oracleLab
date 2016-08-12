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