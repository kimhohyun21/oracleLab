SELECT * FROM movieListads;
SELECT * FROM member;
SELECT * FROM qna;
SELECT * FROM movieList;
SELECT * FROM characterList;
SELECT * FROM theaterList;
SELECT * FROM replyList;
SELECT * FROM reserveList;
DROP TABLE member;
DROP TABLE movieList;
DROP TABLE movieListads;

CREATE TABLE member (
  no    NUMBER       CONSTRAINT member_pk_no PRIMARY KEY,
  id    VARCHAR2(20) CONSTRAINT member_nn_id NOT NULL,
  pwd   VARCHAR2(20) CONSTRAINT member_nn_pwd NOT NULL,
  name  VARCHAR2(20) CONSTRAINT member_nn_name NOT NULL,
  phone VARCHAR2(20) CONSTRAINT member_nn_phone NOT NULL,
  birth VARCHAR2(20) CONSTRAINT member_nn_birth NOT NULL,
  admin NUMBER       CONSTRAINT member_nn_admin NOT NULL, CONSTRAINT member_ck_admin CHECK(admin IN(0,1))
);

INSERT INTO member
VALUES((SELECT NVL(MAX(no)+1,1) FROM member),'admin','1234','관리자','010-1234-5678','1989-07-15', '1');
INSERT INTO member
VALUES((SELECT NVL(MAX(no)+1,1) FROM member),'scott','tiger','첫사람','010-4848-2232','2012-07-15', '0');

CREATE TABLE qna (
  qNo        NUMBER           CONSTRAINT qna_pk_qNo PRIMARY KEY,
  qSubject   VARCHAR2(1000)   CONSTRAINT qna_nn_qSubject NOT NULL,
  qContent   CLOB             CONSTRAINT qna_nn_qContent NOT NULL,
  qRegdate   DATE             DEFAULT SYSDATE,
  qHit       NUMBER           DEFAULT 0,
  group_id   NUMBER DEFAULT 0,
  group_step NUMBER DEFAULT 0,
  group_tab  NUMBER DEFAULT 0,
  root       NUMBER DEFAULT 0,
  depth      NUMBER DEFAULT 0,
  no         NUMBER,
  CONSTRAINT qna_member_fk_no FOREIGN KEY(no) REFERENCES member(no)
);

INSERT INTO qna
VALUES((SELECT NVL(MAX(qNo)+1,1) FROM qna),'둘째 질문입니다.','잘 해결해 봅시다.',SYSDATE,'','','','','','','');


CREATE TABLE movieList (
  mNo        NUMBER           CONSTRAINT movieList_pk_mNo PRIMARY KEY,
  poster     VARCHAR2(4000)   CONSTRAINT movieList_nn_poster NOT NULL,
  title      VARCHAR2(4000)   CONSTRAINT movieList_nn_title NOT NULL,
  opendate   DATE             CONSTRAINT movieList_nn_opendate NOT NULL,
  grade      VARCHAR2(20)     CONSTRAINT movieList_nn_grade NOT NULL,
  content    CLOB             CONSTRAINT movieList_nn_content NOT NULL,
  trailer    VARCHAR2(4000)   CONSTRAINT movieList_nn_trailer NOT NULL,
  type       NUMBER           CONSTRAINT movieList_nn_type NOT NULL, CONSTRAINT movieList_ck_type CHECK(type IN(0,1,2)),
  rank       NUMBER DEFAULT 0,
  movieLike  NUMBER DEFAULT 0,
  cNo        NUMBER,
  CONSTRAINT movieList_characterList_fk_cNo FOREIGN KEY  (cNo) REFERENCES characterList(cNo)
);

