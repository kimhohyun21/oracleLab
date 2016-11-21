/*
  ���� ������ 
  
  ��ȣ
  Ÿ��Ʋ
  ����
  ���
  �帣
  ������
  ���丮
  ����
  ����
  ���

*/

DROP TABLE bigMovie CASCADE CONSTRAINTS;
CREATE TABLE bigMovie(
  mno              NUMBER,
  title               VARCHAR2(260) CONSTRAINT bm_title_nn NOT NULL,
  director          VARCHAR2(300),
  actor             VARCHAR2(300),
  genre            VARCHAR2(100),
  poster           VARCHAR2(1000),
  story             CLOB,
  rank              VARCHAR2(20),
  star               VARCHAR2(20),
  grade            VARCHAR2(20),
  CONSTRAINT bm_mno_pk   PRIMARY KEY(mno)
);
