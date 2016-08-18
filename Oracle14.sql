-- 2016.08.18 INSERT 응용

-- emp로부터 한번 더 데이터를 복사하여 한꺼번에 myEmp에 추가
   INSERT INTO myEmp SELECT empno, ename, job, hiredate, sal, deptno FROM emp;
   COMMIT;

   SELECT * FROM myEmp;

-- 새로운 테이블 생성 : 부서가 10인 사람만의 테이블을 새로 생성
   CREATE TABLE myEmp10 AS SELECT * FROM myEmp WHERE deptno=10;

   SELECT * FROM myEmp10;

-- 새로운 테이블 생성 : 부서가 20인 사람만의 테이블을 새로 생성
   CREATE TABLE myEmp20 AS SELECT * FROM myEmp WHERE deptno=20;

   SELECT * FROM myEmp20;

-- 새로운 테이블 생성 : 부서가 30인 사람만의 테이블을 새로 생성
   CREATE TABLE myEmp30 AS SELECT * FROM myEmp WHERE deptno=30;

   SELECT * FROM myEmp30;

-- 테이블은 그대로 유지하고 테이블 데이터만 모두 삭제 : TRUNCATE 사용
   TRUNCATE TABLE myEmp10;
   TRUNCATE TABLE myEmp20;
   TRUNCATE TABLE myEmp30;

   SELECT * FROM myEmp10;
   SELECT * FROM myEmp20;
   SELECT * FROM myEmp30;