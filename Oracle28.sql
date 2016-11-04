CREATE TABLE mvcMember(
  id VARCHAR2(20),
  pwd VARCHAR2(10) CONSTRAINT mm_pwd_nn NOT NULL,
  name VARCHAR2(34) CONSTRAINT mm_name_nn NOT NULL,
  gender VARCHAR2(10),
  CONSTRAINT mm_id_pk PRIMARY KEY(id),
  CONSTRAINT mm_gen_ck CHECK(gender IN('남자', '여자'))
);

desc mvcMember;

INSERT INTO mvcMember VALUES('oh', '1234', '오해영', '여자');
INSERT INTO mvcMember VALUES('hong', '1234', '홍길동', '남자');
INSERT INTO mvcMember VALUES('jung', '1234', '정도전', '남자');
commit;

SELECT * FROM mvcMember;