-- 2016.11.08 PL/SQL
/*

  #���� ���� �߿� �� �����صξ�� �ϴ� ����
  
  1. JAVA  
    1) ��ü
    2) �����ε�/�������̵�
    3) �߻�Ŭ���� /�������̽�
    4) ����ó��(����ó��)
    5) Ʈ�����
    6) ����ȭ/ĸ��ȭ
    7) ���/����
    8) ����(�̱���, ���丮)
  
  2. SQL : ����Ŭ ���� ==>9i, 10g, 11g, 12c [ i(internet), g(grid), c(component = i+g)]
  
    1) KEY (UNIQUE)
    2) PROCEDURE, FUNCTION, TRIGGER
    3) TRANSACTION
  
  #JSP : MVC
  
  #SPRING : IOC, �����̳�, DI, AOP  
  
  #��Ÿ : ������, �ΰ����� ��
  
*/

/*
   #SQL ��ɾ�
    
    DQL : SELECT * | column1,....
             FROM ���̺� 
            [
                WHERE
                GROUP BY
                HAVING
                ORDER BY
            ]
            ==> JOIN, SUBQUERY
                  ====
                  INNER JOIN,   OUTER JOIN(INNER JOIN +@)
                  ==========   ===========
                  EQUI_JOIN     LEFT OUTER JOIN
                  
            ==> ������
                  BETWEEN ~ AND
                  LIKE
                  IN
                  IS NULL, IS NOT NULL
    
    DML : INSERT, UPDATE, DELETE
             INSERT INT table�� VALUES(....)
             UPDATE table�� SET
             ����
             WHERE
             DELETE FROM table�� WHERE~
    
    DDL : CREATE, DROP, ALTER(ADD, MODIFY, DROP)
             RENAME, TRUNCATE
    
    DCL : GRANT, REVOKE
    
    TCL : COMMIT, ROLLBACK
*/

/*
   #����Ŭ
    1. PL / SQL
        1) ���
          - Procedural Language / Structured Query Language
          - �����ͺ��̽� �������α׷� �ۼ��ϴµ� ����ϴ� ����Ŭ SQL ���� ���.
          - ����, ����, ����� ���� ���α׷��� ��� �߰�
          
        2) ����
          - �����(DECLARE) 
              ���� ����
          
          - �����, ������ 
              BEGIN 
               SQL���� ����
              END
           
           - ����ó����(EXCEPTION) : ���� ����
        
        3) ����
          - �͸� ��� : Anonymous PL/SQL Block
                           ��ȸ������ ����� ��� ���� ���
          - ����� ��� :  Stored PL/SQL Block
                              �������� �Ľ��ؼ� ������ ����
                              �ֱ������� �ݺ��ؼ� ����� ���
                              ==> ���� ���α׷�, ���α׷� ����
      
        4) ���� ���� ���
          - ��Į�� ���� ���� 
              : id VARCHAR2(10)
          - ������ �������� �б� (=column ����)
              : empno, emp.empno%TYPE
          - ROW ����
              : emp emp%ROWTYPE
          - ����� ���� : RECODE
          - ��ü ������ ������ : CURSOR
        
        5) ���
          - ���ǹ� : if~else
          - �ݺ��� : FOR WHILE LOOP
          - 
          
    2. PROCEDURE
    3. TRIGGER
*/

SET SERVEROUTPUT ON; 
-- ó���� ������ ȭ�鿡 ǥ��

DECLARE                         -- ����� ���� ��
  vno       NUMBER(4);       -- db���� ����� �������
  vname   VARCHAR2(10);    -- ������ ���� 2�� ���� ��
  
BEGIN                             -- ����� ���۵�
  SELECT empno, ename INTO vno, vname FROM emp WHERE empno=7900;

  DBMS_OUTPUT.PUT_LINE(vno||'        '||vname);
END;                              -- ����� ����
/                                    -- PL/SQL ����

DECLARE                       
  vempno       emp.empno%TYPE;       
  vename         emp.ename%TYPE;
  vjob            emp.job%TYPE;

BEGIN 
  SELECT empno, ename, job INTO vempno, vename, vjob FROM emp WHERE empno=7788;
  
  DBMS_OUTPUT.PUT_LINE('******** ��� *********');
  DBMS_OUTPUT.PUT_LINE('��� : ' ||vempno);
  DBMS_OUTPUT.PUT_LINE('�̸� : ' ||vename);
  DBMS_OUTPUT.PUT_LINE('���� : ' ||vjob);
END;
/

ACCEPT pno PROMPT '���:' 
-- '��� :' �� ���� �޾Ƽ� pno�� �����ϰڴ�
DECLARE
  vemp      emp%ROWTYPE;
  vempno   emp.empno%TYPE := &pno;    
