-- 2016.08.23 일정 등록

-- 데이터 사전 (Data Dictionary)
   - 읽기 전용 테이블 및 뷰의 집합.
   - 데이터 전반에 관한 정보 제공
   - 데이터 딕션너리 확인
     SELECT * FROM DICTIONARY;
   - 데이터 딕션너리의 사용자 지정 제약 사항 확인
     SELECT * FROM USER_CONSTRAINTS;
   - 기존 테이블에 있는 프라이머리키 삭제
     ALTER TABLE replyBoard DROP PRIMARY KEY;
   - 기존 테이블과 제약조건 삭제 (테이블만 삭제하면 제약조건은 남아 있음)
     DROP TABLE replyBoard CASCADE CONSTRAINTS;

-- 일정관리 테이블 생성 : 다이어리 테이블
   - 생성전에 항상 삭제 먼저
     DROP TABLE diary CASCADE CONSTRAINTS;
   - 테이블 생성
     CREATE TABLE diary(
       no NUMBER,
       id VARCHAR2(20) CONSTRAINT diary_id_NN NOT NULL,
       subject VARCHAR2(1000) CONSTRAINT diary_sub_NN NOT NULL,
       msg VARCHAR2(4000) CONSTRAINT diary_msg_NN NOT NULL,
       year NUMBER,
       month NUMBER,
       day NUMBER,
       CONSTRAINT diary_no_PK PRIMARY KEY(no)
     );
     SELECT*FROM diary;

-- 시퀀스(SEQUENCE)
   - 특정 컬럼에 대해서 유일(UNIQUE)한 값을 연속적으로 생성시키기 위해서 사용
   - 시퀀스를 생성하기 위해서는 CREATE SEQUENCE 권한을 가지고 있어야함
     : 관리자 권한으로 sqlplus에 접속 CREATE SEQUENCE TO 사용자명 실행

-- 자동 증가 번호 생성
   CREATE SEQUENCE diary_no_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
   - 시퀀스 수정
     ALTER SEQUENCE diary_no_seq INCREMENT BY 2;
   - 시퀀스 삭제
     DROP SEQUENCE diary_no_seq;

-- 시퀀스 생성 옵션
   - START WITH n
     : 시퀀스의 시작 값을 지정. n을 1로 지정하면 1부터 순차적으로 시퀀스 번호가 증가.

   - INCREMENT BY n
    : 시퀀스의 증가 값을 지정. n을 2로 하면 2씩 증가.  기본값은 1이고, 증가 값은 0이 될 수 없다.
     Ex) START WITH를 1로, INCREMENT BY를 2로 하면 => 1, 3, 5, 7.....로 시퀀스 번호 증가

   - MAXVALUE n | NOMAXVALUE
     : MAXVALUE는 시퀀스가 증가할 수 있는 최대값. NOMAXVALUE는 시퀀의 값을 무한대로 지정

   - MINVALUE n | NOMINVALUE
     : MINVALUE는 시퀀스의 최소 값을 지정. 기본값 1. NOMINVALUE를 지정할 경우 최소 값이 무한대

   - NOCACHE | CACHE
     : 시퀀스의 캐시값 지정 여부, NOCACHE가 기본값, CACHE로 지정할 경우 메모리에 자동으로 20개의 값이 생성

   - CYCLE | NOCYCLE
     : CYCLE은 시퀀스가 최대값까지 증가할 때, 그 다음 값이 초기 값으로 다시 순환하도록 하는 옵션
       NOCYCLE은 순환하지 않는 옵션. 디폴트 값.

-- 테이블에 값 추가 : 시퀀스 사용 curenval. nextval, 값을 가지고 오는 방법
   INSERT INTO diary VALUES(diary_no_seq.nextval,'jung','프로젝트 아이템 발표일','화면구성, 데이터베이스',2016,9,13);
   INSERT INTO diary VALUES(diary_no_seq.nextval,'jung','우분투 설치','싱글모드, 가상모드, 풀모드',2016,9,12);
   INSERT INTO diary VALUES(diary_no_seq.nextval,'lee','프로젝트 아이템 발표일','화면구성, 데이터베이스',2016,9,11);
   COMMIT;
   SELECT * FROM diary;

-- 신규 테이블 생성
   DROP TABLE student CASCADE CONSTRAINTS;
   CREATE TABLE student(
     no NUMBER,
     name VARCHAR2(20)
   );

   DROP SEQUENCE st_no_seq;
   CREATE SEQUENCE st_no_seq START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 30 CYCLE CACHE 20;

   SELECT st_no_seq.nextval FROM DUAL;

   INSERT INTO student VALUES(st_no_seq.nextval, '김호현');
   COMMIT;
   SELECT * FROM student;