--2016.10.27 멀티 파일 업로드
DROP TABLE multiBoard CASCADE CONSTRAINTS ;

CREATE TABLE multiBoard(
  no        NUMBER PRIMARY KEY,
  name      VARCHAR2(34) NOT NULL ,
  subject   VARCHAR2(2000) NOT NULL ,
  content   CLOB NOT NULL ,
  pwd       VARCHAR2(10) NOT NULL,
  regdate   DATE,
  hit       NUMBER,
  filename  VARCHAR2(4000),
  filesize  VARCHAR2(4000),
  filecount NUMBER
);

ALTER TABLE multiBoard MODIFY(regdate DATE DEFAULT SYSDATE);
COMMIT;

INSERT INTO multiBoard (no, name, subject, content, pwd) VALUES ((SELECT NVL(MAX(no)+1, 1) FROM multiBoard), '김호현', '테스트', '테스트입니다.', 1234);
COMMIT;

UPDATE multiBoard SET hit=hit+1 WHERE no=1;
COMMIT;

DELETE FROM multiBoard WHERE no=1;

SELECT * FROM multiBoard WHERE no=1;

SELECT no, subject, name, regdate, hit, num
FROM (SELECT no, subject, name, regdate, hit, Rownum as num
FROM (SELECT no, subject, name, regdate, hit
FROM multiBoard ORDER BY no DESC))
WHERE num BETWEEN 11 AND 20;

-- 첨부파일 저장 a.jpg, b.jpg
