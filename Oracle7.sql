-- 사원의 이름, 입사일, 부서명, 근무지 출력 => 81년에 입사한 사원만 출력
   SELECT ename, hiredate, dname, loc FROM emp, dept
   WHERE emp.deptno=dept.deptno AND SUBSTR(hiredate,1,2)=81;

   SELECT ename, hiredate, dname, loc FROM emp, dept
   WHERE emp.deptno=dept.deptno AND hiredate LIKE '%81%';

   SELECT ename, hiredate, dname, loc FROM emp, dept
   WHERE emp.deptno=dept.deptno AND hiredate BETWEEN '81/01/01' AND '81/12/31';

   SELECT ename, hiredate, dname, loc FROM emp, dept
   WHERE emp.deptno=dept.deptno AND hiredate>='81/01/01' AND hiredate<='81/12/31';

-- 사원의 이름, 입사일, 급여, 부서명, 근무지 출력 => 전체급여의 평균보다 많이 받는 사원 출력
   SELECT ename, hiredate, sal, dname, loc FROM emp, dept
   WHERE emp.deptno=dept.deptno AND sal>(SELECT AVG(sal) FROM emp);

   SELECT ename, hiredate, sal, dname, loc FROM emp JOIN dept ON emp.deptno=dept.deptno
   WHERE sal>(SELECT AVG(sal) FROM emp);

   SELECT ename, hiredate, sal, dname, loc FROM emp NATURAL JOIN dept
   WHERE sal>(SELECT AVG(sal) FROM emp);

   SELECT ename, hiredate, sal, dname, loc FROM emp JOIN dept USING(deptno)
   WHERE sal>(SELECT AVG(sal) FROM emp);

-- 사원의 이름, 입사일, 급여, 부서명, 근무지 출력 => KING과 같은 부서인 사원 출력
-- dname을 활용
   SELECT dname FROM emp, dept WHERE emp.deptno=dept.deptno AND ename='KING';

   SELECT ename, hiredate, sal, dname, loc FROM emp, dept
   WHERE emp.deptno=dept.deptno AND dname='ACCOUNTING';

   SELECT ename, hiredate, sal, dname, loc FROM emp, dept
   WHERE emp.deptno=dept.deptno
   AND dname=(SELECT dname FROM emp, dept WHERE emp.deptno=dept.deptno AND ename='KING');

-- deptno를 활용
   SELECT deptno FROM emp WHERE ename='KING';

   SELECT ename, hiredate, sal, dname, loc FROM emp, dept
   WHERE emp.deptno=dept.deptno AND emp.deptno=10;

   SELECT ename, hiredate, sal, dname, loc FROM emp, dept
   WHERE emp.deptno=dept.deptno
   AND emp.deptno=(SELECT deptno FROM emp WHERE ename='KING');

-- 사원의 이름, 부서명, 근무지, 부서번호 출력 => SCOTT과 같은 직위를 가진 사원
   SELECT job FROM emp WHERE ename='SCOTT';
   -- 오라클 타입
   SELECT ename, dname, loc, emp.deptno FROM emp, dept
   WHERE emp.deptno=dept.deptno AND job='ANALYST';
   -- ANSI 타입
   SELECT ename, dname, loc, emp.deptno FROM emp JOIN dept ON emp.deptno=dept.deptno
   WHERE job='ANALYST';
   -- NATURAL 타입
   SELECT ename, dname, loc, deptno FROM emp NATURAL JOIN dept
   WHERE job='ANALYST';
   -- JOIN USING 타입
   SELECT ename, dname, loc, deptno FROM emp JOIN dept USING(deptno)
   WHERE job='ANALYST';
   -- 서브 쿼리 사용
   SELECT ename, dname, loc, emp.deptno FROM emp, dept
   WHERE emp.deptno=dept.deptno AND job=(SELECT job FROM emp WHERE ename='SCOTT');

