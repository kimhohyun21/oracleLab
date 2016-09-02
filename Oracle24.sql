-- 2016.09.01 파일 업로드 다운로드
/*

   no        PK
   name      NN
   subject   NN
   content   NN
   pwd       NN
   regDate   DEFAULT
   hit       DEFAULT
   filename
   filesize

*/

DROP TABLE dataBoard;
CREATE TABLE dataBoard(
  no NUMBER,
  name VARCHAR2(34) CONSTRAINT db_name_NN NOT NULL,
  subject VARCHAR2(4000) CONSTRAINT db_sub_nn NOT NULL,
  content CLOB CONSTRAINT db_cont_NN NOT NULL,
  pwd VARCHAR2(10) CONSTRAINT db_pwd_NN NOT NULL,
  regDate DATE DEFAULT SYSDATE,
  hit NUMBER DEFAULT 0,
  filename VARCHAR2(260),
  filesize NUMBER,
  CONSTRAINT db_no_PK PRIMARY KEY(no)
);

SELECT * FROM dataBoard;

DROP SEQUENCE db_no_seq;
CREATE SEQUENCE db_no_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

INSERT INTO dataBoard (no, name, subject, content, pwd, filename,filesize)
VALUES (db_no_seq.nextval, '오해영', '파일없음','파일무','1234','',0);

INSERT INTO dataBoard (no, name, subject, content, pwd, filename,filesize)
VALUES (db_no_seq.nextval, '오해영', '파일없음','파일무','1234','',0);

INSERT INTO dataBoard (no, name, subject, content, pwd, filename,filesize)
VALUES (db_no_seq.nextval, '오해영', '파일없음','파일무','1234','',0);

INSERT INTO dataBoard (no, name, subject, content, pwd, filename,filesize)
VALUES (db_no_seq.nextval, '오해영', '파일없음','파일무','1234','',0);

INSERT INTO dataBoard (no, name, subject, content, pwd, filename,filesize)
VALUES (db_no_seq.nextval, '오해영', '파일없음','파일무','1234','',0);

INSERT INTO dataBoard (no, name, subject, content, pwd, filename,filesize)
VALUES (db_no_seq.nextval, '오해영', '파일없음','파일무','1234','',0);

INSERT INTO dataBoard (no, name, subject, content, pwd, filename,filesize)
VALUES (db_no_seq.nextval, '오해영', '파일없음','파일무','1234','',0);

INSERT INTO dataBoard (no, name, subject, content, pwd, filename,filesize)
VALUES (db_no_seq.nextval, '오해영', '파일없음','파일무','1234','',0);

INSERT INTO dataBoard (no, name, subject, content, pwd, filename,filesize)
VALUES (db_no_seq.nextval, '오해영', '파일없음','파일무','1234','',0);

INSERT INTO dataBoard (no, name, subject, content, pwd, filename,filesize)
VALUES (db_no_seq.nextval, '오해영', '파일없음','파일무','1234','',0);

INSERT INTO dataBoard (no, name, subject, content, pwd, filename,filesize)
VALUES (db_no_seq.nextval, '오해영', '파일없음','파일무','1234','',0);

INSERT INTO dataBoard (no, name, subject, content, pwd, filename,filesize)
VALUES (db_no_seq.nextval, '오해영', '파일없음','파일무','1234','',0);

INSERT INTO dataBoard (no, name, subject, content, pwd, filename,filesize)
VALUES (db_no_seq.nextval, '오해영', '파일없음','파일무','1234','',0);

INSERT INTO dataBoard (no, name, subject, content, pwd, filename,filesize)
VALUES (db_no_seq.nextval, '오해영', '파일없음','파일무','1234','',0);

INSERT INTO dataBoard (no, name, subject, content, pwd, filename,filesize)
VALUES (db_no_seq.nextval, '오해영', '파일없음','파일무','1234','',0);

COMMIT;

SELECT * FROM dataBoard;