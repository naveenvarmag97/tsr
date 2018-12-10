CREATE DATABASE ftp46;

CREATE USER 'ftp46'@'localhost' IDENTIFIED BY 'ftp46';

GRANT ALL ON ftp46.* TO 'ftp46'@'localhost';

-- change this to your team id
USE ftp46;

-- comment this line for the very first time
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS LEAVE_DETAILS;
-- create the table

CREATE TABLE EMPLOYEE(EMP_ID INT PRIMARY KEY,EMP_NAME VARCHAR(255) NOT NULL,EMP_DOJ DATE NOT NULL,MANAGER_ID INT NOT NULL,EMP_PHONE DOUBLE NOT NULL,EMP_EMAIL VARCHAR(255) NOT NULL,EMP_LEAVE_BAL INT NOT NULL,EMP_DEPART VARCHAR(255) NOT NULL,PROFILE_URL VARCHAR(255));
CREATE TABLE LEAVE_DETAILS(LEAVE_ID INT PRIMARY KEY AUTO_INCREMENT,EMP_ID INT NOT NULL,START_DATE DATE NOT NULL,END_DATE DATE NOT NULL,APPLIED_ON DATE NOT NULL,NO_OF_DAYS INT NOT NULL,LEAVE_TYPE ENUM('EL','SL','PL/ML'),REASON VARCHAR(255) NOT NULL,LEAVE_STATUS ENUM('PENDING','APPROVED','DENIED' ),MANAGER_COMENTS VARCHAR(255) NOT NULL);
ALTER TABLE LEAVE_DETAILS ADD CONSTRAINT LFK FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID);

//REFERENCE ONLY
//ALTER TABLE LEAVE_DETAILS MODIFY column LEAVE_TYPE ENUM('EL','SL','PM/ML');

//ALTER TABLE EMPLOYEE ADD column   PROFILE_URL VARCHAR(255);

//ALTER TABLE EMPLOYEE DROP column   EMP_DEPT;

//ALTER TABLE employee CHANGE column EMP_LEAVEBALANCE EMP_LEAVE_BAL INT ;

//ALTER TABLE LEAVE_DETAILS MODIFY column LEAVE_TYPE ENUM('EL','SL','PM/ML');
