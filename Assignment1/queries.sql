rem CS 340 Programming Assignment 1
rem Muhammad Ahmer Ali
rem 17100033
define x=3;

BEGIN
   DBMS_OUTPUT.PUT_LINE('Query #1');
END;
/
Select max(age)	
From STUDENT
Where major = 'CS'
		OR
       sid in (Select sid
       		   From ENROLLED
       		   Where cnum in (Select cnum
       		   				   From Class
       		   				   Where fid = 2));

BEGIN
   DBMS_OUTPUT.PUT_LINE('Query #2');
END;
/
Select cnum  
From class 
Where room = '115'
		OR
        (Select count(*)
         From Enrolled
         Where class.cnum=enrolled.cnum)>=5;


BEGIN
   DBMS_OUTPUT.PUT_LINE('Query #3');
END;
/
SELECT sname 
FROM Student
WHERE sid IN (SELECT E1.sid
FROM Enrolled E1, Enrolled E2, Class C1, Class C2
WHERE E1.sid = E2.sid AND E1.cnum <> E2.cnum AND E1.cnum = C1.cnum AND E2.cnum = C2.cnum AND C1.meets_at = C2.meets_at);

BEGIN
   DBMS_OUTPUT.PUT_LINE('Query #4');
END;
/
SELECT fname 
FROM Faculty 
WHERE NOT EXISTS (SELECT C.room
FROM Class C Where C.room NOT IN(SELECT C1.room
FROM Class C1
WHERE C1.fid = Faculty.fid ));

BEGIN
   DBMS_OUTPUT.PUT_LINE('Query #5');
END;
/
Select Fname 
From Faculty
Where (Select count(Enrolled.cnum)
	From class,enrolled
	Where class.fid=Faculty.fid AND enrolled.cnum=Class.cnum
	)>8; 	

BEGIN
   DBMS_OUTPUT.PUT_LINE('Query #6');
END;
/
Select slevel,avg(age) 
from Student
group by slevel
having slevel<>'JR';

BEGIN
   DBMS_OUTPUT.PUT_LINE('Query #7');
END;
/
Select sname 
From Student
Where sid in(
Select E.sid
from Enrolled E
group by E.sid
having count(E.cnum)= (
select max(count(E.cnum)) 
from Enrolled E
group by E.sid));

BEGIN
   DBMS_OUTPUT.PUT_LINE('Query #8');
END;
/
Select sname 
From Student
Where NOT EXISTS (Select *
	   From Enrolled
	   where sid=student.sid
	   );

									
BEGIN
   DBMS_OUTPUT.PUT_LINE('Query #9');
END;
/
Select age,max(slevel) 
from Student
group by age,slevel;


BEGIN
   DBMS_OUTPUT.PUT_LINE('Query #10');
END;
/


select ( (select count(sid)/&x
from Enrolled
where cnum in (Select Class.cnum 
		from Class
		where Class.fid in ( Select F1.fid 
			      from Faculty F1 
			      where F1.dept ='EE')))-(select count(sid)
from Enrolled
where cnum in (Select Class.cnum
                from Class
                where Class.fid in ( Select F1.fid
                              from Faculty F1
                              where F1.dept ='CS'))))from DUAL;


BEGIN
   DBMS_OUTPUT.PUT_LINE('Query #11');
END;
/
Select F1.fname
from Faculty F1
where ((Select count(E1.sid) from Enrolled E1,Class C1 Where C1.fid=F1.fid AND E1.cnum=C1.cnum) > (select count(E2.sid)/&x
from Enrolled E2
where E2.cnum in (Select C2.cnum
                from Class C2
                where C2.fid in ( Select F2.fid
                              from Faculty F2
                              where F2.dept ='EE'))));


BEGIN
   DBMS_OUTPUT.PUT_LINE('Query #12');
END;
/
Select fname
From Faculty 
Where dept = 'EE' AND fid <> 3 AND NOT EXISTS(Select *
from Class C1,Class C2
where C1.fid = Faculty.fid AND C2.fid=3 AND C1.meets_at=C2.meets_at);


BEGIN
   DBMS_OUTPUT.PUT_LINE('Query #13');
END;
/
Select sname 
From Student
Where NOT EXISTS(Select sid
		From Enrolled
		where Student.sid = sid AND cnum IN
			(Select cnum
			From prerequisite));
			
BEGIN
   DBMS_OUTPUT.PUT_LINE('Query #14');
END;
/
Select cnum 
From Class C
where meets_at<>(Select meets_at
		from Class C1
		where Exists (Select prereq 
	         from Prerequisite
		Where cnum=C.cnum AND prereq=C1.cnum));



BEGIN
   DBMS_OUTPUT.PUT_LINE('Query #15');
END;
/

Select fname 
From Faculty
Where Fid in(
Select c1.fid
from class c1, class c2
where										
c1.fid=c2.fid and c1.cnum<>c2.cnum and 
 (c1.cnum,c2.cnum) in (Select cnum,prereq
             From prerequisite)
group by c1.fid);


BEGIN
   DBMS_OUTPUT.PUT_LINE('Query #16');
END;
/
Select cnum 
from Class
Where NOT EXISTS (Select P1.cnum from Prerequisite P1 where P1.cnum=Class.cnum 
		 AND EXISTS (Select P2.cnum from Prerequisite P2 where P2.cnum=P1.prereq 
		 AND EXISTS (Select P3.cnum from Prerequisite P3 where P3.cnum=P2.prereq
		 AND EXISTS (Select P4.cnum from Prerequisite P4 where P4.cnum=P3.prereq
		 AND EXISTS (Select P5.cnum from Prerequisite P5 where P5.cnum=P4.prereq)))));


BEGIN
   DBMS_OUTPUT.PUT_LINE('Query #17');
END;
/
Select sname,C1.cnum,C2.cnum
from Student,Class C1,Class C2
where C1.cnum in(Select Cnum from Enrolled Where sid= Student.sid AND EXISTS
	    (Select P1.cnum from Prerequisite P1 where P1.cnum=Enrolled.cnum
	    AND EXISTS(Select P2.cnum from Prerequisite P2 where P2.cnum=P1.prereq
	    AND NOT EXISTS(Select P3.cnum from Prerequisite P3 where P3.cnum=P2.prereq))))AND EXISTS (Select P4.cnum from Prerequisite P4 where P4.prereq = C2.cnum
	    AND EXISTS( Select P5.cnum from Prerequisite P5 where P5.prereq=P4.cnum AND P5.cnum=C1.cnum)); 

BEGIN 
   DBMS_OUTPUT.PUT_LINE('View # A'); 
END; 
/
select *
from ViewA;

BEGIN 
   DBMS_OUTPUT.PUT_LINE('View # B'); 
END; 
/
select *
from ViewB;



