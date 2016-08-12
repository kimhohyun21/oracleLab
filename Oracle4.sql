-- 연습문제
-- <1> SELECT '부서번호가 10번인 부서이 사람 중 사원번호, 이름, 급여를 출력하라.' FROM DUAL;
   SELECT empno,ename,sal FROM emp WHERE deptno=10;

-- <2> 사원 번호가 7369인 사람 중 이름,입사일자,부서번호를 출력하라.
   SELECT ename,hiredate,deptno FROM emp WHERE empno=7369;

-- <3> 이름이 ALLEN인 사람의 모든 정보를 출력하라.
   SELECT * FROM emp WHERE ename='ALLEN';

-- <4> 입사일자가 87/04/19인 사원의 이름, 부서번호, 급여를 출력하라.
   SELECT ename,deptno,sal FROM emp WHERE hiredate='87-04-19';
   SELECT * FROM emp;

-- <5> 직업이 매니저가 아닌 사람의 모든 정보를 출력하라.
   SELECT * FROM emp WHERE job!='MANAGER';

-- <6> 입사일자가 81/04/12 이후에 입사한 사원의 정보를 출력하라.
   SELECT * FROM emp WHERE hiredate>'81-04-12';

-- <7> 급여가 $2500이상인 사람의 이름, 급여, 부서번호를 출력하라
   SELECT ename, sal, deptno FROM emp WHERE sal>=2500;

-- <8> 부서번호가 20번 이상인 사원의 모든 정보를 출력하라
   SELECT * FROM emp WHERE deptno>=20;

-- <9> 성명이 K로 시작하는 사람보다 높은 이름을 가진 사람의 모든 정보를 출력하라
   SELECT * FROM emp WHERE SUBSTR(ename, 1, 1)>'K';
   SELECT * FROM emp WHERE ename >'L%';

-- <10> 입사일자가 81/12/09보다 먼저 입사한 사람들의 모든 정보를 출력하라
   SELECT * FROM emp WHERE hiredate>'81/12/09';

-- <11> 입사번호가 7698보다 작거나 같은 사람들의 입사번호와 이름을 출력하라
   SELECT empno, ename FROM emp WHERE empno<=7698;

-- <12> 입사일자가 81/04/02보다 늦고 82/12/09보다 빠른 사원의 이름, 월급, 부서번호, 입사일을 출력하라.
   SELECT ename, sal, deptno, hiredate FROM emp WHERE hiredate BETWEEN '81/04/02' AND '82/12/09';

-- <13> 급여가 1,600보다 크고 3,000보다 작은 사람들의 이름, 직무, 급여를 출력하라
   SELECT ename, job, sal FROM emp WHERE sal BETWEEN 1600 AND 3000;

-- <14> 사원번호가 7654와 7782 사이 이외의 사원의 모든 정보를 출력하라
   SELECT * FROM emp WHERE empno<7654 OR empno>7782;
   SELECT * FROM emp WHERE NOT empno BETWEEN 7654 AND 7782;

-- <15> 이름이 B와 J사이의 모든 사원의 정보를 출력하라
   SELECT * FROM emp WHERE SUBSTR(ename, 1, 1) BETWEEN 'B' AND 'J';
   SELECT * FROM emp WHERE ename BETWEEN 'B' AND 'K';

-- <16> 입사일자가 81년 이외에 입사한 사람의 모든 정보를 출력하라
   SELECT * FROM emp WHERE hiredate NOT LIKE '81%';
   SELECT * FROM emp WHERE TO_CHAR(hiredate, 'yy/mm/dd') NOT LIKE '81%';

-- <17> 직무가 MANAGER와 SALESMAN인 사람의 모든 정보를 출력하라
   SELECT * FROM emp WHERE job IN('MANAGER', 'SALESMAN');

-- <18> 부서번호 20, 30번을 제외한 모든 사람의 이름 사원번호, 부서번호를 출력하라
   SELECT ename, empno, deptno FROM emp WHERE deptno NOT IN(20, 30);
