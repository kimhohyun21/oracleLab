-- 관계 데이터 모델의 개념
   1) 릴레이션
     - 릴레이션(Relation) : 행과 열로 구성된 테이블
     - 관계(Relationship) :
       = 릴레이션 내에서 생성되는 관계
       = 릴레이션 간에 생성되는 관계

   2) 릴레이션 스키마
     - 스키마의 요소
       = 속성(attribute) : 릴레이션 스키마의 열
       = 차수(degree) : 속성의 개수

   3) 릴레이션 인스텅스
     - 인스턴스 요소
       = 투플(tuple) : 릴레이션의 행
       = 카디널리티(Cardinality) : 튜플의 수수

   4) 관계 데이터 모델
     - 데이터를 2차원 테이블 형태인 릴레이션으로 표현함
     - 릴레이션데 대한 제약 조건 (contraints)과 관계연산을 위한 관계대수를 정의함
     - 관계 데이터 모델 => 컴퓨터 시스템에 구현 : 관계 데이터베이스 시스템 (RDBMS)

   5) 관계대수 연산
     - 순수 관계 연산 : JOIN
     - 일반 집합 연산 : 합집합,.....

-- JON : 한개 이상의 테이블을 연결해서 원하는 데이터 추출
-- JOIN의 종류
   1) 기본 JOIN 연산
     - 동등 연산
   2) 확장된 JOIN 연산
     - 외부 조인
--------------------------------------------------
-- 일반적인 JOIN
   1) INNER JOIN : NULL값이 있는 경우 수행이 되지않는다
     - EQUI_JOIN (=) : 동등 JOIN '같은 조건을 찾아서 가져오기'
     - NON EQUI_JOIN (=이외의 연산자 사용)
                     : 관계연산자, BETWEEN, IN....
     ***SQL문에서는 주로 동등 JOIN을 사용함

     -사용법
      = *** ORACLE 전용 TYPE
        형식)
            SELECT <속성들>
            FROM 테이블 1, 테이블 2
            WHERE <조인 조건> AND <검색 조건>;
        Ex)
            SELECT A.col1, A.col2, B.col1
            FROM A,B
                 ---
                 A a, B b 별칭을 사용할 수 있음
            WHERE A.col=B.col;

      = Ansi(표준) Type : 모든 제품에서 공동으로 사용가능한 방법
        형식)
            SELECT <속성들>
            FROM 테이블 1, 테이블 2(INNER)JOIN 테이블2 ON <조인 조건>
        Ex)
            SELECT A.col1, A.col2, B.col1
            FROM A JOIN B ON A.col=B.col
                          --
                          조건 (INNER) JOIN ~ ON

     - NATURAL JOIN
       :동등조인에서 조인에 참여한 속성이 두번 나오지 않도록
        두번째 속성을 제거한 결과를 반영함, 조건 없이도 중복을 알아서 제거

       Ex)
          SELECT A.col1, A.col2, B.col1
          FROM A NATURAL JOIN B

     - JOIN ~ USING
       Ex)
          SELECT A.col1, A.col2, B.col1
          FROM A JOIN B
          USING (col);

   2) OUTER JOIN
     - INNER JOIN(EQUI_JOIN, NON EQUI_JOIN)의 경우는
       JOIN에 참여하는 모든 테이블에 데이터가 존재하는 경우에만 결과값 출력

     - 반면에 OUTER JOIN의 경우는
       JOIN에 참여하는 여러 테이블에서 한쪽 테이블에는 데이터가 있고
       한쪽 테이블에는 데이터가 없으면, 데이터가 있는 쪽 테이블의 내용을 전부 출력

     - * 모든 속성을 보여주는 기준 릴레이션 위치에 따라
         = 왼쪽(left) 외부 조인
         = 오른쪽(right) 외부 조인
         = 완전 (full) 외부 조인
         => 조인에 실패한 투플을 모두 보여주되
            값이 없는 대응 속성에는 NULL 값을 채워 대응

        형식)
            SELECT <속성들>
            FROM 테이블 1 {LEFT | RIGHT | FULL [OUTER]} JOIN
                 테이블 2 ON <조인조건>
            WHERE <검색조건>

     - * 오라클에서는 +기호로 외부조인을 수행함.
         : 왼쪽 외부 조인 ==> (+) 기호를 조인 조건의 오른쪽에
           오른쪽 외부 조인 ==> (+) 기호를 조인 조건의 왼쪽에

   3) SELF JOIN
      - 하나의 테이블(자신)을 대상으로 조인하는 것
      - 중복으로 조인하게 되면, 조인으로 참여하는 속성명이 같아지는 문제 발생
        => 별칭(alias) 꼭 사용

   emp         dept
  ==================
  empno        deptno (primary key) : 중복해서 사용할 수 없음
  ename        dname
  job          loc
  mgr
  hiredate
  sal
  comm
  deptno (foreign key) : 중복이 가능

