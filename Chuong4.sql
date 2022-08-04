--Chương 4
--Câu1. Liệt kê tên nhân viên, mã phòng ban và lương nhân viên được tăng 15% (PCTSAL).
SELECT ENAME, DEPTNO, SAL*1.15 AS luong   
FROM EMP 
--Câu2
SELECT RPAD(ename,10,'*') || LPAD(JOB,10,'*')  
FROM EMP 
--Câu3
SELECT ENAME ||' ' ||'('|| INITCAP(JOB)||')'
FROM EMP 
--Câu 4
SELECT ENAME, DEPTNO, INITCAP(JOB)
FROM EMP 
--CÂU5:  Tìm ngày thứ 6 đầu tiên cách 2 tháng so với ngày hiện tại hiển thị ngày dưới dạng 09 February 1990. 
select TO_CHAR((next_day(add_months(SYSDATE,2),'FRIDAY')),'DD MONTH YYYY') from dual;
--SYSDATE : TRẢ VỀ NGÀY HIỆN TẠI
--add_months(D,N): THÊM N THÁNG
--NEXT_DAY(d, char ) :Cho ngày tiếp theo ngày d có thứ chỉ bởi char
--CÂU 6:Tìm thông itn về tên nhân viên, ngày gia nhập công ty của nhân viên phòng số 20, sao cho hiển thị như sau: 
SELECT ENAME, TO_CHAR(HIREDATE, 'MONTH, DAY YYYY')  
FROM EMP 
WHERE DEPTNO = '20'
--CÂU 7: Hiển thị tên nhân viên, ngày gia nhập công ty, ngày xét nâng lương (sau ngày gia nhập công ty 1 năm), sắp xếp theo thứ tự ngày xét nâng lương.
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE,12) AS REVIEW
FROM EMP 
ORDER BY REVIEW
--CÂU8
SELECT ENAME ,
(CASE  
WHEN SAL = '1500' THEN 'BELLOW' ||' '|| SAL
WHEN SAL > '1500' THEN  ''|| SAL
ELSE 'ON TARGET'
END) AS SALARY
FROM EMP
--Caau9:
Select TO_CHAR(SYSDATE,'DAY') AS DAYS
FROM dual
--CÂU10:Đưa chuỗi dưới dạng nn/mm, kiểm tra nếu đúng khuân dạng trả lời là YES, ngược lại là NO. Kiểm tra với các chuỗi 12/24, 01/1a, 99\98.
select decode('&values','14/24','yes','01/1a','no','99\98','no','udefine')
--DECODE()cho phép bạn thêm logic thủ tục if-then-else vào các truy vấn . Hãy xem ví dụ sau:
--CÂU 11: Hiển thị tên nhân viên, ngày gia nhập công ty, ngày lĩnh lương sao cho ngày lĩnh lương phải vào thứ 6, nhân viên chỉ được nhận lương sau ít nhất 15 ngày làm việc tại
--công ty, sắp xếp theo thứ tự ngày gia nhập công ty.
SELECT ENAME, HIREDATE, NEXT_DAY(HIREDATE+15,'FRIDAY') AS NGAYLINHLUONG
FROM EMP 
ORDER BY HIREDATE ASC
--4.5.2. Hàm trên nhóm dữ liệu
--CÂU1: Tìm lương thấp nhất, lớn nhất và lương trung bình của tất cả các nhân viên
SELECT  MAX(SAL) AS MAXLUONG
FROM EMP 
SELECT  MIN(SAL) AS MINLUONG
FROM EMP 
SELECT  AVG(SAL) AS LUONGTB
FROM EMP 
--CÂU2. Tìm lương nhỏ nhất và lớn của mỗi loại nghề nghiệp
SELECT  JOB ,MIN(SAL) AS MINLUONG
FROM EMP
GROUP BY JOB
SELECT  JOB ,MAX(SAL) AS MINLUONG
FROM EMP
GROUP BY JOB
--CÂU3 Tìm xem có bao nhiêu giám đốc trong danh sách nhân viên. 
SELECT  COUNT(JOB) AS TONG
FROM EMP
GROUP BY JOB
HAVING JOB = 'PRESIDENT'
--CÂU4 Tìm tất cả các phòng ban mà số nhân viên trong phòng >3
SELECT DEPTNO, COUNT(EMPNO) AS SOLUONGNV
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(EMPNO)>3
--CÂU 5. Tìm ra mức lương nhỏ nhất của mỗi nhân viên làm việc cho một giám đốc nào đó sắp xếp theo thứ tự tăng dần của mức lương.
SELECT ENAME, MIN(SAL) AS MINLUONG,JOB
FROM EMP
WHERE JOB ='MANAGER'
GROUP BY JOB, ENAME
ORDER BY  MIN(SAL) ASC
