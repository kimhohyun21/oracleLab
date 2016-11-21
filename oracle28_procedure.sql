SET SERVEROUTPUT ON;

DECLARE
BEGIN
  FOR no In 1..9 LOOP -- FOR ��
      IF(MOD(no,2)=0) THEN
      DBMS_OUTPUT.PUT_LINE(no);
      END IF;
    END LOOP;
END;
/

/*
   #PL/SQL 
    1. ���� ���� ����
      1) �Ϲ� ����
        : ���� �������� 
          ==> empno NUMBER(4)
          
      2) ���� �÷� ���� ��� 
        : %TYPE 
          ==> empno emp.empno%TYPE
          
      3) ��ü ������ �� 
        : %ROWTYPE 
          ==> vemp emp%ROWTYPE
          
      4) ���ϴ� ������(����� ����)
        : RECODE
          ==> TYPE ������ IS RECODE(
                  empno NUMBER(4),
                  ename VARCHAR2(20)
                )
                
      5) ������
          : ��ȣ ��� :=
            ==> empno NUMBER(4) := 4000
 
    2. ��� 
      1) IF, IF~ELSE, IF ELSIF~ELSE
      2) CASE WHEN~
      
    3. BLOCK ���� ����
        ����� : ���� ����
        ������ : SQL ����
        ����ó����
        ����
        ===============
        DELCARE 
          ���� ����
        BEGIN
          SQL ����
        END
   
*/

/*
    emp3 ���̺��� empno�� 7900���� ����� 
    empno, ename, sal�� ��ȸ�Ͽ� ȭ�鿡 ����Ͻÿ�
*/

-- ���̺� ����
CREATE TABLE emp3 AS SELECT empno, ename, sal FROM emp;
SELECT * FROM emp3;

-- PL/SQL�� ������ ��ȸ
DECLARE
  vno       emp3.empno%TYPE;
  vname   emp3.ename%TYPE;
  vsal      emp3.sal%TYPE;
BEGIN
  SELECT empno, ename, sal INTO vno, vname, vsal FROM emp3 WHERE empno=7900;
  DBMS_OUTPUT.PUT_LINE(vno||'     '||vname||'      '||vsal);
END;
/

/*
  RECODE, ROWTYPE ==> ~VO
  CURSOR ==> List ==> ROW�� ����ü

  #CURSOR 
    1. ��� �ܰ� 
      1) CURSOR ����
          CURSOR cur_name IS
            SELECT * FROM emp;
      
      2) CURSOR ����
          OPEN cur_name;
      
      3) ���� 
          FETCH cur_name;
            ==> %NOTFOUND
                  **CURSOR ����
                      %NOTFOUND �� �̻� �����Ͱ� ���� ���
                      %FOUND
                      %ISOPEN
                      %ROWCOUNT
      
      4) CURSOR �ݱ�
          CLOSE cur_name;
          
   ==> CURSOR�� ViEW�� ��������� �޸𸮿� ���� (�Ͻ���)       
*/

DECLARE 
  vempno      emp.empno%TYPE;
  vename      emp.ename%TYPE;
  vsal           emp.sal%TYPE;
  CURSOR c1 IS
    SELECT empno, ename, sal FROM emp; -- Ŀ�� ����

BEGIN
  OPEN c1;  -- Ŀ�� ����
  LOOP
    FETCH c1 INTO vempno, vename, vsal;    -- Ŀ������ �� ������ set�ϱ�
    EXIT WHEN c1%NOTFOUND;                  -- �ݺ��� �ߴ� ���� Ŀ�� ���� ���̻� ���� ��
    DBMS_OUTPUT.PUT_LINE(vempno||'   '||vename||'   '||vsal);  -- ��ũ��Ʈ�� ���
  END LOOP;
END;
/

DECLARE 
  vempno    NUMBER(4);
  vename    VARCHAR2(20);
  vsal         NUMBER(7);
  
  CURSOR c1 IS 
    SELECT empno, ename, sal FROM emp WHERE deptno=20;

BEGIN
  OPEN c1;
    DBMS_OUTPUT.PUT_LINE('��ȣ     �̸�      �޿�');
    LOOP
      FETCH c1 INTO vempno, vename, vsal;
      EXIT WHEN c1%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(vempno||'   '||vename||'   '||vsal);  
    END LOOP;
    CLOSE c1;
END;
/

/*
  2.���ν���(Procedure)
    1) ����
      - ������ Ư�� ó���� �����ϴ� ���� ���α׷��� �� ����.
      - �ܵ�(standalone)���� �����̰ų� �ٴ� ���ν���, �Ǵ� �ٸ� ����, �� ��� ȣ��Ǿ� �����.
    
    2) ��������
        CREATE [OR REPLACE] PROCEDURE  ���ν��� �̸�
        [
            �Ķ����1 ������ Ÿ��1
            �Ķ����2 ������ Ÿ��2
            ......
        ]
        IS | AS
        PL/SQL BLOCK;
        
      3) �Ű�����
        - IN : �Ϲݺ��� (�Է°�) ���ǰ�, �߰�, ����, ����
        - OUT : ������ ���� (�޴°�)
        - INOUT : IN, OUT�� ���ÿ� ���
*/

-- ���̺� ����
CREATE TABLE emp2 AS SELECT empno, ename, job, sal, deptno FROM emp;
SELECT * FROM emp2;

-- PROCEDURE ����
CREATE OR REPLACE PROCEDURE  update_20
IS
BEGIN
  UPDATE emp2 SET job='TEST' WHERE deptno=20;
END;
/

-- PROCEDURE ����
execute update_20;

DROP TABLE myAddr;
CREATE TABLE myAddr(
  no NUMBER PRIMARY KEY,
  name VARCHAR2(20) NOT NULL,
  addr VARCHAR2(100) NOT NULL,
  tel VARCHAR2(20) NOT NULL,
  gender VARCHAR2(10) CHECK(gender IN('��', '��'))
);

CREATE OR REPLACE PROCEDURE addrInsert(
  pname IN myAddr.name%TYPE,
  paddr IN myAddr.addr%TYPE,
  ptel IN myAddr.tel%TYPE,
  pgender IN myAddr.gender%TYPE
)
IS
BEGIN
  INSERT INTO myAddr VALUES(
    (SELECT NVL(MAX(no)+1, 1) FROM myAddr), 
    pname, paddr, ptel, pgender
  );
  COMMIT;
END;

EXECUTE addrInsert('������', '����', '010-1234-5678','��');

-- ���ο� Procedure ����
CREATE OR REPLACE PROCEDURE addrAllData(
  pResult out SYS_REFCURSOR 
)
IS
BEGIN
  OPEN pResult FOR
    SELECT * FROM myAddr;
END;
/











































