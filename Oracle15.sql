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



