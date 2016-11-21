/*
  무비 데이터 
  
  번호
  타이틀
  감독
  배우
  장르
  포스터
  스토리
  순위
  별점
  등급

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
