create or replace function fun_issue_book(borrowid in number,bookid in number,curdate in date)
return number is s number;
begin 
declare
cur varchar2(20);
isdate date;
a number;
begin
select count(*) into a from Issue  where book_id = bookid and borrower_id = borrowid and return_date is NULL;
if (a <> 0) then
dbms_output.put_line('Book already issued to borrower');
return(0);
else
select B.status into cur from books B where B.book_id = bookid; 
if (cur <> 'issued') then 
update books set status = 'issued' where book_id = bookid;
insert into issue values(bookid,borrowid,curdate,NULL);
s:=1;
else
insert into pending_request values(bookid,borrowid,curdate,NULL);
s:=0;
end if;
return(s);
end if;
end;
end;
/


create or replace function fun_issue_anyedition(borrower_id in number,booktitle in varchar2, author_name in varchar2, curdate in date)
return number is res number;
begin 
declare
bid number;
aid number;
cont number;
cont1 number;
cont2 number;
isdate date;
error exception;
begin
res:=1;
select count(author_id) into cont2 from author  where name = author_name;
if (cont2 > 0 ) then
select author_id into aid from author  where name = author_name;
select count(*) into cont from books B where exists (Select * from books C where C.book_title = booktitle and C.author_id=aid);
if (cont > 0) then 
select count(B.book_id) into cont1 from books B where B.book_id in (Select C.book_id from books C where C.book_title = booktitle and author_id=aid and status <> 'issued');
if (cont1 > 0) then
select distinct(B.book_id) into bid from books B where status <> 'issued' and book_title=booktitle and edition = (Select max(C.edition) from books C where C.year_of_publication =(select max(D.year_of_publication) from books D where D.book_title=booktitle and status <> 'issued')and C.book_title = booktitle and author_id=aid and status <> 'issued' and B.edition=C.edition);
update books set status = 'issued' where book_id = bid;
insert into issue values(bid,borrower_id,curdate,NULL);
else
select min(I.issue_date) into isdate from issue I where I.book_id in (select B.book_id from books B where B.book_title = booktitle);
select B.book_id into bid from Books B,Issue I where B.book_id = I.book_id and B.book_title= book_title and I.issue_date=isdate and rownum = 1 ;
insert into pending_request values(bid,borrower_id,curdate,NULL);
res:=0;
end if;
else 
raise error;
end if;
else 
raise error;
end if;
return(res);
EXCEPTION
when error then
raise_application_error(-20000,'no book or author');
return(0);
end;
end;
/

create or replace function fun_most_popular(m in varchar2,y in varchar2)
return varchar2 is res varchar2(30);
begin
declare
temp number;
cursor mycur is select book_id from issue where to_char(issue_date,'MON') = m and to_char(issue_date,'YYYY') = y group by book_id
having count(*) >= (select max(count(*)) from Issue I where  to_char(I.issue_date,'MON') = m and to_char(I.issue_date,'YYYY') = y  group by I.book_id);
myvar mycur%ROWTYPE;
begin
for myvar in mycur
loop
res := res || myvar.book_id || ' ';
end loop;
return(res);
end;
end;
/

create or replace function fun_return_book(bookid in number,curdate in date)
return number is res number;
begin
declare
wdate date;
temp number;
cond number;
id number;
begin
res :=1;
cond :=0;
select count(*) into temp from issue where book_id =bookid;
if (temp=0) then
res :=0;
return(res);
else
update issue set return_date = curdate where book_id = bookid;
select count(*) into cond from pending_request where book_id = bookid;
if (cond <> 0) then
select min(request_date) into wdate from pending_request where book_id = bookid;
select requester_id into id from pending_request where book_id = bookid and request_date = wdate AND issue_date is NULL and rownum=1;
update pending_request set issue_date=curdate where book_id=bookid and request_date = wdate and requester_id = id;
insert into issue values(bookid,id,curdate,NULL);
end if;
return(res);
end if;
end;
end;
/

create or replace function fun_renew_book(borrowerid in number,bid in number, curdate in date)
return number is res number;
begin
declare
cond1 number;
cond2 number;
err1 exception;
err2 exception;
begin
select count(*) into cond1 from issue where borrower_id = borrowerid and book_id = bid and return_date is null;
if (cond1<>0) then
select count(*) into cond2 from pending_request where book_id=bid and issue_date is NULL;
if (cond2=0) then
update issue set issue_date=curdate where book_id=bid and borrower_id = borrowerid;
else
raise err2;
end if;
else
raise err1;
end if;
return(1);
EXCEPTION
when err1 then
raise_application_error(-20000,'no book issued');
return(0);
when err2 then
raise_application_error(-20000,'pending request');
return(0);
end;
end;
/


set serveroutput on;

