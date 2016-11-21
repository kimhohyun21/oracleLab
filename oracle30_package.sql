/*
  # PL/SQL�� �⺻ ����
    - �ҽ����α׷��� �⺻ ���� : ���
    - �̸� : ����� ��Ī, ������ �͸��� ����� ��
    - �����, �����, ����ó���η� ����
    
    1. �����
      1) ����
        - DECLARE�� ���� 
        - ����ο� ����ó���ο��� ����ϴ� ���� ����,���, Ŀ�� ���� ����
        - ���� ����� �� ���� ���� �ݵ�� �����ݷ�(;)�� ���� ��
        
    2. �����
      1) ����
        - ���� ������ ó���ϴ� �κ�
        - �� �� ����(�Ϲ� SQL��, ���Ź�, �ݺ���)
        - DML���� ��� ����
  
    3. ����ó���� 
      1) ����
        - EXCEPTION���� ����
        - ����ο��� ���� ó�� �� ���� �߻��� ó�� ���� ���
        - ���� ����
      
      2) ���� ����
        - ������ �� �߻��ϴ� ���� ���� ==> ��������
        - ��Ÿ�� ���� ==> ����(EXCEPTION)
      
      3) ���� ó�� ����
          EXCEPTION WHEN ���ܸ� 1 THEN ����ó�� ����1
                           WHEN ���ܸ� 2 THEN ����ó�� ����2
                            ......
                            WHEN OTHERS THEN ����ó�� ����n
      4) �ý��� ���� 
        - �̸� ���ǵ� ����
          ==> NO_DATA_FOUND : SELECT INTO�� �����Ͱ� �Ѱǵ� ���� ��� (ORA-01403)
          ==> TOO_MANY_ROWS : SELECT INTO�� ����� �� �ο� �̻��� �� (ORA-01403)
                .......
*/
/*
SET SERVEROUTPUT ON;

ACCEPT pno PROMPT '���: '
DECLARE
  vempno        emp.empno%TYPE:=&pno;
  vname         emp.ename%TYPE;
BEGIN
  SELECT ename INTO vname FROM emp WHERE empno LIKE '%'||vempno||'%';
  DBMS_OUTPUT.PUT_LINE('�̸�:'||vname);
EXCEPTION 
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('����� ã�� �� �����ϴ�.');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('�� �� �̻��� ����� ���� �մϴ�.');
END;
/
*/
/*
  # PROCEDURE
    : ������ ó���� �����ϴ� ���� ���α׷��� �� ����
    
  # PACKAGE(��Ű��)
    1. ORACLE PACKAGE
    2. ��Ű���� �������� ���� �Լ��� ���ν����� �ϳ��� �׷����� ����δ� ����
    3. ��Ű�� ����ο� ��ü�η� ����  
      1) ��Ű�� ����� : �ش� ��Ű������ ����� �Լ��� ���ν��� ���� � ���� ���Ǹ� ����,
        CREATE [OR REPLACE] PACKAGE package_name
        IS | AS
          public type and item declarations
          subprogame bodies
        END package_name;
          
      2) ��Ű�� ��ü�� : ����� �Լ��� ���ν��� ���� ���� �����Ǵ� �κ�.
        CREATE [OR REPLACE] PACKAGE BODY package_name
        IS | AS
          public type and item declarations
          subprogame bodies
        END package_name;
        
    4. ��Ű�� ����
    5. ��Ű�� ����
      DROP PACKAGE pakage_name;
      DROP PACKAGE BODY pakage_name;
          
  3. FUNCTION
  4. TRIGGER

*/
-- ��Ű�� ��� ��
-- emp ���̺��� �� �޿��� �հ�� ��� �޿��� ���ϴ� ��Ű���� �ۼ��϶�
-- ��Ű�� ����� : emp_sum, emp_avg ���ν���
/*
-- �����
CREATE OR REPLACE PACKAGE emp_total
AS 
  PROCEDURE emp_sum;
  PROCEDURE emp_avg;
END emp_total;
/
*/
/*
-- ��ü��
CREATE OR REPLACE PACKAGE BODY emp_total
AS 
  PROCEDURE emp_sum
  IS 
    CURSOR emp_total_sum IS
      SELECT COUNT(*), SUM(NVL(sal, 0)) FROM emp;
    total_num NUMBER;
    total_sum NUMBER;
  BEGIN
    OPEN emp_total_sum;
    FETCH emp_total_sum INTO total_num, total_sum;
    DBMS_OUTPUT.PUT_LINE('�� �ο��� :'||total_num||', �޿��� �հ�'||total_sum);
  END emp_sum; -- procedure ��
  PROCEDURE emp_avg
  IS 
    CURSOR emp_total_avg IS
      SELECT COUNT(*), AVG(NVL(sal, 0)) FROM emp;
    total_num NUMBER;
    total_avg NUMBER;
  BEGIN
    OPEN emp_total_avg;
    FETCH emp_total_avg INTO total_num, total_avg;
    DBMS_OUTPUT.PUT_LINE('�� �ο��� :'||total_num||', �޿��� ���'||total_avg);
  END emp_avg; -- procedure ��
END emp_total; -- ��Ű�� ��
/
*/
/*
CREATE OR REPLACE PACKAGE pkg_board
IS
  PROCEDURE boardListData(
    pStart        board.no%TYPE,
    pEnd         board.no%TYPE,
    pResult      OUT  SYS_REFCURSOR  
  );
  PROCEDURE  boardTotalPage(
    pNumber   OUT   board.no%TYPE
  );
  PROCEDURE  boardInsert(
    pName    board.name%TYPE,
    pSub      board.subject%TYPE,
    pCont     board.content%TYPE,
    pPwd      board.pwd%TYPE
  );
  PROCEDURE boardContentData(
    pNo             board.no%TYPE,
    pResult OUT  SYS_REFCURSOR
  );
  PROCEDURE boardUpdate(
    pNo             board.no%TYPE,
    pName          board.name%TYPE,
    pSubject        board.subject%TYPE,
    pContent        board.content%TYPE,
    pPwd             board.pwd%TYPE,
    pResult           OUT VARCHAR2
  );
  PROCEDURE boardUpdateData(
    pNo             board.no%TYPE,
    pResult OUT  SYS_REFCURSOR
  );
  PROCEDURE boardDelete(
    pNo               board.no%TYPE,
    pPwd              board.pwd%TYPE,
    pResult           OUT board.name%TYPE
  );
END pkg_board;
/ 
*/

