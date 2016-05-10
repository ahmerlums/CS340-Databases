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
temp := fun_renew_book(4, 3, '28-Mar-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_book(1, 1, '1-Apr-2015');
dbms_output.put_line(temp);
end;
/


declare
temp number;
begin
temp := fun_renew_book(3, 1, '28-Mar-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_anyedition(3,'CALCULUS III','H. ANTON','2-Apr-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_anyedition(4,'CALCULUS III','H. ANTON','3-Apr-2015');
dbms_output.put_line(temp);
end;
/

declare
temp number;
begin
temp := fun_issue_anyedition(5,'CALCULUS III','H. ANTON','4-Apr-2015');
dbms_output.put_line(temp);
end;
/


select * from pending_request;

declare
temp number;
begin
temp := fun_return_book(3,'4-Apr-2015');
dbms_output.put_line(temp);
end;
/

select * from pending_request;
select * from issue;

execute pro_print_fine(current_date);
execute pro_print_borrower;
execute pro_list_popular;
execute pro_listborr;
@dropall