-- pno�� ����� ���� empno�� �����ϰڴ�
BEGIN
  SELECT * INTO vemp FROM emp WHERE empno=vempno;
  
  DBMS_OUTPUT.PUT_LINE('******** ��� *********');
  DBMS_OUTPUT.PUT_LINE('��� : ' ||vemp.empno);
  DBMS_OUTPUT.PUT_LINE('�̸� : ' ||vemp.ename);
  DBMS_OUTPUT.PUT_LINE('���� : ' ||vemp.job);
  DBMS_OUTPUT.PUT_LINE('�Ի��� : ' ||vemp.hiredate);
  DBMS_OUTPUT.PUT_LINE('�޿� : ' ||vemp.sal);
END;
/

DECLARE
--VO ����
  TYPE edsRecord is RECORD(
    empno     emp.empno%TYPE,
    ename     emp.ename%TYPE,
    job          emp.job%TYPE,
    dname     dept.dname%TYPE,
    loc         dept.loc%TYPE,
    grade     salgrade.grade%TYPE
  );

-- edsRecord eds=new edsRecord(); ����
eds edsRecord;

BEGIN 
  SELECT empno, ename, job, dname, loc, grade INTO eds FROM emp, dept, salgrade
  WHERE emp.deptno=dept.deptno AND sal BETWEEN losal AND hisal
  AND empno=7788;
  
   DBMS_OUTPUT.PUT_LINE('******** ��� *********');
   DBMS_OUTPUT.PUT_LINE('��� : '||eds.empno);
   DBMS_OUTPUT.PUT_LINE('�̸� : '||eds.ename);
   DBMS_OUTPUT.PUT_LINE('���� : '||eds.job);
   DBMS_OUTPUT.PUT_LINE('�μ� : '||eds.dname);
   DBMS_OUTPUT.PUT_LINE('�ٹ��� : '||eds.loc);
   DBMS_OUTPUT.PUT_LINE('��� : '||eds.grade);
END;
/
  
/*
  #���ǹ�
    IF(���ǹ�) THEN
      SQL ��
    END IF
*/  
DECLARE 
  vempno NUMBER(4);
  vename VARCHAR2(20);
  vdeptno NUMBER(2);
  vdname VARCHAR2(20) :=NULL;

BEGIN 
  SELECT empno, ename, deptno INTO vempno, vename, vdeptno FROM emp
  WHERE empno=7782;
  IF (vdeptno=10) THEN
    vdname := '���ߺ�';
  END IF;
  IF (vdeptno=20) THEN
    vdname := '�ѹ���';
  END IF;
  IF (vdeptno=30) THEN
    vdname := '������';
  END IF;
  IF (vdeptno=40) THEN
    vdname := '��ȹ��';
  END IF;
  
   DBMS_OUTPUT.PUT_LINE('******** ��� *********');
   DBMS_OUTPUT.PUT_LINE('��� : '||vempno);
   DBMS_OUTPUT.PUT_LINE('�̸� : '||vename);
   DBMS_OUTPUT.PUT_LINE('�μ��� : '||vdname);
END;
/

/*
  #���ǹ�
    IF(���ǹ�) THEN
      SQL ��
    ELSIF(���ǹ�) THEN
      SQL ��
    ELSIF(���ǹ�) THEN
      SQL ��
    ELSIF(���ǹ�) THEN
      SQL ��
    END IF
*/  
DECLARE 
  vempno NUMBER(4);
  vename VARCHAR2(20);
  vdeptno NUMBER(2);
  vdname VARCHAR2(20) :=NULL;

BEGIN 
  SELECT empno, ename, deptno INTO vempno, vename, vdeptno FROM emp
  WHERE empno=7782;
  
  IF (vdeptno=10) THEN
    vdname := '���ߺ�';
  ELSIF (vdeptno=20) THEN
    vdname := '�ѹ���';
  ELSIF (vdeptno=30) THEN
    vdname := '������';
  ELSIF (vdeptno=40) THEN
    vdname := '��ȹ��';
  END IF;
  
   DBMS_OUTPUT.PUT_LINE('******** ��� *********');
   DBMS_OUTPUT.PUT_LINE('��� : '||vempno);
   DBMS_OUTPUT.PUT_LINE('�̸� : '||vename);
   DBMS_OUTPUT.PUT_LINE('�μ��� : '||vdname);
END;
/


-- IF ~ ELSE

DECLARE
  vempno  NUMBER(4);
  vename  VARCHAR2(20);
  vcomm   emp.comm%TYPE;

BEGIN 
  SELECT empno, ename, comm INTO vempno, vename, vcomm FROM emp
  WHERE empno=7654;
  IF(vcomm>0) THEN
    DBMS_OUTPUT.PUT_LINE(vename||'���� �������� '||vcomm||'�Դϴ�.');
  ELSE 
    DBMS_OUTPUT.PUT_LINE(vename||'���� �������� �����ϴ�.');
  END IF;
END;
/









