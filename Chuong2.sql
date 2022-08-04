----Chương 2
--cau 1
Select * FROM SALGRADE
--cau 2
Select * FROM  EMP
--Cau 3
Select JOB FROM EMP
--Câu 4
Select ENAME, SAL*12 AS REMUNERATION  
FROM EMP
--Câu 5
Select ENAME || ' HAS HELP THE POSITION OF ' || JOB || ' IN DEPT '
|| DEPTNO || ' SINCE ' || TO_CHAR(HIREDATE, 'dd-mm-yyyy') FROM EMP;
--Câu 6 Hiển thị cấu trúc bảng emp
DESCRIBE EMP;
--Câu 7
Select EMPNO, ENAME, JOB, MGR, TO_CHAR(HIREDATE, 'yyyy/mm/dd') AS hiredates  ,to_char(SAL,'$999,999.00') as sals ,COMM ,DEPTNO 
FROM EMP;