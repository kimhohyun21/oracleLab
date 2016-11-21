/*
  3. FUNCTION
    1) 개념
      - 내장 함수와 프로시저는 문법, 특징이 거의 비슷
    
     2) 프로시저와의 차이점
        - 프로시저는 정해진 작업을 수행한 후 경과를 반환할 수도 있고(OUT, INOUT 모드 사용시)
           반환하지 않고 그냥 종료할 수도 있음
        - 함수는 정해진 작업을 수행한 후 결과를 돌려줌(RETURN)
    
     3) 형식
        CREATE OR REPLACE FUNCTION func_name(매개변수)
        RETURN 데이터 형
        IS
        BEGIN
          결과값 
          RETURN 데이터 값;
        END;
        /
   
   4. TRIGGER : 자동 이벤트 처리(INSERT, UPDATE, DELETE)

*/
-- 함수생성하기
-- 부서번호를 입력 받아 최고 급여액을 출력하는 함수를 작성하라
CREATE OR REPLACE FUNCTION s_max_sal(
  s_deptno emp.deptno%TYPE
)
RETURN NUMBER
IS
  max_sal emp.sal%TYPE;
BEGIN
  SELECT MAX(sal) INTO max_sal FROM emp WHERE deptno=s_deptno;
  RETURN max_sal;
END;
/

-- 함수 사용하기
SELECT s_max_sal(10) FROM dual;
SELECT s_max_sal(20) FROM dual;
SELECT s_max_sal(30) FROM dual;



DROP TABLE score CASCADE CONSTRAINTS;
CREATE TABLE score(
  hakbun    NUMBER,
  name      VARCHAR2(20),
  kor         NUMBER,
  eng        NUMBER,
  math      NUMBER
);

INSERT INTO score VALUES(1, '김호현', 80, 90, 30);
INSERT INTO score VALUES(1, '감동훈', 70, 90, 100);
INSERT INTO score VALUES(1, '유덕귀', 90, 90, 40);
INSERT INTO score VALUES(1, '고현우', 10, 100, 30);
INSERT INTO score VALUES(1, '이석수', 100, 70, 80);
COMMIT;

SELECT * FROM score;

-- 점수 합 rowSum
CREATE OR REPLACE FUNCTION rowSum(hak score.hakbun%TYPE)
RETURN NUMBER
IS
  s_sum score.hakbun%TYPE;
BEGIN
  SELECT kor+eng+math INTO s_sum FROM score WHERE hakbun=hak;
  RETURN s_sum;
END;
/

-- 점수 평균 rowAvg
CREATE OR REPLACE FUNCTION rowAvg(hak score.hakbun%TYPE)
RETURN NUMBER
IS
  s_avg score.hakbun%TYPE;
BEGIN
  SELECT ROUND((kor+eng+math)/3,2) INTO s_avg FROM score WHERE hakbun=hak;
  RETURN s_avg;
END;
/

-- empDname 출력
CREATE OR REPLACE FUNCTION empDname(e_deptno emp.deptno%TYPE)
RETURN VARCHAR2
IS
  e_dname   dept.dname%TYPE;
BEGIN
  SELECT dname INTO e_dname FROM dept WHERE deptno=e_deptno;
  RETURN e_dname;
END;
/

-- empLoc 출력
CREATE OR REPLACE FUNCTION empLoc(e_deptno dept.deptno%TYPE)
RETURN VARCHAR2
IS 
  e_loc dept.loc%TYPE;
BEGIN 
  SELECT loc INTO e_loc FROM dept WHERE deptno=e_deptno;
  RETURN e_loc;
END;
/

-- empCount : emp에서 부서별 인원수를 출력하는 함수를 작성하여라
CREATE OR REPLACE FUNCTION empCount(e_deptno emp.deptno%TYPE)
RETURN NUMBER
IS
  e_count emp.empno%TYPE;
BEGIN
  SELECT COUNT(*) INTO e_count  FROM emp WHERE deptno=e_deptno;
  RETURN e_count;
END;
/

-- empAvg : emp에서 부서별 평균 급여를 출력하는 함수를 
CREATE OR REPLACE FUNCTION empAvg(e_deptno  emp.deptno%TYPE)
RETURN NUMBER
IS 
  e_avg emp.empno%TYPE;
BEGIN
  SELECT AVG(sal) INTO e_avg FROM emp WHERE deptno=e_deptno;
  RETURN e_avg;
END;
/

-- empSum : 부서별 급여 합
CREATE OR REPLACE FUNCTION empSum(e_deptno emp.deptno%TYPE)
RETURN NUMBER
IS
  e_dsum  emp.empno%TYPE;
BEGIN
  SELECT SUM(sal) INTO e_dsum FROM emp WHERE deptno=e_deptno;
  RETURN e_dsum;
END;
/

-- 함수 패키지 생성
CREATE OR REPLACE PACKAGE pkg_emp
IS
  FUNCTION empCount(e_deptno emp.deptno%TYPE)
  RETURN NUMBER;
  FUNCTION empAvg(e_deptno  emp.deptno%TYPE)
  RETURN NUMBER;
  FUNCTION empSum(e_deptno emp.deptno%TYPE)
  RETURN NUMBER;
END pkg_emp;
/

CREATE OR REPLACE PACKAGE BODY pkg_emp
IS
  FUNCTION empCount(e_deptno emp.deptno%TYPE)
  RETURN NUMBER
  IS
    e_count NUMBER;
  BEGIN
    SELECT COUNT(*) INTO e_count  FROM emp WHERE deptno=e_deptno;
    RETURN e_count;
  END empCount;
  
  FUNCTION empAvg(e_deptno  emp.deptno%TYPE)
  RETURN NUMBER
  IS 
    e_avg NUMBER;
  BEGIN
    SELECT AVG(sal) INTO e_avg FROM emp WHERE deptno=e_deptno;
    RETURN e_avg;
  END empAvg;
  
  FUNCTION empSum(e_deptno emp.deptno%TYPE)
  RETURN NUMBER
  IS
    e_dsum  NUMBER;
  BEGIN
    SELECT SUM(sal) INTO e_dsum FROM emp WHERE deptno=e_deptno;
    RETURN e_dsum;
  END empSum;
END pkg_emp;
/

