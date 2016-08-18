-- 2016.08.18 무결성 제약 조건

1) 오라클 => 데이터 저장 (정형화된 데이터)
                       ====
                       조건이 필요 : 제약 조건
                                   =======
                                   Ex) NOT NULL : NULL 값을 허용하지 않음
                                                  ==> password, name....
                                   형식)
                                       name VARCHAR2(34) NOT NULL

(*릴레이션 = 테이블, 튜플 = 행, 어트리뷰트(속성)= 열)

2) 키(KEY)
   - 특정 튜플을 식별할 때 사용하는 속성 혹은 속성의 집합
   - 릴레이션은 중복된 튜플을 허용하지 않음
     => 각각의 튜플에 포함된 속성들 중 어느 하나(혹은 하나 이상)은
        반드시 값이 달라서 키가 되며, 키가 되는 속성(혹은 속성의 집합)은
        튜플들을 서로 구별할 수 있어야함.
   - 키는 릴레이션 간의 관계를 맺는 데에도 사용됨

3) 후보키
   - 튜플을 유일하게 식별할 수 있는 속성의 최소 집합(키가 여러 개 존재)

4) 기본키(PK, PRIMARY KEY)
   - 여러 후보키 중 하나를 선정하여 대표로 삼는 키
   - 후보키가 하나 뿐이라면, 그 후보키를 기본키로 사용
   - 후보키가 여러 개라면 릴레이션의 특성을 반영하여 하나를 선택
   - 기본 키 선정시 고려 사항
     => 릴레이션 내 튜플을 식별할 수 있는 고유한 값을 가져야 함
     => NULL 값은 허용하지 않음
     => 키값의 변동이 일어나지 않아야 함
     => 최대한 적은 수의 속성을 가지 것이어랴 함
     => 향후 키를 사용하는데 있어서 문제 발생 소지가 없어야 함

5) 외래키(FK, FOREIGN KEY)
   - 참조키라고도 함
   - 다른 릴레이션의 기본키를 참조하는 키
   - 외래키의 특징
     => 관계 데이터 모델의 릴레이션 관계(Relationship)를 표현함
     => 다른 릴레이션의 기본키를 참조하는 속성임
     => 참조되는(기본키) 값이 변경되면 참조하는(외래키) 값도 변경됨
     => NULL 값과 중복 값 등이 허용됨
     => 자기 자신의 기본키를 참조하는 외래키도 가능함

   dept                  emp
   ====                  ===
   deptno                deptno
   10                    10
   20                    20
   30                    30
   40                    50(X) ==> 참조하고 있는 키의 값이 아닌 경우 들어 갈 수 없음
   ======                =====
   PRIMARY KEY           FOREIGN KEY

6) UNIQUE : 중복이 없는 값(NULL값은 허용)
   Ex)
    - 종류 : 전화번호, 이메일 등....

    - 형식 :
            email VARCHAR2(50) UNIQUE

7) PRIMARY KEY : NOT NULL + UNIQUE
   Ex)
    - 종류 : ID(중복 체크)

    - 형식 :
            id VARCHAR2(10) PRIMARY KEY

8) FOREIGN KEY : 참조키
   Ex)
    - 종류 : dept ==> deptno

    - 형식 :
            bno NUMBER FOREIGN KEY REFERENCE board(no)
            ==> bno는 board라는 테이블의 no를 참조하는 외래키이다

9) CHECK : 원하는, 지정된 데이터만 출력
   Ex)
    - 종류 : 콤보박스, 라디오, 체크 박스
    - 형식 :
            gender VARCHAR2(10) CHECK(gender IN('남', '여'))

10) DEFAULT : 미리 지정 => 입력값이 없는 경우 지정된 데이터가 출력 됨
    Ex)
     - 형식:
            regdate DATE DEFAULT SYSDATE

11) 관습적으로 사용하는 제약조건 작명법
    - UNIQUE => UK
    - NOT NULL => NN
    - PRIMARY KEY => PK
    - FOREIGN KEY => FK
    - CHECK => CK

    Ex) emp_ename_nn => "emp 테이블의 ename은 NOT NULL 이다" 라는 뜻으로 제약조건명 작명

12) 데이터 딕션너리 (Data Dictionary)
    - 오라클 객체들의 정보를 담고 있는 객체
    - 데이터베이스에 있는 모든 스키마 객체들의 정의 내용
      (*스키마 : 테이블의 배경 정보, 내포 사항 / 각 컬럼의 제약조건도 스키마의 일부)
    - 스키마 오브젝트들과 이들의 데이터베이스에서 차지하는 공간 등에 대한 정보
    - 테이블의 컬럼들에 대한 디폴트값 정보
    - 제약조건
    - 모든 오라클 사용자들에 대한 정보
    - 각 사용자에게 부여된 권한 정보
    - 기타 일반적인 데이터베이스에 대한 정보

13) 데이터 딕션너리의 종류
    - 기준 테이블 및 참고 가능한 뷰
      (*뷰(VIEW) : 하나 이상의 테이블을 합쳐서 만든 가상의 테이블)
    - 시스템 뷰
    - ALL 뷰
    - DBA 뷰
    - USER 뷰 : 로그인 한 사용자가 소유자가 되는 스키마 정보를 갖고 있는 뷰
                Ex)
                  - USER_OBJECTS
                  - USER_TABLES
                  - USER_CONTRAINS....

-- 데이터 딕션너리 확인 : EMP 테이블의 제약조건 확인
   SELECT column_name, uc.constraint_name, constraint_type, search_condition
   FROM user_constraints uc JOIN user_cons_columns ucc ON uc.table_name=ucc.table_name
   AND uc.constraint_name=ucc.constraint_name WHERE uc.table_name='EMP';


