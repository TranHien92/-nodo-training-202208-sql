--Chương6
--Câu 1:Hiển thị tên nhân viên, ngày gia nhập công ty với điều kiện ngày gia nhập công ty nằm trong khoảng hai biến runtime được nhập vào từ bàn phím (&first_date,&last_date).
select ename, to_char(hiredate,'DD-MM-YYYY')
from emp
where to_char(hiredate,'DD-MM-YYYY')>= '&first_date' and to_char(hiredate,'DD-MM-YYYY')<= '&last_date'

--Caau2 Hiển thị tên nhân viên, nghề nghiệp, lương, mã giám đốc, mã phòng ban với điều kiện nghề nghiệp bằng một biến được nhập vào từ bàn phím. (&job)
select ename,job,sal, mgr,deptno
from emp
where job='&job'
--Cau3. Định nghĩa một biến tính thu nhập một năm của nhân viên. Dùng biến này để tìm những nhân viên có thu nhập lớn hơn hoặc bằng $30000. 
 define salary='sal*12 + NVL(comm,0)' 
 select ename,&salary salary,deptno
from emp where &salary>30000;
--Câu4. Định nghĩa một biến là khoảng thời gian nhân viên làm trong công ty. Hiển thị tên nhân viên và quãng thời gian nhân viên đó làm việc với điều kiện nhân viên là một
--biến được nhập vào từ bàn phím. 
define L_time='sysdate-hiredate' 
select ename,trunc(to_number(&L_time)/365)||' year '|| trunc(mod (to_number(&L_time),365)/30) || ' months' L_time 
from tblemp where ename='&ename';
