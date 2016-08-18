-- OUTER JOIN, SUBQUERY

  A: 1,2,3,4
  B: 1,2,5,6

  ==> INNER JOIN : 1,2(교집합) : INTERSACT

  ==> LEFT ==> 1,2,3,4
  ==> RIGHT ==> 1,2,5,6
  ==> FULL ==> 1,2,3,4,5,6 (합집합) : UNION
               UNION ALL => 1,2,3,4,5,6,1,2


-- OUTER JOIN : INNER JOIN +(NULL)
   1) LEFT OUTER JOIN
      형식) 
          SELECT A.col, B.col
          FROM A, B
          WHERE A.col=B.col(+);

          SELECT A.col, B.col
          FROM A, LEFT OUTER JOIN B
          ON A.col=B.col;
            
   2) RIGHT OUTER JOIN
      형식)
          SELECT A.col, B.col
          FROM A, B
          WHERE A.col(+)=B.col;

          SELECT A.col, B.col
          FROM A, RIGHT OUTER JOIN B
          ON A.col=B.col;

   3) FULL OUTER JOIN
      형식)
          SELECT A.col, B.col
          FROM A, FULL OUTER JOIN B
          ON A.col=B.col;

-- RIGHT OUTER JOIN
   SELECT ename, dname, loc FROM emp, dept
   WHERE emp.deptno(+)=dept.deptno;

   SELECT ename, dname, loc FROM emp RIGHT OUTER JOIN dept
   ON emp.deptno=dept.deptno;