@createtable
@populate
@tgr
@fun
@pro
set serveroutput on

declare
temp number;
begin
temp := fun_issue_book(3, 1, '2-Jan-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_book(4, 3, '24-Mar-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_book(1, 2, '20-Feb-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_book(6, 1, '8-Jan-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_anyedition(2,'DATA MANAGEMENT','C.J. DATES','3-Mar-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_anyedition(4,'CALCULUS','H. ANTON','4-Mar-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_anyedition(5,'ORACLE','ORACLE PRESS','4-Mar-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_anyedition(10,'IEEE MULTIMEDIA','IEEE','27-Feb-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_anyedition(2,'MIS MANAGEMENT','C.J. CATES','3-May-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_anyedition(4,'CALCULUS II','H. ANTON','4-Mar-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_anyedition(10,'ORACLE','ORACLE PRESS','4-Mar-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_anyedition(5,'IEEE MULTIMEDIA','IEEE','26-Feb-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_anyedition(2,'DATA SRUCTURE','W. GATES','3-Mar-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_anyedition(4,'CALCULUS III','H. ANTON','4-Apr-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_anyedition(11,'ORACLE','ORACLE PRESS','8-Mar-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_anyedition(6,'IEEE MULTIMEDIA','IEEE','17-Feb-2015');
dbms_output.put_line(temp);
end;
/


execute pro_print_borrower;
execute pro_print_fine(current_date);

declare
temp number;
begin
temp := fun_return_book(1,current_date);
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_return_book(2,current_date);
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_return_book(4,current_date);
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_return_book(10,current_date);
dbms_output.put_line(temp);
end;
/


select * from pending_request;
select * from issue;

execute pro_listborr_mon(10,'FEB','2015');
execute pro_listborr_mon(4,'MAR','2015');
execute pro_listborr;
execute pro_list_popular;



create or replace procedure avg_time
AS
cursor mycur is select * from pending_request where issue_date is not NULL;
myvar mycur%ROWTYPE;
diff number;
total number;
begin
diff:=0;
for myvar in mycur
loop
diff := diff+floor(myvar.issue_date-myvar.request_date);
end loop;
select count(*) into total from pending_request where issue_date is not NULL;
dbms_output.put_line('The average waiting time is ' || floor(diff/total) || ' days' );
end;
/

create or replace procedure max_time
AS
cursor mycur is select * from pending_request where issue_date is not NULL;
myvar mycur%ROWTYPE;
diff number;
bor_name varchar2(30);
maxi number;
id number;
begin
diff:=0;
maxi:=-999;
for myvar in mycur
loop
diff := floor(myvar.issue_date-myvar.request_date);
if (diff > maxi) then
maxi := diff;
id := myvar.requester_id;
end if;
end loop;
select name into bor_name from borrower where borrower_id=id;
dbms_output.put_line('The borrower with id  ' || id || ' and name ' || bor_name || ' has waited the longest');
end;
/

execute avg_time;
execute max_time;

@dropall
