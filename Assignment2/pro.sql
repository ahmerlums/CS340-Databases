set serveroutput on;
create or replace procedure pro_print_borrower
AS
temp number;
booktitle varchar2(50);
bor_name varchar2(30);
cursor mycur is select * from issue;
myvar mycur%ROWTYPE;
diff number;
begin
dbms_output.put_line('Borrower Name     Book Title      <= 5days    <=10days     <=15days     >15days');
for myvar in mycur
loop
if (myvar.return_date is NULL) then
select name into bor_name from Borrower where borrower_id = myvar.borrower_id;
select book_title into booktitle from books where book_id = myvar.book_id;
diff := floor(current_date-myvar.issue_date);

if(diff <= 5) then
dbms_output.put_line(bor_name ||'        ' || booktitle || '       ' || diff);
elsif (diff<=10) then
dbms_output.put_line(bor_name ||'        ' || booktitle || '             ' || diff);
elsif (diff<=15) then
dbms_output.put_line(bor_name ||'        ' || booktitle || '                     ' || diff);
else
dbms_output.put_line(bor_name ||'        ' || booktitle || '                                         ' || diff);
end if;
end if;
end loop;
end;
/

create or replace procedure pro_print_fine(curdate in date)
AS
diff number;
bor_name varchar2(30);
cursor mycur is select * from issue;
myvar mycur%ROWTYPE;

begin
dbms_output.put_line('Borrower Name   Book ID    Issue Date     Fine');
for myvar in mycur
loop
if (myvar.return_date is NULL) then
diff := curdate - myvar.issue_date;
if (diff > 5) then
select name into bor_name from Borrower where borrower_id = myvar.borrower_id;
dbms_output.put_line(bor_name || '        ' || myvar.book_id || '       ' || myvar.issue_date || '     $' || floor(diff-5)*5);

end if;
end if;
end loop;
end;
/

create or replace procedure pro_listborr_mon(bor_id in number,m in varchar,y in varchar)
AS
bor_name  varchar2(30);
booktitle  varchar2(50);
cursor mycur is select * from issue;
myvar mycur%ROWTYPE;
begin

dbms_output.put_line('ID  Borrower Name    BookId    BookTitle     Issue Date    ReturnDate');
for myvar in mycur
loop
if (to_char(myvar.issue_date,'MON')=m and to_char(myvar.issue_date,'YYYY')=y and myvar.borrower_id=bor_id) then
select name into bor_name from borrower where borrower_id = bor_id;
select book_title into booktitle from books where book_id = myvar.book_id;  
dbms_output.put_line(bor_id || '     ' || bor_name || '      ' || myvar.book_id || '      ' || booktitle || '     ' || myvar.issue_date || '       '|| myvar.return_date);
end if;
end loop;
end;
/


create or replace procedure pro_listborr
AS 
bor_name varchar2(30);
cursor mycur is select * from issue;
myvar mycur%ROWTYPE;
begin
dbms_output.put_line('Borrower Name   Book ID    Issue Date');
for myvar in mycur
loop
if (myvar.return_date is NULL) then
select name into bor_name from borrower where borrower_id = myvar.borrower_id;
dbms_output.put_line(bor_name|| '      '|| myvar.book_id || '        ' || myvar.issue_date);
end if;
end loop;
end;
/

create or replace procedure pro_list_popular
AS
authorname varchar2(30);
noofeditions number;
cursor mycur is select to_char(issue_date,'MON') AS MON ,to_char(issue_date,'YYYY') AS YEAR,(book_id) from issue I
group by to_char(issue_date,'MON'),to_char(issue_date,'YYYY'),book_id
having count(*) >= (select max(count(*)) from Issue I1 where  to_char(I1.issue_date,'MON') = to_char(I.issue_date,'MON') and
to_char(I1.issue_date,'YYYY') = to_char(I.issue_date,'YYYY')  group by I1.book_id);
myvar mycur%ROWTYPE;
begin
dbms_output.put_line('Month  Year  AuthorName  Editions');
for myvar in mycur
loop
select name into authorname from author A, books B where A.author_id = B.author_id AND B.book_id = myvar.book_id; 
select count(*) into noofeditions from books where book_title = (select B.book_title from books B where B.book_id = myvar.book_id);
dbms_output.put_line(myvar.mon || '    ' || myvar.year || '    ' || authorname || '     ' || noofeditions);
end loop;
end;
/

