--Chương 7
--Câu 1:Tạo bảng PROJECT với các column được chỉ ra dưới đây, PROJID là promary key, và P_END_DATE > P_START_DATE.
create table PROJECT_HIEN
(
PROJID NUMBER(4,0)  CONSTRAINT PK_PRO PRIMARY KEY , 
P_DESC VARCHAR2(20), 
P_START_DATE DATE ,
P_END_DATE DATE, 
BUDGET_AMOUNT NUMBER(7,2), 
MAX_NO_STAFF NUMBER(2,0),
Check (P_END_DATE > P_START_DATE)
)
--Caau2:Tạo bảng ASSIGNMENTS với các column được chỉ ra dưới đây, đồng thời cột PROJID 
--là foreign key tới bảng PROJECT, cột EMPNO là foreign key tới bảng EMP.
Create table ASSIGNMENTS_HIEN(
PROJID NUMBER(4,0) NOT NULL ENABLE, 
EMPNO NUMBER(4,0) NOT NULL ENABLE,
A_START_DATE DATE ,
A_END_DATE DATE, 
BILL_AMOUNT  NUMBER(4,2), 
ASSIGN_TYPE NUMBER(2,0),
CONSTRAINT FK_PROJECT_HIEN FOREIGN KEY (PROJID) REFERENCES PROJECT_HIEN(PROJID) 
ON DELETE CASCADE ENABLE,
CONSTRAINT FK_EMPNO_HIEN FOREIGN KEY (EMPNO) REFERENCES EMP(EMPNO) 
ON DELETE CASCADE ENABLE
)	

----Từ khoá ON DELETE CASCADE được hỉ định trong dạng khoá này để chỉ khi dữ liệu cha bị xoá (trong
--bảng DEPT) thì dữ liệu con cũng tự động bị xoá theo (trong bảng EMP).-
--CAU3Thêm column COMMENTS kiểu LONG vào bảng PROJECTS. Thêm column HOURS kiểu
--NUMBER vào bảng ASSIGNMENTS. 
ALTER TABLE PROJECT_HIEN ADD (COMMENTS LONG);
ALTER TABLE ASSIGNMENTS_HIEN ADD (HOURS NUMBER);
SELECT * FROM PROJECT_HIEN
--CAU4 Sử dụng view USER_OBJECTS hiển thị tất cả các đối tượng user sở hữU
DESCRIBE USER_OBJECT;
--CAU5. Thêm ràng buộc duy nhất (UNIQUE) 
--cho 2 column PROJECT_ID và EMPNO của bảng ASSIGNMENTS.
ALTER TABLE ASSIGNMENTS_HIEN MODIFY (PROJID UNIQUE)
ALTER TABLE EMP MODIFY (PROJECT_ID UNIQUE)
--CAU6 Xem các thông tin về các ràng buộc trong USER_CONSTRAINTS
select * from User_Constraints;
--CAU7 Xem trong USER hiện tại có tất cả bao nhiêu bảng. 
select TABLE_NAME from USER_TABLES;