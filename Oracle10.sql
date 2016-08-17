-- SUBQUERY
   JOIN => 테이블의 데이터에 다른 테이블의 데이터를 합쳐서 가지고 옴
   SUBQUERY => sql 문장을 여러개 합쳐서 한번에 수행할 수 있게 만드는 형식
               형식) Main Query = (SubQuery)
                                 ==========
               해석순서)  2            1

               1) 단일행(값이 1개) SELECT AVG(sal) FROM emp;
               2) 다중행(값이 여러개) SELECT distinct deptno FROM emp;
                  서브쿼리에서 연산자를 사용했을 경우
                  > ALL(10, 20, 30) : 최대값보다 크면 => 30
                  < ALL(10, 20, 30) : 최소값보다 작으면 => 10

               3) 다중 컬럼
                  SELECT AVG(sal) FROM emp; => 단일행
                  SELECT COUNT(sal) FROM emp; => 단일행
                  SELECT deptno FROM emp; => 다중행
                  SELECT hiredate, ename FROM emp; => 다중 컬럼

-- SCOTT가 있는 부서의 사원의 이름 급여 입사일
   SELECT deptno FROM emp WHERE ename='SCOTT';
   SELECT ename, sal, hiredate FROM emp WHERE deptno=20;
   SELECT ename, sal, hiredate FROM emp WHERE deptno=(SELECT deptno FROM emp WHERE ename='SCOTT');

-- 급여가 전체 평균 보다 많이 받는 사원의 이름과 급여, 입사일을 출력하라
   SELECT AVG(sal) FROM emp;
   SELECT ename, sal, hiredate FROM emp WHERE sal>2073;
   SELECT ename, sal, hiredate FROM emp WHERE sal>(SELECT AVG(sal) FROM emp);

-- SCOTT과 같은 급여를 받는 사원의 이름과 급여를 출력
   SELECT sal FROM emp WHERE ename='SCOTT';
   SELECT ename, sal FROM emp WHERE sal=3000;
   SELECT ename, sal FROM emp WHERE sal=(SELECT sal FROM emp WHERE ename='SCOTT');

-- 다중행
-- 81년도에 입사한 사원과 같은 부서에 근무하는 사원의 이름과 부서번호를 출력하라
   SELECT DISTINCT deptno FROM emp WHERE hiredate LIKE '%81%'; -- DISTINCT : 중복되는 값을 제거
   SELECT deptno FROM emp WHERE hiredate LIKE '%81%' GROUP BY deptno;
   SELECT ename, deptno FROM emp
   WHERE deptno IN(SELECT DISTINCT deptno FROM emp WHERE hiredate LIKE '%81%'); -- 순서가 있음
   SELECT ename, deptno FROM emp
   WHERE deptno IN(SELECT deptno FROM emp WHERE hiredate LIKE '%81%' GROUP BY deptno);

-- 사원 중에 A자로 시작하는 사원과 같은 부서에서 근무하는 사원의 이름, 부서명, 근무지를 출력하라
   SELECT deptno FROM emp WHERE ename LIKE 'A%';
   SELECT ename, dname, loc FROM emp NATURAL JOIN dept
   WHERE deptno IN(SELECT deptno FROM emp WHERE ename LIKE 'A%');