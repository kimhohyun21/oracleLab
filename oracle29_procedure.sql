-- 2016.11.10

/*
  #PL/SQL 
    1. Procedure (��� ó��)
      1) ����
        CREATE OR REPLACE PROCEDURE pro_name(�Ű�����)
        IS
          ��������
        BEGIN
          ������ (SQL)
          EXCEPTION: ����ó��
        END;  //����
        
      2) �Ű� ����
        - IN : �Ϲ� ���� ==> �Է°� (default)
        - OUT : ������ ���� ==> ��°�
    
    2. CURSOR
      1) ���� : Ư�� SQL ������ ó���� ����� ��� �ִ� ������ ����Ű�� ������ ������
      
      2) ����
        - ������ Ŀ��(Implicit Cursor) : ����Ŭ ���ο��� �ڵ����� �����Ǿ� ����ϴ� Ŀ��
        - ����� Ŀ��(Explicit Cursor) : ����ڰ� ���� �����ؼ� ����ϴ� Ŀ�� 
      
      3) �Ӽ�
        - SQL%FOUND : ��ġ �ο� ���� 1�� �̻��̸� TRUE��, �ƴϸ� FALSE�� ����
        - SQL%NOTFOUND : ��ġ �ο� ���� 0�̸� TRUE��, �ƴϸ� FALSE�� ����
        - SQL%ROWCOUNT : ������ ���� ��� ������ �ο� �� ��ȯ, ������ 0�� ��ȯ
        - SQL%ISOPEN : Ŀ���� ���� ������ TRUE��, �ƴϸ� FALSE�� ��ȯ
        
      4) Ŀ������
        - Ŀ���� ������ �Ҵ��ؼ� ���
        - Ư¡
           ==> �� �� �̻��� ������ �����ؼ� ��� ����
           ==> ����ó�� Ŀ�������� �Լ��� ���ν����� �Ķ���ͷ� ���� ����
           ==> Ŀ�� �Ӽ��� ��� ��� ����
        - ����
           ==> SYS_REFCURSOR : ���� �� Ŀ�� Ÿ��
                   
    3. Function (��� �� ó��)
    
    4. Trigger (�ڵ�ó��)
*/

-- ��ü ��� ���
CREATE OR REPLACE PROCEDURE  boardListData(
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
END;
/

-- TotalPage ���
CREATE OR REPLACE PROCEDURE  boardTotalPage(
  pNumber   OUT   board.no%TYPE
)
IS  
BEGIN
  SELECT CEIL(COUNT(*)/10) INTO pNumber FROM board;
END;
/

-- �۾��� 
CREATE OR REPLACE PROCEDURE  boardInsert(
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
END;
/

/*
    #Procedure 
      - �ݺ� ��� ���� ó�� ==> ������ �������� ����
      - �Ű������� ���� �޴´� ==> OUT
      - ���� 
          
          CREATE OR REPLACE PROCEDURE pro_name(�Ű�����)
          IS
            �������� ����
          BEGIN
            SQL�� ����
          END;
            
      - �Ű�����  
         ==> IN
         ==> OUT
         ==> INOUT

*/

CREATE OR REPLACE PROCEDURE boardContentData(
  pNo             board.no%TYPE,
  pResult OUT  SYS_REFCURSOR
)
IS
BEGIN
  UPDATE board SET hit=hit+1 WHERE no=pNo;
  COMMIT;
  
  OPEN pResult FOR
    SELECT no, name, subject, content, regdate, hit FROM board WHERE no=pNo;
END;
/

CREATE OR REPLACE PROCEDURE boardUpdateData(
  pNo             board.no%TYPE,
  pResult OUT  SYS_REFCURSOR
)
IS 
BEGIN
   OPEN pResult FOR
    SELECT no, name, subject, content FROM board WHERE no=pNo;
END;
/

CREATE OR REPLACE PROCEDURE boardUpdate(
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
END;
/

CREATE OR REPLACE PROCEDURE boardDelet(
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
END;
/



