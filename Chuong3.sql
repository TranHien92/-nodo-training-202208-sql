-----Chương 3
SELECT DEPTNO, JOB, ENAME,SAL
FROM EMP 
ORDER BY 1 ; 
-- 1 là thứ tự column  name
-- Câu 1.Chọn nhân viên trong bảng EMP có mức lương từ 1000 đến 2000 (chọn các trường ENAME, DEPTNO, SAL).
SELECT ENAME, DEPTNO ,SAL
FROM EMP 
Where SAL BETWEEN 1000 and 2000;
--Câu 2 Hiển thị mã phòng ban, tên phòng ban, sắp xếp theo thứ tự tên phòng ban
SELECT DEPTNO, DNAME 
FROM dept
ORDER BY DNAME ASC
--Bảng phòng ban
Select * FROM dept
--Câu3. Hiển thị danh sách những nhân viên làm tại phòng 10 và 20 theo thứ tự A,B,C
SELECT *  
FROM EMP 
WHERE DEPTNO IN (10,20)
--Câu4. Hiển thị tên và nghề nghiệp những nhân viên làm nghề thư ký (clecrk) tại phòng 20.
SELECT ENAME, JOB  
FROM EMP 
WHERE JOB = 'CLERK' and DEPTNO ='20'
--Câu5. Hiển thị tất cả những nhân viên mà tên có các ký tự TH và LL.
SELECT ENAME  
FROM EMP 
WHERE ENAME Like '%TH%' or ENAME Like '%LL%'
--Câu6. Hiển thị tên nhân viên, nghề nghiệp, lương của những nhân viên có giám đốc quản lý
SELECT ENAME, JOB, SAL   
FROM EMP 
WHERE JOB != 'PRESIDENT'
--Câu 7. Hiển thị tên nhân viên, mã phòng ban, ngày gia nhập công ty sao cho gia nhập công ty trong năm 1983. 
--Hàm EXTRACT() trong SQL sử dụng cùng một kiểu unit định dạng như DATE_ADD() hoặc DATE_SUB(), nhưng lấy ra phần từ ngày chứ không phải là thêm hay trừ datetime.
SELECT ENAME, DEPTNO, HIREDATE   
FROM EMP 
WHERE extract(year from hiredate) = 1983
--Caau8.Hiển thị tên nhân viên, lương một năm (ANUAL_SAL ), thưởng sao cho lương lớn hơn thưởng và nghề nghiệp là SALEMAN, sắp theo thứ tự lương giảm dần và tên tăng dần
SELECT  ENAME, SAL*12 as ANUAL_SAL, COMM   
FROM EMP 
WHERE JOB = 'SALESMAN' and sal>comm
ORDER BY ANUAL_SAL DESC, ENAME ASC