create or replace trigger trg_maxbooks
before insert on Issue
for each row
declare
noofbooks NUMBER;
newstatus varchar2(20);
Error1 Exception;
error2 exception;
begin
Select count(*)into noofbooks from issue where borrower_id=:new.borrower_id;
Select B.status into newstatus from borrower B where B.borrower_id=:new.borrower_id;
if (noofbooks>=2 and newstatus='student') then
raise error1;
End if;
if (noofbooks>=3 and newstatus='faculty') then
raise error2;
End if;
EXCEPTION
when error1 then
raise_application_error(-20000,'more than 2 books');
when error2 then
raise_application_error(-20017,'more than 3 books');
end;
/


create or replace trigger trg_issue
after insert on Issue
for each row 
begin
update books set status ='issued' where book_id = :new.book_id;
end;
/


create or replace trigger trg_notissue
after delete or update on Issue
for each row
begin
update books set status ='not_issued' where book_id = :old.book_id;
end;
/