-- 사원의 전체 정보와 부서의 전체 정보를 출력
   SELECT empno, ename, job, mgr, hiredate, sal, comm, emp.deptno, dname, loc
   FROM emp, dept WHERE emp.deptno=dept.deptno;

-- 별칭을 사용할 경우
   SELECT empno, ename, job, mgr, hiredate, sal, comm, e.deptno, dname, loc
   FROM emp e, dept d WHERE e.deptno=d.deptno;

-- Ansi 타입으로 사용할 경우
   SELECT empno, ename, job, mgr, hiredate, sal, comm, emp.deptno, dname, loc
   FROM emp JOIN dept ON emp.deptno=dept.deptno;

-- NATURAL JOIN으로 사용할 경우
   SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno, dname, loc
   FROM emp NATURAL JOIN dept; -- 중복된 속성이 있을 경우 알아서 중복 제거하여 표기

-- JOIN ~ USING으로 사용할 경우
   SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno, dname, loc
   FROM emp JOIN dept USING (deptno);

   SELECT * FROM salgrade;

-- NON EQUI_JOIN
   SELECT ename, sal, grade FROM emp, salgrade
   WHERE sal BETWEEN losal AND hisal;

   SELECT ename, sal, grade FROM emp, salgrade
   WHERE sal>=losal AND sal<=hisal;

-- 사원의 이름, 급여, 입사일, 급여등급, 부서명, 근무지를 출력하라
-- 사원의 이름에 A를 포함하는 사람
   SELECT ename, sal, hiredate, grade, dname, loc
   FROM emp, dept, salgrade
   WHERE emp.deptno=dept.deptno AND ename LIKE '%A%' AND sal BETWEEN losal AND hisal;

-- Ansi 타입으로 작성
   SELECT ename, sal, hiredate, grade, dname, loc
   FROM emp JOIN dept ON emp.deptno=dept.deptno
   JOIN salgrade ON sal BETWEEN losal AND hisal
   WHERE ename LIKE '%A%';

-- 사원의 이름, 부서명, 근무지 ==> DALLAS에서 근무하는 사원만 출력
   SELECT ename, dname, loc
   FROM emp, dept WHERE emp.deptno=dept.deptno AND loc='DALLAS';

-- Ansi 타입
   SELECT ename, dname, loc
   FROM emp JOIN dept ON emp.deptno=dept.deptno
   WHERE loc='DALLAS';

-- NATURAL JOIN 타입
   SELECT ename, dname, loc FROM emp NATURAL JOIN dept WHERE loc='DALLAS';

-- JOIN USING
   SELECT ename, dname, loc FROM emp JOIN dept USING(deptno) WHERE loc='DALLAS';

-- SELF JOIN : 자신의 테이블을 연결해서 데이터를 얻는다
-- 사원의 이름과 사수의 이름을 출력
   SELECT e1.ename "본인", e2.ename "사수" FROM emp e1, emp e2
   WHERE e1.mgr=e2.empno(+);

   SELECT * FROM emp;
   SELECT * FROM dept;
   SELECT * FROM salgrade;