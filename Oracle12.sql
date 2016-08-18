-- 2016.08.18 UPDATE (데이터 수정)

-- UPDATE : 마찬가지로 데이터 수정 후 COMMIT, ROLLBACK 사용함.
   1) 형식
   UPDATE table명 SET 변경값 설정...WHERE 조건;
   ==>  UPDATE table명 SET ename='값', sal='값'...;

-- myEmp 테이블 데이터 수정
   UPDATE myEmp SET ename='또오해영', sal=2300 WHERE empno=8000;
   COMMIT;

   SELECT * FROM myEmp;