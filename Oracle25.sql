/*
  #Board 답변형 게시판

    1. 설계
      no : 게시물 번호  => NUMBER => Primary Key
      name : 작성자 => VARCHAR2(34) => NOT NULL
      subject : 제목 => VARCHAR2(4000) => NOT NULL
      content : 내용 => CLOB => NOT NULL
      pwd : 비밀번호 => NUMBER => NOT NULL
      regdate : 날짜 => DATE => DEFAULT SYSDATE
      hit : 조회수 => NUMBER => 자동증가
      group_id:
      group_step
      group_tab
      root
      depth
 */

DROP TABLE board;
CREATE TABLE board(
  no NUMBER,
  name VARCHAR2(34) CONSTRAINT board_nn_name NOT NULL ,
  subject VARCHAR2(4000) CONSTRAINT board_nn_subject NOT NULL,
  content CLOB CONSTRAINT board_nn_content NOT NULL,
  pwd VARCHAR2(10) CONSTRAINT board_nn_pwd NOT NULL,
  regdate DATE DEFAULT SYSDATE,
  hit NUMBER DEFAULT 0,
  group_id NUMBER,
  group_step NUMBER DEFAULT 0,
  group_tab NUMBER DEFAULT 0,
  root NUMBER DEFAULT 0,
  depth NUMBER DEFAULT 0,
  CONSTRAINT board_pk_no PRIMARY KEY(no)
);

INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
INSERT INTO board(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board), '오해영', 'MVC연습...',
        'MVC구조를 익히다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM board));
COMMIT;

SELECT * FROM board;