rem CS 340 Programming Assignment 1
rem Muhammad Ahmer Ali
rem 17100033


INSERT INTO STUDENT (sid, sname, major, slevel, age)
	values (1,'John','EE','FR',18);
INSERT INTO STUDENT (sid, sname, major, slevel, age)
	values (2,'Tim','EE','FR',19);
INSERT INTO STUDENT (sid, sname, major, slevel, age)
	values (3,'Richard','EE','SO',20);
INSERT INTO STUDENT (sid, sname, major, slevel, age)
	values (4,'Edward','EE','SO',21);
INSERT INTO STUDENT (sid, sname, major, slevel, age)
	values (5,'Alber','CS','JR',22);
INSERT INTO STUDENT (sid, sname, major, slevel, age)
	values (6,'Mary','EE','JR',22);
INSERT INTO STUDENT (sid, sname, major, slevel, age)
	values (7,'Jack','EE','SR',23);
INSERT INTO STUDENT (sid, sname, major, slevel, age)
	values (8,'Julian','EE','SR',22);
INSERT INTO STUDENT (sid, sname, major, slevel, age)
	values (9,'Sam','CS','SR',24);
INSERT INTO STUDENT (sid, sname, major, slevel, age)
	values (10,'Ram','EE','SR',23);
INSERT INTO STUDENT (sid, sname, major, slevel, age)
	values (11,'Rick','EE','SR',24);

INSERT INTO FACULTY (fid, fname, dept)
	values (1,'Prof. James','EE');
INSERT INTO FACULTY (fid, fname, dept)
	values (2,'Prof. Brown','CS');
INSERT INTO FACULTY (fid, fname, dept)
	values (3,'Prof. Wasfi','EE');
INSERT INTO FACULTY (fid, fname, dept)
	values (4,'Prof. Latif','EE');
INSERT INTO FACULTY (fid, fname, dept)
	values (5,'Prof. Rutherford','MA');

INSERT INTO CLASS (cnum, meets_at, room, fid)
	values ('EE101', to_date('9:00','HH24:MI'),'117',1);
INSERT INTO CLASS (cnum, meets_at, room, fid)
	values ('EE102', to_date('10:00','HH24:MI'),'117',2);
INSERT INTO CLASS (cnum, meets_at, room, fid)
	values ('CS102', to_date('14:00','HH24:MI'),'118',3);
INSERT INTO CLASS (cnum, meets_at, room, fid)
	values ('EE104', to_date('13:00','HH24:MI'),'117',3);
INSERT INTO CLASS (cnum, meets_at, room, fid)
	values ('EE151', to_date('15:00','HH24:MI'),'117',4);
INSERT INTO CLASS (cnum, meets_at, room, fid)
	values ('EE261', to_date('9:00','HH24:MI'),'118',4);
INSERT INTO CLASS (cnum, meets_at, room, fid)
	values ('MA365', to_date('10:00','HH24:MI'),'118',5);
INSERT INTO CLASS (cnum, meets_at, room, fid)
	values ('EE347', to_date('13:00','HH24:MI'),'118',1);
INSERT INTO CLASS (cnum, meets_at, room, fid)
	values ('EE404', to_date('9:00','HH24:MI'),'115',3);
INSERT INTO CLASS (cnum, meets_at, room, fid)
	values ('MA448', to_date('12:00','HH24:MI'),'115',5);
INSERT INTO CLASS (cnum, meets_at, room, fid)
	values ('CS480', to_date('13:00','HH24:MI'),'115',1);

INSERT INTO PREREQUISITE(cnum,prereq)
	values ('EE102','EE101');
INSERT INTO PREREQUISITE(cnum,prereq)
	values ('EE104','EE102');
INSERT INTO PREREQUISITE(cnum,prereq)
	values ('EE151','EE104');
INSERT INTO PREREQUISITE(cnum,prereq)
	values ('EE261','EE151');
INSERT INTO PREREQUISITE(cnum,prereq)
	values ('MA448','MA365');
INSERT INTO PREREQUISITE(cnum,prereq)
	values ('EE347','EE261');
INSERT INTO PREREQUISITE(cnum,prereq)
	values ('EE404','EE347');
INSERT INTO PREREQUISITE(cnum,prereq)
	values ('CS480','CS102');

INSERT INTO ENROLLED (cnum, sid)
	values ('EE101',1);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE101',2);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE101',3);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE101',4);
INSERT INTO ENROLLED (cnum, sid)
	values ('CS102',1);
INSERT INTO ENROLLED (cnum, sid)
	values ('CS102',2);
INSERT INTO ENROLLED (cnum, sid)
	values ('CS102',4);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE104',1);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE104',2);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE104',3);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE151',4);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE151',5);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE151',6);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE261',1);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE261',2);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE261',3);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE261',4);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE261',5);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE261',7);
INSERT INTO ENROLLED (cnum, sid)
	values ('MA365',5);
INSERT INTO ENROLLED (cnum, sid)
	values ('MA365',6);
INSERT INTO ENROLLED (cnum, sid)
	values ('MA365',7);
INSERT INTO ENROLLED (cnum, sid)
	values ('MA365',8);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE347',5);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE347',7);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE347',8);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE347',9);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE404',9);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE404',10);
INSERT INTO ENROLLED (cnum, sid)
	values ('EE404',7);
INSERT INTO ENROLLED (cnum, sid)
	values ('MA448',7);
INSERT INTO ENROLLED (cnum, sid)
	values ('MA448',8);
INSERT INTO ENROLLED (cnum, sid)
	values ('MA448',9);
INSERT INTO ENROLLED (cnum, sid)
	values ('MA448',10);
INSERT INTO ENROLLED (cnum, sid)
	values ('CS480',6);
INSERT INTO ENROLLED (cnum, sid)
	values ('CS480',7);
INSERT INTO ENROLLED (cnum, sid)
	values ('CS480',8);
INSERT INTO ENROLLED (cnum, sid)
	values ('CS480',9);

