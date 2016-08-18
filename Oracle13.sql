-- 2016.08.18 DELETE(데이터 삭제)

-- DELETE : 한 줄을 삭제 - ROW(레코드)
   1) 형식
   DELETE FROM table명 WHERE 조건절;

-- DELETE 실습
   DELETE FROM myEmp WHERE empno=8002;
   COMMIT;

   SELECT * FROM myEmp;