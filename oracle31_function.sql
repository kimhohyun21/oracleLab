/*
  3. FUNCTION
    1) ����
      - ���� �Լ��� ���ν����� ����, Ư¡�� ���� ���
    
     2) ���ν������� ������
        - ���ν����� ������ �۾��� ������ �� ����� ��ȯ�� ���� �ְ�(OUT, INOUT ��� ����)
           ��ȯ���� �ʰ� �׳� ������ ���� ����
        - �Լ��� ������ �۾��� ������ �� ����� ������(RETURN)
    
     3) ����
        CREATE OR REPLACE FUNCTION func_name(�Ű�����)
        RETURN ������ ��
        IS
        BEGIN
          ����� 
          RETURN ������ ��;
        END;
        /
   
   4. TRIGGER : �ڵ� �̺�Ʈ ó��(INSERT, UPDATE, DELETE)

*/
-- �Լ������ϱ�
-- �μ���ȣ�� �Է� �޾� �ְ� �޿����� ����ϴ� �Լ��� �ۼ��϶�
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

-- �Լ� ����ϱ�
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

INSERT INTO score VALUES(1, '��ȣ��', 80, 90, 30);
INSERT INTO score VALUES(1, '������', 70, 90, 100);
INSERT INTO score VALUES(1, '������', 90, 90, 40);
INSERT INTO score VALUES(1, '������', 10, 100, 30);
INSERT INTO score VALUES(1, '�̼���', 100, 70, 80);
COMMIT;

SELECT * FROM score;

-- ���� �� rowSum
CREATE OR REPLACE FUNCTION rowSum(hak score.hakbun%TYPE)
RETURN NUMBER
IS
  s_sum score.hakbun%TYPE;
BEGIN
  SELECT kor+eng+math INTO s_sum FROM score WHERE hakbun=hak;
  RETURN s_sum;
END;
/

-- ���� ��� rowAvg
CREATE OR REPLACE FUNCTION rowAvg(hak score.hakbun%TYPE)
RETURN NUMBER
IS
  s_avg score.hakbun%TYPE;
BEGIN
  SELECT ROUND((kor+eng+math)/3,2) INTO s_avg FROM score WHERE hakbun=hak;
  RETURN s_avg;
END;
/

-- empDname ���
CREATE OR REPLACE FUNCTION empDname(e_deptno emp.deptno%TYPE)
RETURN VARCHAR2
IS
  e_dname   dept.dname%TYPE;
BEGIN
  SELECT dname INTO e_dname FROM dept WHERE deptno=e_deptno;
  RETURN e_dname;
END;
/

-- empLoc ���
CREATE OR REPLACE FUNCTION empLoc(e_deptno dept.deptno%TYPE)
RETURN VARCHAR2
IS 
  e_loc dept.loc%TYPE;
BEGIN 
  SELECT loc INTO e_loc FROM dept WHERE deptno=e_deptno;
  RETURN e_loc;
END;
/

-- empCount : emp���� �μ��� �ο����� ����ϴ� �Լ��� �ۼ��Ͽ���
CREATE OR REPLACE FUNCTION empCount(e_deptno emp.deptno%TYPE)
RETURN NUMBER
IS
  e_count emp.empno%TYPE;
BEGIN
  SELECT COUNT(*) INTO e_count  FROM emp WHERE deptno=e_deptno;
  RETURN e_count;
END;
/

-- empAvg : emp���� �μ��� ��� �޿��� ����ϴ� �Լ��� 
CREATE OR REPLACE FUNCTION empAvg(e_deptno  emp.deptno%TYPE)
RETURN NUMBER
IS 
  e_avg emp.empno%TYPE;
BEGIN
  SELECT AVG(sal) INTO e_avg FROM emp WHERE deptno=e_deptno;
  RETURN e_avg;
END;
/

-- empSum : �μ��� �޿� ��
CREATE OR REPLACE FUNCTION empSum(e_deptno emp.deptno%TYPE)
RETURN NUMBER
IS
  e_dsum  emp.empno%TYPE;
BEGIN
  SELECT SUM(sal) INTO e_dsum FROM emp WHERE deptno=e_deptno;
  RETURN e_dsum;
END;
/

-- �Լ� ��Ű�� ����
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

