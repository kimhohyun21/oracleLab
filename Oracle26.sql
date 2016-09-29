/*
  #humorboard 답변형 게시판

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

DROP TABLE humorboard;
CREATE TABLE humorboard(
  no NUMBER,
  name VARCHAR2(34) CONSTRAINT humorboard_nn_name NOT NULL ,
  subject VARCHAR2(4000) CONSTRAINT humorboard_nn_subject NOT NULL,
  content CLOB CONSTRAINT humorboard_nn_content NOT NULL,
  pwd VARCHAR2(10) CONSTRAINT humorboard_nn_pwd NOT NULL,
  regdate DATE DEFAULT SYSDATE,
  hit NUMBER DEFAULT 0,
  group_id NUMBER,
  group_step NUMBER DEFAULT 0,
  group_tab NUMBER DEFAULT 0,
  root NUMBER DEFAULT 0,
  depth NUMBER DEFAULT 0,
  hot NUMBER DEFAULT 0,
  CONSTRAINT humorboard_pk_no PRIMARY KEY(no)
);

INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '김호현', '설운도가 옷을 벗는 순서는',
        '상하의 상하의~~~~', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '김고운', '해를 인터뷰하는 기자는',
        '해리포터', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '김장훈', '귀가 타면',
        '타이어', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '신은혜', '스타워즈 광선검의 색깔은',
        '주황주황', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '전진태', '세상에서 가장 맛있는 집은',
        '닭똥집', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '박정환', '식인종이 공무원을 보고 뭐라고 할까?',
        '정부미', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '구경태', '가수 비를 아는지 물어볼 때, 말하는 네 글자?',
        '너비아니', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '김용훈', '아기들이 배고플 때 가는 지하철 역은?',
        '수유역', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '고현우', '사공이 많으면 배는 어떻게 될까?',
        '가라 앉는다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '김경연', '세상에서 가장 잔인한 비빔밥은',
        '산채비빔밥', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '이지수', '언제나 말 다툼이 있는 곳은?',
        '경마장', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '최태석', '허수아비의 아들 이름은?',
        '허수', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '진다혜', '우리나라 사람들이 다 같이 쓰는 가위는?',
        '한가위', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '박은혜', '사람이 가장 많이 말하는 소리는?',
        '숨소리', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '장기봉', '사람들이 가장 싫어하는 거리는?',
        '걱정거리', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '조현준', '하늘에 별이 없으면 어떻게 될까?',
        '별볼일 없다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '최연욱', '방바닥 보다 높은 바닥은?',
        '발바닥', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '추진호', '[뼈로 만든 방]을 두 글자로?',
        '골룸', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '김길수', '머리를 감을 때, 먼저 감아야 하는 것은?',
        '눈', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '김호현', '위에서 아래로 자라나는 것은?',
        '고드름', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));

INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '싸이', '비를 막아주는 산은?',
        '우산', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '윤종신', '새로운 욕이 만들어 지는 곳은?',
        '뉴욕', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '유승우', '만 원과 천 원이 길에 있으면 무엇을 먼저 주워야 할까?',
        '둘 다 줍는다', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '테이', '누우면 멀어지고 일어나면 가까워지는 것은?',
        '천장', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '정유미', '[나는 자전거를 타지 못한다]를 영어로?',
        '모터사이클', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '노홍철', '바다에서 태어났지만, 바다로 가면 사라지는 것은?',
        '소금', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '지석진', '눈이 오면 강아지가 폴짝 폴짝 뛰는 이유는?',
        '발이 시려서', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '박경림', '돌잔치를 영어로?',
        'RockFestival', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '김현철', '[산에서 떨어지다 나무에 걸린 사람]을 여섯 글자로?',
        '덜떨어진 사람', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '배철수', '[미소]의 반대말은?',
        '당기소', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '이주연', '경찰서의 반댓말은?',
        '경찰앉아', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '성시경', '원숭이를 불에 구우면?',
        '구운몽', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '신동엽', '드라큘라가 가장 싫어하는 사람?',
        '찔러도 피 안나는 사람', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '할리', '엄마가 길을 잃으면?',
        '맘마미아', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '신성일', '가슴의 무게는?',
        '네근 가슴은 두근~ 두근~ 그래서 네근', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '옥상달빛', '눈으로 못 보고, 입으로만 보는 것은?',
        '맛 음식을 맛보다~ 맛은 입으로 보는거죠', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '유재석', '세상에서 가장 빠른 새는?',
        '눈깜짝할새', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '정준하', '돌이 죽으면?',
        '고인돌', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '박명수', '세상에서 가장 이쁜 소는?',
        '미소', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '종현', '무가 자기소개를 할 때 하는 말은?',
        '나무', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));

INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '정형돈', '차가운 물이 나오지 않는 지하철 역은?',
        '온수역', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '데프콘', '공포영화를 봐도 놀라지 않는 연예인은?',
        '태연', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '하하', '알파벳에서 ''B'' 다음은 무엇일까요?',
        'E [alphabet]에서 b 다음 글자는 e!', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '스컬', '불인데, 연기가 없는 불은?',
        '반딧불', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '양세형', '숫자 5가 가장 싫어하는 집은?',
        '오페라 하우스', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '앙세찬', '누를수록 더 또렷한 것은?',
        '도장', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '김현준', '바다에 살고 있는 사자는?',
        '바다사자', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '문세윤', '비가 얼어죽으면?',
        '비동사', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '유민상', '음력 설날에 사용하는 물은?',
        '구정물', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '김민경', '[개가 사람을 가르친다]를 네 글자로?',
        '개인지도', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '서장훈', '세상에서 가장 빠른 닭은?',
        '후다닥', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '강호동', '파리 중에 가장 무거운 파리는?',
        '돌팔이', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '민경훈', '할아버지가 가장 좋아 하는 돈은?',
        '할머니', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '김희철', '조금 뚱뚱한 사람들이 사는 동네는?',
        '반포동', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '김영철', '[영웅은 여자를 좋아한다]를 네 글자로?',
        '영웅호걸', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '이수근', '쇼핑중독에 걸린 동물은?',
        '사자', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '이상민', '사람이 안에 있지만, 문을 두드려도 열어주지 않는 곳은?',
        '화장실', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '아이린', '올라 갈 수는 없고 내려가기만 하는 것은?',
        '폭포', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '초이', '세상에서 가장 무서운 전화기는?',
        '무선전화기', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '신세경', '손님에게 깎아주려고 애쓰는 가게는?',
        '미용실', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));

INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '변요한', '겉으로는 눈물 흘리며 속 타는 것은?',
        '촛불', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '윤균상', '딩동댕의 반대말은?',
        '땡 딩동댕(성공) - 땡(실패)', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '김구라', '세종대왕님이 다녔던 고등학교는?',
        '가갸거겨고교', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '김국진', '세상에서 가장 지루한 중학교는?',
        '로딩중', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '강수지', '[털이 길게 자란 남자]를 네 글자로?',
        '모자란놈', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '규현', '먹기 전에는 1개인데, 먹을 때는 2개가 되는 것은?',
        '나무젓가락', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '최시원', '모든 사람들이 거짓말만 하는 절은?',
        '만우절', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '강인', '법을 어긴 사람이 받는 금은',
        '벌금', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '심현보', '더울 때는 짧고 추울 때는 긴 것은?',
        '저녁 여름은 밤이 짧고 겨울은 밤이 길죠', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '김신영', '세상에서 가장 행복한 바다는?',
        '사랑해', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '김필', '곰돌이 푸한테 막 대하면?',
        '푸대접', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '곽진언', '세상에서 가장 폭력적인 나라는?',
        '칠레', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '박지윤', '사람들이 즐겨 먹는 피는?',
        '커피', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '정인', '내 것인데 남들이 더 많이 쓰는 것은?',
        '이름', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '조정치', '곰돌이 푸가 차에 치이면?',
        '카푸치노', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '하림', '갓은 갓인데 못쓰는 갓은?',
        '쑥갓', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '이서진', '숫자 8을 가로로 나누면?',
        '숫자 0 / 8을 가로로 나누면 0이 2개 나오죠', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '김광규', '공부 안하고 매일 노는 고1 학생은 1년 후에 뭐가 될까?',
        '고2', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '옥택연', '깨인데, 먹지 못하는 깨는?',
        '주근깨', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));
INSERT INTO humorboard(no, name, subject, content, pwd, group_id)
VALUES ((SELECT NVL(MAX(no)+1, 1) FROM humorboard), '유해진', '매일 달리는 사람들이 모인 도시는?',
        '경주', '1234', (SELECT NVL(MAX(group_id)+1, 1) FROM humorboard));

COMMIT;

SELECT * FROM humorboard;