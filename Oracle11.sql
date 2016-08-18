-- 2016.08.18 DML : 데이터 조작 언어 => INSERT(데이터 추가)

-- DML 중 SELECT는 데이터가 변경되는 것은 아님 => data를 read하는 역할

-- DML 사용시 변경된 것을 알려줌
   1) 정상 수행 (저장 요청) : COMMIT
   2) 비정상 수행 (취소 요청) : ROLLBACK
   *** 자바에서는 기본적으로 AutoCommit 기능 수행

-- SELECT 이외의 나머지 DML 종류
   1) INSERT (데이터 추가)
   2) UPDATE (데이터 수정)
   3) DELETE (데이터 삭제)

-- INSERT
   1) 전체 데이터 입력
      INSERT INTO table명 VALUES(값, 값, 값....);
   2) 원하는 데이터만 입력
      INSERT INTO table명 (컬럼명, 컬럼명...) VALUES(값, 값,...);

-- 테이블 : 유일값 (테이블 => 파일로 저장됨)

-- 기존 테이블 삭제 후 새로우 테이블 작성 ==> DROP과 CREATE 사용
   DROP TABLE myEmp; ==> 해당 테이블 없음을 확인

-- 기존 테이블에서 데이터 카피하여 새로운 테이블블 생
   CREATE TABLE myEmp AS SELECT empno, ename, job, hiredate, sal, deptno FROM emp;
   ==> 테이블 복사하면 제약조건이 사라짐(empno의 primary key 속성 사라짐)

   SELECT * FROM myEmp;

-- INSERT 실습 : 전체 추가
   INSERT INTO myEmp VALUES(8000, '오해영', '과장', '16/12/05', 3000, 10);
   COMMIT;

   INSERT INTO myEmp VALUES((SELECT MAX(empno)+1 FROM myEmp), '박도경', '사원', SYSDATE, 2400, 20);
   COMMIT;

   SELECT * FROM myEmp;

-- INSERT 실습 : 원하는 데이터 부분 추가
   INSERT INTO myEmp (empno, ename, hiredate, sal) VALUES ((SELECT MAX(empno)+1 FROM myEmp), '박수경', SYSDATE, 2000);
   COMMIT;

   SELECT * FROM myEmp;