-- 2016.08.17 JOIN 문제
-- 문제 1. 사원명, 부서명, 급여등급, 출력
   -- 오라클 타입
   SELECT ename, dname, grade FROM emp, dept, salgrade
   WHERE emp.deptno=dept.deptno AND sal BETWEEN losal AND hisal;
   -- ANSI 타입
   SELECT ename, dname, grade FROM emp
   JOIN dept ON emp.deptno=dept.deptno JOIN salgrade ON sal BETWEEN losal AND hisal;
   -- NATURAL 타입 : 공통적인 속성이 없을 때는 사용할 수 없음
   SELECT ename, dname, grade FROM emp NATURAL JOIN dept JOIN salgrade
   ON sal BETWEEN losal AND hisal;
   -- JOIN USING : 공통적인 속성이 없을 때는 사용 안됨
   SELECT ename, dname, grade FROM emp JOIN dept USING(deptno) JOIN salgrade
   ON sal BETWEEN losal AND hisal;

-- 문제2. 사원들의 이름, 부서번호, 부서이름을 출력하라
   -- 오라클 타입
   SELECT ename, emp.deptno, dname FROM emp, dept WHERE emp.deptno=dept.deptno;
   -- ANSI 타입
   SELECT ename, emp.deptno, dname FROM emp JOIN dept ON emp.deptno=dept.deptno;
   -- NATURAL 타입
   SELECT ename, deptno, dname FROM emp NATURAL JOIN dept;
   -- JOIN USING 타입
   SELECT ename, deptno, dname FROM emp JOIN dept USING(deptno);

-- 문제 3. 30번 부서의 사원들이 이름, 직위, 부서 위치, 부서 번호를 출력하라
   -- 오라클 타입
   SELECT ename, job, loc, emp.deptno FROM emp, dept WHERE emp.deptno=dept.deptno AND emp.deptno=30;
   -- ANSI 타입
   SELECT ename, job, loc, emp.deptno FROM emp JOIN dept ON emp.deptno=dept.deptno WHERE emp.deptno=30;
   -- NATURAL 타입
   SELECT ename, job, loc, deptno FROM emp NATURAL JOIN dept WHERE deptno=30;
   -- JOIN USING 타입
   SELECT ename, job, loc, deptno FROM emp JOIN dept USING(deptno) WHERE deptno=30;

-- 문제 4. 수당을 받는 사원의 이름, 직위, 근무지를 출력하라
   -- 오라클 타입
   SELECT ename, job, loc FROM emp, dept WHERE emp.deptno=dept.deptno AND comm IS NOT NULL AND comm<>0;
   -- ANSI 타입
   SELECT ename, job, loc FROM emp JOIN dept ON emp.deptno=dept.deptno WHERE comm IS NOT NULL AND comm<>0;
   -- NATURAL 타입
   SELECT ename, job, loc FROM emp NATURAL JOIN dept WHERE comm IS NOT NULL AND comm<>0;
   -- JOIN USING 타입
   SELECT ename, job, loc FROM emp JOIN dept USING(deptno) WHERE comm IS NOT NULL AND comm<>0;

-- 문제 5. DALLAS에서 근무하는 사원의 이름, 직위, 근무지를 출력하라
   -- 오라클 타입
   SELECT ename, job, loc FROM emp, dept WHERE emp.deptno=dept.deptno AND loc='DALLAS';
   -- ANSI 타입
   SELECT ename, job, loc FROM emp JOIN dept ON emp.deptno=dept.deptno WHERE loc='DALLAS';
   -- NATURAL 타입
   SELECT ename, job, loc FROM emp NATURAL JOIN dept WHERE loc='DALLAS';
   -- JOIN USING 타입
   SELECT ename, job, loc FROM emp JOIN dept USING(deptno) WHERE loc='DALLAS';

-- 문제 6. 이름에 A가 들어가 있는 사원의 이름, 부서명을 출력
   -- 오라클 타입
   SELECT ename, dname FROM emp, dept WHERE emp.deptno=dept.deptno AND ename LIKE '%A%';
   -- ANSI 타입
   SELECT ename, dname FROM emp JOIN dept ON emp.deptno=dept.deptno WHERE ename LIKE '%A%';
   -- NATURAL 타입
   SELECT ename, dname FROM emp NATURAL JOIN dept WHERE ename LIKE '%A%';
   -- JOIN USTING 타입
   SELECT ename, dname FROM emp JOIN dept USING(deptno) WHERE ename LIKE '%A%';

-- 문제 7. 사원의 이름과 그 사원의 관리자 이름
   -- 오라클 타입
   SELECT e1.ename "본인", e2.ename "관리자" FROM emp e1, emp e2 WHERE e1.mgr=e2.empno;
   -- ANSI 타입
   SELECT e1.ename "본인", e2.ename "관리자" FROM emp e1 JOIN emp e2 ON e1.mgr=e2.empno;

-- 문제 8. 사원의 이름, 직위, 급여, 급여등급 출력
   -- 오라클 타입
   SELECT ename, job, sal, grade FROM emp, salgrade WHERE sal BETWEEN losal AND hisal;
   -- ANSI 타입
   SELECT ename, job, sal, grade FROM emp JOIN salgrade ON sal BETWEEN losal AND hisal;
   -- NATURAL 타입
   SELECT ename, job, sal, grade FROM emp NATURAL JOIN salgrade WHERE sal BETWEEN losal AND hisal;
   -- JOIN USING 타입은 공통의 조건이 없어서 안됨

-- 문제 9. 사원의 이름과 부서명, 급여 출력 급여가 3000이상인 경우
   -- 오라클 타입
   SELECT ename, dname, sal FROM emp, dept WHERE emp.deptno=dept.deptno AND sal>=3000;
   -- ANSI 타입
   SELECT ename, dname, sal FROM emp JOIN dept ON emp.deptno=dept.deptno WHERE sal>=3000;
   -- NATURAL 타입
   SELECT ename, dname, sal FROM emp NATURAL JOIN dept WHERE sal>=3000;
   -- JOIN USING 타입
   SELECT ename, dname, sal FROM emp JOIN dept USING(deptno) WHERE sal>=3000;
