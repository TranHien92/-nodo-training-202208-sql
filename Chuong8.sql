﻿--CÂU1:Thêm dữ liệu vào bảng PROJECTS. 
INSERT INTO PROJECT_HIEN(PROJID,P_DESC,P_START_DATE,P_END_DATE,BUDGET_AMOUNT,MAX_NO_STAFF) 
VALUES ('1','WRITE C030 COURSE','02-JAN-88','07-JAN-88','500','1')
INSERT INTO PROJECT_HIEN(PROJID,P_DESC,P_START_DATE,P_END_DATE,BUDGET_AMOUNT,MAX_NO_STAFF) 
VALUES ('2','PROOF READ NOTES ','01-JAN-89','10-JAN-89','600','1')
SELECT * FROM PROJECT_HIEN
--CÂU2Thêm dữ liệu vào bảng ASSIGNMENTS
INSERT INTO ASSIGNMENTS_HIEN(PROJID,EMPNO,A_START_DATE,A_END_DATE ,BILL_AMOUNT ,ASSIGN_TYPE,HOURS ) 
VALUES ('1','7369 ','01-JAN-88','03-JAN-88','50.00' ,'WR','15')
INSERT INTO ASSIGNMENTS_HIEN(PROJID,EMPNO,A_START_DATE,A_END_DATE ,BILL_AMOUNT ,ASSIGN_TYPE,HOURS ) 
VALUES ('2','7902','04-JAN-88 ','07-JAN-88 ','55.00' ,'WR','20')
INSERT INTO ASSIGNMENTS_HIEN(PROJID,EMPNO,A_START_DATE,A_END_DATE ,BILL_AMOUNT ,ASSIGN_TYPE,HOURS ) 
VALUES ('1','7844','01-JAN-89','10-JAN-89','45.50' ,'PF','30')
SELECT * FROM ASSIGNMENTS_HIEN
--Câu3Cập nhật trường ASIGNMENT_TYPE từ WT thành WR
Update ASSIGNMENTS_HIEN 
SET ASSIGN_TYPE = 'WT'
WHERE ASSIGN_TYPE ='WR'
--CÂU4 Nhập thêm số liệu vào bảng ASSIGNMENTS. 
INSERT INTO ASSIGNMENTS_HIEN 
VALUES ('1','7300 ','01-JAN-88','03-JAN-88','50.00' ,'WR','15')