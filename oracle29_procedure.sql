-- 2016.11.10

/*
  #PL/SQL 
    1. Procedure (기능 처리)
      1) 형식
        CREATE OR REPLACE PROCEDURE pro_name(매개변수)
        IS
          변수선언
        BEGIN
          구현부 (SQL)
          EXCEPTION: 예외처리
        END;  //종료
        
      2) 매개 변수
        - IN : 일반 변수 ==> 입력값 (default)
        - OUT : 포인터 변수 ==> 출력값
    
    2. CURSOR
      1) 개념 : 특정 SQL 문장을 처리한 결과를 담고 있는 영역을 가리키는 일종의 포인터
      
      2) 종류
        - 묵시적 커서(Implicit Cursor) : 오라클 내부에서 자동으로 생성되어 사용하는 커서
        - 명시적 커서(Explicit Cursor) : 사용자가 직접 정의해서 사용하는 커서 
      
      3) 속성
        - SQL%FOUND : 패치 로우 수가 1개 이상이면 TRUE를, 아니면 FALSE를 리턴
        - SQL%NOTFOUND : 패치 로우 수가 0이면 TRUE를, 아니면 FALSE를 리턴
        - SQL%ROWCOUNT : 영향을 받은 결과 집합의 로우 수 반환, 없으면 0을 반환
        - SQL%ISOPEN : 커서가 열려 있으면 TRUE를, 아니면 FALSE를 반환
        
      4) 커서변수
        - 커서를 변수에 할당해서 사용
        - 특징
           ==> 한 개 이상의 쿼리를 연결해서 사용 가능
           ==> 변수처럼 커서변수를 함수나 프로시져의 파라미터로 전달 가능
           ==> 커서 속성을 모두 사용 가능
        - 선언
           ==> SYS_REFCURSOR : 빌드 인 커서 타입
                   
    3. Function (결과 값 처리)
    
    4. Trigger (자동처리)
*/

-- 전체 목록 출력
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

-- TotalPage 출력
CREATE OR REPLACE PROCEDURE  boardTotalPage(
  pNumber   OUT   board.no%TYPE
)
IS  
BEGIN
  SELECT CEIL(COUNT(*)/10) INTO pNumber FROM board;
END;
/

-- 글쓰기 
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
      - 반복 기능 수행 처리 ==> 리턴형 존재하지 않음
      - 매개변수로 값을 받는다 ==> OUT
      - 형식 
          
          CREATE OR REPLACE PROCEDURE pro_name(매개변수)
          IS
            지역변수 선언
          BEGIN
            SQL문 선언
          END;
            
      - 매개변수  
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



