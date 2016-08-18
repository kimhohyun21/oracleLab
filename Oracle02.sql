-- WHERE 조건절
   : 사용가능한 연산자
    1) 산술연산자
       +, -, *, /, "% 나머지 연산자는 함수로" ==> MOD()
       + : 문자열 결합 기능이 없음 ==> ||
       / : 정수 / 정수 = 실수 (5/2=2.5)

    2) 관계 연산자
       = : 같다
       !=, <> : 같지 않다
       <
       >
       >=
       <=

    3) 논리 연산자 (자바의 &&, ||)
       AND
       OR

    4) 대입 연산자 (자바의 ==)
       =

    5) IN 연산자
       - 여러조건의 empno를 검색할 경우
         : empno=100 OR empno=200 OR empno=300
           ==> empno IN (100, 200, 300)

    6) BETWEEN ~ AND 연산자
       - 기간, 범위를 검색할 경우 사용
         : deptno>=10 AND deptno<=30
           ==> deptno BETWEEN 10 AND 30

    7) LIKE 연산자 : 유사문자열 검색
       % : 문자열
           Ex) A% =>  A로 시작하는 모든 문자열
               %A =>  A로 끝나는 모든 문자열
               %A% => A를 포함하고 있는 모든 문자열
       _ : 문자
           Ex) __A ==> 3번째 문자가 A인 것
               __O% ==> 3번째 문자가 O인 모든 문자열
    8) NOT 연산자 => NOT LIKE, NOT BETWEEN ~ AND, NOT IN

    9) NULL 연산자 => 오라클의 모든 연산자는 NULL을 연산할 수 없다
       COMM IS NULL
       COMM IS NOT NULL

-- 사원 급여의 총합
   SELECT ename, sal, comm FROM emp;
   SELECT ename, sal, comm, sal+comm FROM emp; -- NULL일 경우 사칙연산이 적용되지 않아 값이 NULL로 나옴
   SELECT ename, sal, comm, sal+NVL(comm, 0) FROM emp;
   SELECT ename, sal, sal*12 "연봉" FROM emp;
   SELECT ename, sal, sal*12 "연봉", comm, (sal*12)+NVL(comm,0) "총급여" FROM emp; -- 성과급을 1번 받을 때 총급여

-- 오라클 ==> 문자열 '문자열', 정수, 실수는 그냥 표기
-- Ex) 'KING', 7788
   SELECT * FROM emp WHERE ename='KING';

-- if(sal>=1500)
   SELECT * FROM emp WHERE sal>=1500;

-- 부서번호가 10이 아닌 사람들 목록
-- if(deptno!=10)
   SELECT * FROM emp WHERE deptno!=10;
   SELECT * FROM emp WHERE deptno<>10;

-- 급여가 1500이상이고 3000이하인 사람의 목록
-- if(sal>=1500 && sal<=3000)
   SELECT * FROM emp WHERE sal BETWEEN 1500 AND 3000;
   SELECT * FROM emp WHERE sal>=1500 AND sal<=3000;

-- 입사년도가 1981인 사원의 모든 정보를 출력
   SELECT * FROM emp WHERE hiredate>='81/01/01' AND hiredate<='81/12/31';
   SELECT * FROM emp WHERE hiredate BETWEEN '81/01/01' AND '81/12/31';
   SELECT * FROM emp WHERE hiredate BETWEEN '1981-01-01' AND '1981-12-31';
   SELECT * FROM emp WHERE hiredate LIKE '%81%'; -- 81가 포함된 모든 문자열 검색
   SELECT * FROM emp WHERE hiredate LIKE '81%'; -- 81로 시작되는 모든 문자열 검색 (년도는 뒤에 2자리부터 체크)
   SELECT * FROM emp WHERE substr(hiredate,1,2)=81; -- 1번째자리부터 2번째 문자열까지 반환했을 때 값이 81인 경우

-- Dummy 테이블 ==> 임의의 테이블에 결과 출력
   SELECT 5/2 FROM DUAL;

-- 부서번호가 10이거나 20번인 사원의 모든 정보를 출력
   SELECT * FROM emp WHERE deptno=10 OR deptno=20;
   SELECT * FROM emp WHERE deptno IN(10, 20); -- 30을 출력하고 싶으면 IN 앞에 NOT만 붙이면 됨
   SELECT * FROM emp WHERE deptno BETWEEN 10 AND 20;

-- 성과급을 받는 모든 사원의 정보를 출력
   SELECT * FROM emp WHERE comm!=0 OR comm IS NOT NULL; -- 성과급이 0인 사람 포함
   SELECT * FROM emp WHERE comm>=0;
   SELECT * FROM emp WHERE comm!=0 AND comm IS NOT NULL;

-- 이름이 A로 시작하는 모든 사원의 정보
   SELECT * FROM emp WHERE ename LIKE 'A%';

-- 이름이 T로 끝나는 모든 사원의 정보
   SELECT * FROM emp WHERE ename LIKE '%T';

-- 이름에 T를 포함하는 모든 사원의 정보
   SELECT * FROM emp WHERE ename LIKE '%T%';

-- 이름의 두번째 문자가 A인 모든 사원의 정보
   SELECT * FROM emp WHERE ename LIKE '_A%';

-- 성과급을 받거나 이름이 A로 시작하는 모든 사원의 정보
   SELECT * FROM emp WHERE comm is NOT NULL AND comm!=0 OR ename LIKE 'A%';