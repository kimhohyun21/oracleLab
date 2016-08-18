-- 2016.08.18 DML 정리
1) SQL : DQL(Data Query Language)라고도 함.

2) SELECT(*): 검색
   형식)
       SELECT 컬럼명... | *
       FROM table명 | SELECT ~~~
       [
        WHERE 컬럼명 연산자 값
        GROUP BY 그룹 컬럼 HAVING 그룹 조건
        ORDER BY 컬럼명 ASC | DESC
       ]

   연산자)
       - 관계연산자 : !=, <>
       - AND, OR : 문자열 결합 (&&, ||)
       - IN : OR가 여러개 일때
       - BETWEEN~AND : 기간 범위 (>= AND <=)
       - NOT
       - LIKE : %(문자열), _(한글자)와 함께 사용

   내장 함수)
       - 문자 : SUBSTR, TRIM, RPAD
       - 숫자 : ROUND, TRUNC, MOD, CEIL
       - 날짜 : MONTH_BETWEEN, SYSDATE
       - 변화 : TO_CHAR
       - 기타 : NVL

   JOIN)
       - 오라클형
       - ANSI형 : JOIN~ON
       - NATURAL형 : NATURAL JOIN
       - JOIN~USING형 : JOIN~USING(중복 컬럼명)

   SUBQUERY)


3) 그 밖에 DML : INSERT(*), UPDATE(*), DELETE(*)

4) DDL : CREATE, ALTER, DROP, TRUNCATE, RENAME

5) DCL : GRANT, REVOKE

6) TCL : COMMIT(*), ROLLBACK(*)