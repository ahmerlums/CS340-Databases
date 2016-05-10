drop trigger trg_maxbooks;
drop trigger trg_issue;
drop trigger trg_notissue;

drop function fun_issue_book;
drop function fun_issue_anyedition;
drop function fun_return_book;
drop function fun_renew_book;
drop function fun_most_popular;

drop procedure pro_print_borrower;
drop procedure pro_print_fine;
drop procedure pro_listborr_mon;
drop procedure pro_listborr;
drop procedure pro_list_popular;

drop table issue;
drop table pending_request;
drop table books;
drop table author;
drop table borrower;

