--CHƯƠNG5
--CÂU1 Hiển thị toàn bộ tên nhân viên và tên phòng ban làm việc sắp xếp theo tên phòng ban
SELECT ENAME, DNAME 
FROM EMP E , dept D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY  DNAME
--CÂU 2 Hiển thị tên nhân viên, vị trí địa lý, tên phòng với điều kiện lương >1500
SELECT ENAME, LOC, DNAME 
FROM EMP E INNER JOIN dept D
ON E.DEPTNO = D.DEPTNO
WHERE SAL >1500
--CÂU3 Hiển thị tên nhân viên, nghề nghiệp, lương và mức lương
SELECT ENAME, JOB, SAL, GRADE
FROM EMP E , SALGRADE S
WHERE SAL >= LOSAL AND SAL <=HISAL
--CÂU4. Hiển thị tên nhân viên, nghề nghiệp, lương và mức lương, với điều kiện mức lương=3
SELECT ENAME, JOB, SAL,(CASE WHEN SAL >= 1401 AND SAL <=2000 THEN '3' END) AS GRADE
FROM EMP E , SALGRADE S
WHERE (CASE WHEN SAL >= 1401 AND SAL <=2000 THEN '3' END) = '3'
--CÂU5Hiển thị những nhân viên tại DALLAS
SELECT ENAME, LOC
FROM EMP E INNER JOIN dept D
ON E.DEPTNO = D.DEPTNO
WHERE D.LOC = 'HA NOI'
--CÂU6 Hiển thị tên nhân viên , nghề nghiệp, lương, mức lương, tên phòng làm việc trừ nhân viên có nghề là cleck và sắp xếp theo chiều giảm. 
--Cách1
SELECT ENAME, JOB, SAL,GRADE,DNAME
FROM EMP E INNER JOIN dept D  ON E.DEPTNO = D.DEPTNO ,SALGRADE
WHERE JOB !='CLERK' and (SAL >= LOSAL AND SAL <=HISAL)
ORDER BY GRADE DESC
--Câu7 	Hiển thị chi tiết về những nhân viên kiếm được 36000 $ 1 năm hoặc nghề là cleck.  (gồm các trường tên, nghề, thu nhập, mã phòng, tên phòng, mức lương)
SELECT ENAME, JOB, SAL*12 as thunhap, e.DEPTNO, DNAME,GRADE
FROM EMP E INNER JOIN dept D  ON E.DEPTNO = D.DEPTNO ,SALGRADE
WHERE JOB ='CLERK' or SAL*12=36000 and (SAL >= LOSAL AND SAL <=HISAL)
--Câu8 Hiển thị những phòng không có nhân viên nào làm việc. 	
SELECT DEPTNO, DNAME
FROM dept 
WHERE DEPTNO NOT IN (SELECT DEPTNO FROM EMP)
---
SELECT DEPTNO, DNAME
FROM DEPT D
WHERE not exists (SELECT * FROM EMP E
WHERE D.DEPTNO = E.DEPTNO)

--CÂU 9Hiển thị mã nhân viên, tên nhân viên, mã người quản lý, ten người quản lý.
Select e.ename emp_name, e.sal emp_sal,
m.ename mgr_name, m.sal mgr_sal
from emp e, emp m
where e.mgr = m.empno;
--Câu 10 Như câu 9 hiển thị thêm thông tin về ông KING.
Select e.ename emp_name, e.sal emp_sal,m.ename mgr_name, m.sal mgr_sal 
from emp e left outer join emp m on e.mgr=m.empno;
--Câu 11Hiển thị nghề nghiệp được tuyển dụng vào năm 1981 và không được tuyển dụng vào năm 1994.
Select DISTINCT JOB From EMP 
Where (Extract (Year From HireDate) = 1981) AND 
Job Not In (Select JOB From EMP Where Extract (Year From HireDate) = 1994 );
--CÂU12Tìm những nhân viên gia nhập công ty trước giám đốc của họ. 
select e.ename emp_name,to_char(e.hiredate,'DD-MM-YYYY') emp_hiredate, --nhân viên
m.ename mgr_name, to_char(m.hiredate,'DD-MM-YYYY') mgr_hiredate --giám đốc
from emp e,emp m 
where e.mgr=m.empno and e.hiredate-m.hiredate<0
--câu13 Tìm tất cả các nhân viên, ngày gia nhập công ty, tên nhân viên, tên người giám đốc và ngày gia nhập công ty của người giám đốc ấy
select e.ename emp_name,to_char(e.hiredate,'DD-MM-YYYY') emp_hiredate,
m.ename mgr_name, to_char(m.hiredate,'DD-MM-YYYY') mgr_hiredate 
from emp e left join emp m on e.mgr=m.empno;
--Câu 14:Tìm những nhân viên kiếm được lương cao nhất trong mỗi loại nghề nghiệp.
select job , max(sal) 
from emp
group by job
--Caau15: Tìm mức lương cao nhất trong mỗi phòng ban, sắp xếp theo thứ tự phòng ban
select ename,job,deptno,sal 
from emp 
where sal in (select max(sal) from emp group by deptno) 
order by deptno;
--Câu16. Tìm nhân viên gia nhập vào phòng ban sớm nhất
select ename, to_char(hiredate,'DD-MM-YYYY') hiredate, deptno
from emp 
where hiredate in (select min(hiredate) from emp group by deptno)
--Câu17 Hiển thị những nhân viên có mức lương lớn hơn lương TB của phòng ban mà họ làm việc. 
Select Empno ,Ename ,Sal,emp.Deptno 
From emp inner Join (Select Deptno ,avg(sal) luongtb From emp Group By Deptno) tableluongtb On emp.Deptno=tableluongtb.Deptno 
Where Sal > tableluongtb.luongtb order by deptno;
--Câu 18: Hiển thị tên nhân viên, mã nhân viên, mã giám đốc, tên giám đốc, phòng ban làm việc của giám đốc, mức lương của giám đốc.
select e.empno emp_number,e.ename emp_name,e.sal emp_sal, m.mgr mgr_number,m.ename mgr_name,m.deptno mgr_dept,grade
from emp e inner join emp m on e.mgr=m.empno,salgrade
where (m.SAL >= LOSAL AND m.SAL <=HISAL)