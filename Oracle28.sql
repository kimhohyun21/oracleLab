CREATE TABLE mvcMember(
  id VARCHAR2(20),
  pwd VARCHAR2(10) CONSTRAINT mm_pwd_nn NOT NULL,
  name VARCHAR2(34) CONSTRAINT mm_name_nn NOT NULL,
  gender VARCHAR2(10),
  CONSTRAINT mm_id_pk PRIMARY KEY(id),
  CONSTRAINT mm_gen_ck CHECK(gender IN('����', '����'))
);

desc mvcMember;

INSERT INTO mvcMember VALUES('oh', '1234', '���ؿ�', '����');
INSERT INTO mvcMember VALUES('hong', '1234', 'ȫ�浿', '����');
INSERT INTO mvcMember VALUES('jung', '1234', '������', '����');
commit;

SELECT * FROM mvcMember;