CREATE OR REPLACE PACKAGE BODY pkg_board
AS
  PROCEDURE  boardListData(
    pStart        board.no%TYPE,
    pEnd         board.no%TYPE,
    pResult      OUT  SYS_REFCURSOR  
  )
  IS  
  BEGIN
    OPEN pResult FOR
      SELECT no, subject, name, regdate, hit, num
      FROM (SELECT no, subject, name, regdate, hit, Rownum as num
      FROM (SELECT no, subject, name, regdate, hit 
      FROM board ORDER BY no DESC))
      WHERE num BETWEEN pStart AND pEnd;
  END boardListData;
  
  PROCEDURE  boardTotalPage(
    pNumber   OUT   board.no%TYPE
  )
  IS  
  BEGIN
    SELECT CEIL(COUNT(*)/10) INTO pNumber FROM board;
  END boardTotalPage;
  
  PROCEDURE  boardInsert(
    pName    board.name%TYPE,
    pSub      board.subject%TYPE,
    pCont     board.content%TYPE,
    pPwd      board.pwd%TYPE
  )
  IS  
  BEGIN
    INSERT INTO Board (no, name, subject, content, pwd, regdate, hit)VALUES (
      (SELECT NVL(MAX(no)+1, 1) FROM board), 
      pName, pSub, pCont, pPwd, SYSDATE, 0
    );
    COMMIT;
  END boardInsert;
  
  PROCEDURE boardContentData(
    pNo             board.no%TYPE,
    pResult OUT  SYS_REFCURSOR
  )
  IS
  BEGIN
    UPDATE board SET hit=hit+1 WHERE no=pNo;
    COMMIT;
    
    OPEN pResult FOR
      SELECT no, name, subject, content, regdate, hit FROM board WHERE no=pNo;
  END boardContentData;
  
  PROCEDURE boardUpdate(
    pNo             board.no%TYPE,
    pName          board.name%TYPE,
    pSubject        board.subject%TYPE,
    pContent        board.content%TYPE,
    pPwd             board.pwd%TYPE,
    pResult           OUT VARCHAR2
  )
  IS
    db_pwd          board.pwd%TYPE;
  BEGIN
      SELECT pwd INTO db_pwd FROM board WHERE no=pNo;
      IF(pPwd=db_pwd) THEN
        pResult := 'true';
        UPDATE board SET name=pName, subject=pSubject, content=pContent WHERE no=pNo;
        COMMIT;
      ELSE
        pResult := 'false';
      END IF;
  END boardUpdate;
  
  PROCEDURE boardUpdateData(
    pNo             board.no%TYPE,
    pResult OUT  SYS_REFCURSOR
  )
  IS 
  BEGIN
     OPEN pResult FOR
      SELECT no, name, subject, content FROM board WHERE no=pNo;
  END boardUpdateData;
  
  PROCEDURE boardDelete(
    pNo               board.no%TYPE,
    pPwd              board.pwd%TYPE,
    pResult           OUT board.name%TYPE
  )
  IS
    db_pwd          board.pwd%TYPE;
  BEGIN
      SELECT pwd INTO db_pwd FROM board WHERE no=pNo;
      IF(pPwd=db_pwd) THEN
        pResult := 'true';
        DELETE FROM board WHERE no=pNo;
      ELSE
       pResult := 'false';
      END IF;
  END boardDelete;
END pkg_board;
/  



























