INSERT INTO movieList
VALUES ((SELECT NVL(MAX(mNo)+1,1) FROM movieList), 'http://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/201610/10797_103_1.jpg','인페르노'
,'2016-10-19','15','드라마' ||
                    '암호를 풀지 못하면 지옥의 문이 열린다!' ||
                   '전세계 인구를 절반으로 줄일 것을 주장한 천재 생물학자 ‘조브리스트’의 갑작스러운 자살 이후 하버드대 기호학자 ‘로버트 랭던’은 기억을 잃은 채 ' ||
                   '피렌체의 한 병원에서 눈을 뜬다. 담당 의사 ‘시에나 브룩스’의 도움으로 병원을 탈출한 랭던은 사고 전 자신의 옷에서 의문의 실린더를 발견하고, ' ||
                   '단테의 신곡 [지옥편]을 묘사한 보티첼리의 ‘지옥의 지도’가 숨겨져 있음을 알게 된다. 하지만, 원본과 달리 지옥의 지도에는 조작된 암호들이 새겨져 있고, ' ||
                   '랭던은 이 모든 것이 전 인류를 위협할 거대한 계획과 얽혀져 있다는 것을 직감하게 되는데...' ||
                   '' ||
                   '거대한 음모를 밝혀낼 유일한 단서 단테의 지옥은 소설이 아니라 예언이다.',
                                                   'http://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/201610/10797_301_1.mp4','0','','','');

CREATE TABLE characterList (
  cNo        NUMBER           CONSTRAINT characterList_pk_cNo PRIMARY KEY,
  cName      VARCHAR2(20)     CONSTRAINT characterList_nn_cName NOT NULL,
  img        VARCHAR2(4000)   CONSTRAINT characterList_nn_img NOT NULL
);

INSERT INTO characterList
VALUES ((SELECT NVL(MAX(cNo)+1,1) FROM characterList), '톰 행크스','http://caching.lottecinema.co.kr//Media/MovieFile/PersonImg/1000/239_107_2.png');

CREATE TABLE theaterList (
  tNo           NUMBER           CONSTRAINT theaterList_pk_tNo PRIMARY KEY,
  local         VARCHAR2(20)     CONSTRAINT theaterList_nn_local NOT NULL,
  theater       VARCHAR2(20)     CONSTRAINT theaterList_nn_theater NOT NULL,
  theaterNo     NUMBER           CONSTRAINT theaterList_nn_theaterNo NOT NULL,
  movietime     VARCHAR2(20)     CONSTRAINT theaterList_nn_movietime NOT NULL,
  mNo           NUMBER,
  CONSTRAINT theaterList_movieList_fk_mNo FOREIGN KEY  (mNo) REFERENCES movieList(mNo)
);

INSERT INTO theaterList
VALUES ((SELECT NVL(MAX(tNo)+1,1) FROM theaterList), '서울','신도림','1','13:00','');

CREATE TABLE replyList (
  reNo          NUMBER           CONSTRAINT replyList_pk_reNo PRIMARY KEY,
  score         NUMBER           CONSTRAINT replyList_nn_score NOT NULL,
  reContent     VARCHAR2(20)     CONSTRAINT eplyList_nn_reContent NOT NULL,
  regDATE       DATE             DEFAULT SYSDATE,
  no            NUMBER,
  mNo           NUMBER,
  CONSTRAINT replyList_member_fk_no FOREIGN KEY  (no) REFERENCES member(no),
  CONSTRAINT replyList_movieList_fk_mNo FOREIGN KEY  (mNo) REFERENCES movieList(mNo)
);

INSERT INTO replyList
VALUES ((SELECT NVL(MAX(reNo)+1,1) FROM replyList), '20','지림ㄷㄷ',SYSDATE,'','');

CREATE TABLE reserveList (
  rNo           NUMBER           CONSTRAINT reserveList_pk_rNo PRIMARY KEY,
  rYear         NUMBER           CONSTRAINT reserveList_nn_rYear NOT NULL,
  rMonth        NUMBER           CONSTRAINT reserveList_nn_rMonth NOT NULL,
  rDay          NUMBER           CONSTRAINT reserveList_nn_rDay NOT NULL,
  seat          VARCHAR2(20)     CONSTRAINT reserveList_nn_seat NOT NULL,
  ticket        NUMBER           CONSTRAINT reserveList_nn_ticket NOT NULL,
  payType       VARCHAR2(20)     CONSTRAINT reserveList_nn_paytype NOT NULL,
  payment       NUMBER           CONSTRAINT reserveList_nn_payment NOT NULL,
  no            NUMBER,
  tNo           NUMBER,
  CONSTRAINT reserveList_member_fk_no FOREIGN KEY  (no) REFERENCES member(no),
  CONSTRAINT reserveList_theaterList_fk_tNo FOREIGN KEY  (tNo) REFERENCES theaterList(tNo)
);

INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), '2016','07','15','32','1','신용카드','8000','','');