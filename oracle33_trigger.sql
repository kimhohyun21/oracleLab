/*
    4. Ʈ����(trigger)
      1) ����
        - �������� ����(Insert, Delete, Upadte==>triggering event(Ʈ���Ÿ� ���))���� ����� ��,
          �ڵ����� ���� ����Ǵ� ���ν���
        - ������, ������, �������� ������ PL/SQL ��� ������ ������
           �����ͺ��̽��� ����Ǿ�� ��
        - Ư�� ���(Insert, Delete, Update)�� �߻��� ������,
          �ڵ�����(������)���� �ش� PL/SQL���(trigger)�� �����
        - ���� ���α׷�
    
      2) ����: FOR EACH ROW �ɼ��� ��� ������ ������ ==> ����ϸ� �� Ʈ����
        - ���� ����(Statement Level)�� Ʈ����
            ==> ���� �ѹ��� Ʈ���Ÿ� �����Ű�� ���
            ==> ���� ����� Ʈ����
            
        - �෹��(Row Level) Ʈ����
            ==> �����Ͱ� ���� ���� ���� �� �� ���� ���� Ʈ���Ÿ� �߻���Ű�� ���
            ==> ���� ����� Ʈ����
            ==> �÷��� �� ������ ���� ����� ������ ����
            ==> ���� �� ������ ���� ���� ������ �� �ִ� Ʈ����
            ==> ���� ���� ����, ���� �Ǵ� �����ϱ� ���� ���
            ==> �� Ʈ���ſ��� ���� �����͸� �����ϱ� ���� ����ϴ� ����
                  a) : old
                  b) : new
            ==> SQL���� ���� ��� ���
                  a) INSERT���� ��� : �Է��� �������� ���� ":new.�÷��̸�"�� ����
                  b) UPDATE���� ��� : ���� ������ ":old.�÷��̸�"�� ����ǰ�, ���ο� ������ ���� ":new.�÷��̸�"�� ����
                  c) DELETE���� ��� : �����ϴ� �÷����� "old.�÷��̸�"�� ����
    
      3) Ʈ���� Ÿ�̹�
        - before Ÿ�̹�
          ==> � ���̺� � Ʈ��Ŀ �̺�Ʈ���� ����� ��
                �ش� ������ ����Ǳ� ���� Ʈ���Ű� ������ �ִ� 
                begin~end ������ ���� �����
                
        - after Ÿ�̹�
        
      4) ����
              CREATE OR REPLACE TRIGGER t_insert
         --> timing
         --> event1[or event2]
         --> on {tablename}
         --> ����(statement or row)
              DECLARE
         --> ��������     
              BEGIN
         --> trigger body
         --> ���ε� ����
              END;
      
      5) ����Ŭ Ʈ���� ������
        - DB���̺� ������������ ���� ���Ἲ, ������ ���Ἲ���� ������ ���� ������ �����ϴ� ���
        - DB ���̺긣�� �����Ϳ� ����� �۾��� ����, ����
        - DB ���̺� ����� ��ȭ�� ���� �ʿ��� �ٸ� ���α׷��� �����ϴ� ���      
                 
      6) Ʈ���� �̺�Ʈ
        - INSERT
        - DELETE
        - UPDATE
        
        
*/

DROP TABLE ��ǰ CASCADE CONSTRAINTS;
CREATE TABLE ��ǰ(
  ��ǰ�ڵ�    CHAR(6)  PRIMARY KEY,
  ��ǰ��       VARCHAR2(20)  NOT NULL,
  ������       VARCHAR2(20),
  �Һ��ڰ��� NUMBER,
  ������    NUMBER DEFAULT 0
);

DROP TABLE �԰� CASCADE CONSTRAINTS;	
CREATE TABLE �԰�(
  �԰��ȣ     NUMBER PRIMARY KEY,
  ��ǰ�ڵ�     CHAR(6),
  �԰�����     CHAR(8),
  �԰����     NUMBER,
  �԰�ܰ�     NUMBER,
  �԰�ݾ�     NUMBER
);

DROP TABLE ��� CASCADE CONSTRAINTS;
CREATE TABLE ���(
  ����ȣ    NUMBER PRIMARY KEY,
  ��ǰ�ڵ�    CHAR(6),
  �������    CHAR(8),
  ������    NUMBER,
  ���ܰ�    NUMBER,
  ���ݾ�    NUMBER
);


INSERT INTO ��ǰ VALUES('A00001', '��Ź��','�缺',500,0);
INSERT INTO ��ǰ VALUES('A00002', '�����','HG',1000,0);
INSERT INTO ��ǰ VALUES('A00003', '��Ʈ��','HP',500,0);
INSERT INTO ��ǰ VALUES('A00004', '����Ʈ��','�缺',900,0);
INSERT INTO ��ǰ VALUES('A00005', 'TV','�����',400,0);
COMMIT;

SELECT * FROM ��ǰ;

-- ��� ���� ����(�԰�) Ʈ����
CREATE OR REPLACE TRIGGER t_insert
  AFTER INSERT ON �԰�    -- '�԰�' ���̺� �Է��ϰ� ���� Ʈ���� ����.
  FOR EACH ROW             -- FOR EACH ROW => �� Ʈ���� ����.
  
  DECLARE
    v_cnt   NUMBER;
    v_m     VARCHAR2(20);
    v_g     VARCHAR2(20);
BEGIN
  -- trigger body
  -- ���ε� ����
  
  SELECT ������,��ǰ�� INTO v_m,v_g FROM ��ǰ
  WHERE ��ǰ�ڵ�=:NEW.��ǰ�ڵ�;
  
  UPDATE ��ǰ SET ������=������+:NEW.�԰����
  WHERE ��ǰ�ڵ�=:NEW.��ǰ�ڵ�;
END;
/

SELECT * FROM �԰�;
SELECT * FROM ��ǰ;

INSERT INTO �԰� VALUES (1, 'A00001', '20161118',10,500,5000);
INSERT INTO �԰� VALUES (2, 'A00002', '20161118',20,1000,20000);
COMMIT;

-- �԰� ���� ���� Ʈ����
CREATE OR REPLACE TRIGGER t_update
  AFTER UPDATE ON �԰�
  FOR EACH ROW
BEGIN
  UPDATE ��ǰ SET ������=������+(-:OLD.�԰����+:NEW.�԰����)
  WHERE ��ǰ�ڵ�=:NEW.��ǰ�ڵ�;
END;
/

UPDATE �԰� SET �԰����=3 WHERE �԰��ȣ=1;
COMMIT;



CREATE OR REPLACE TRIGGER t_output_insert
  AFTER INSERT ON ���
  FOR EACH ROW
BEGIN
  UPDATE ��ǰ SET ������=������-:NEW.������
  WHERE ��ǰ�ڵ�=:NEW.��ǰ�ڵ�;
END;
/

INSERT INTO ��� VALUES(1,'A00001','20161118', 2, 500, 1000);
COMMIT;

SELECT * FROM �԰�;
SELECT * FROM ���;
SELECT * FROM ��ǰ;