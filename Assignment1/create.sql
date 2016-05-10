rem CS 340 Programming Assignment 1
rem Muhammad Ahmer Ali
rem 17100033

CREATE TABLE STUDENT
( sid number,  
  sname varchar2(15), 
  major varchar2(10),
  slevel varchar2(10), 
  age number,
  PRIMARY KEY(sid)
);

CREATE TABLE CLASS
( cnum varchar2(10),
  meets_at date,
  room varchar2(10),
  fid number,
  PRIMARY KEY (cnum)
);

CREATE TABLE FACULTY
( fid number,
  fname varchar2(20),
  dept varchar2(20),
  PRIMARY KEY (fid)
);

CREATE TABLE ENROLLED
( cnum  varchar2(10),
  sid  number,
  PRIMARY KEY (cnum,sid)
);

CREATE TABLE PREREQUISITE
( cnum  varchar2(10),
  prereq  varchar2(10),
  PRIMARY KEY (cnum,prereq)
);

CREATE VIEW ViewA AS
Select Faculty.fid,fname,cnum
From Faculty,Class
where Faculty.fid =	Class.Fid
Order by Faculty.fid,fname,cnum;

CREATE VIEW ViewB AS
Select Student.sid,Student.sname,count(Student.sid) AS count
From Student,Enrolled
where Student.sid=Enrolled.sid
Group By Student.sid,Student.sname;
