-- 2016.08.23 SubQuery

--서브쿼리 사용
-- DML 사용시
   SELECT ~ FROM table명 WHERE col=(SELECT~~);
   INSERT INTO table명 VALUES((SELECT~~),...,...);
   UPDATE table명 SET ~~~ WHERE col=(SELECT~~);

-- 테이블 생성시
   CREATE TABLE table명 AS (SELECT~~);

-- 테이블명 대신 사용
   SELECT ~ FROM (SELECT~~);

-- 컬럼명 대신 사용
   SELECT~,(SELECT~~),~FROM (SELECT~~);

-- 서브쿼리의 종류
   1) 단일행 서브쿼리 : ROW => data(1), 데이터가 1개만 생성되는 쿼리
      SELECT deptno FROM emp WHERE empno=7788;
   2) 다중행 서브쿼리 : Multi ROW, 데이터가 여러 행 생성되는 쿼리
      SELECT deptno FROM emp WHERE deptno IN(10,20,30);
      SELECT deptno FROM emp WHERE deptno = ANY(10,20,30); -- = ANY : IN과 같은 효과 범위 지정
      SELECT deptno FROM emp WHERE deptno > ANY(10,20,30); -- > ANY : 최소값 보다 큰 값
      SELECT deptno FROM emp WHERE deptno < ANY(10,20,30); -- < ANY : 최대값 보다 작은 값
      SELECT deptno FROM emp WHERE deptno != ANY(10,20,30); -- != ANY : NOT IN과 같은 효과
      SELECT deptno FROM emp WHERE deptno > ALL(10,20,30); --  > ALL : 최대값 보다 크면
      SELECT deptno FROM emp WHERE deptno < ALL(10,20,30); -- < ALL : 최소값보다 작으면



   3) 다중 컬럼 서브쿼리
      SELECT deptno, mgr FROM emp;

-- BLAKE와 같은 부서에서 근무하는 사원의 이름과 입사일
   SELECT ename, hiredate FROM emp WHERE deptno IN(SELECT deptno FROM emp WHERE ename='BLAKE');

-- 30번 부서에서 급여를 가장 많이 받는 사람보다 더 많이 받는 사원의 이름과 급여 출력
   SELECT MAX(sal) FROM emp WHERE deptno=30;
   SELECT ename, sal FROM emp WHERE sal>(SELECT MAX(sal) FROM emp WHERE deptno=30);
   SELECT ename, sal FROM emp WHERE sal>ALL(SELECT sal FROM emp WHERE deptno=30);

-- 각 부서별 최소급여를 받는 사원의 정보를 출력(정보: 이름, 급여, 부서)
   SELECT  deptno, MIN(sal) FROM emp GROUP BY deptno ORDER BY deptno ASC;
   SELECT deptno, ename, sal FROM emp WHERE sal IN(SELECT MIN(sal) FROM emp GROUP BY deptno) ORDER BY deptno ASC;

-- SCOTT과 같은 사수이고 업무가 같은 사원의 이름과 사수번호, 직위 출력
   SELECT job, mgr FROM emp WHERE ename='SCOTT';
   SELECT ename, job, mgr FROM emp WHERE job=(SELECT job FROM emp WHERE ename='SCOTT')
                                         AND mgr=(SELECT mgr FROM emp WHERE ename='SCOTT')
                                         AND ename!='SCOTT';
   SELECT ename, job, mgr FROM emp WHERE (job, mgr)=(SELECT job, mgr FROM emp WHERE ename='SCOTT') AND ename!='SCOTT';
   SELECT ename, job, mgr FROM emp WHERE (job, mgr) IN(SELECT job, mgr FROM emp WHERE ename='SCOTT') AND ename<>'SCOTT';