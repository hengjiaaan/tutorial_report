create database campus;
use campus;

SET SQL_SAFE_UPDATES = 0;

-- initiate main empty table
create table jsc_main (timestamp mediumtext, id mediumtext, en_time mediumtext, x_time mediumtext, reformated_entry_date datetime);
select * from jsc_main;
drop table jsc_main;


-- import csv file as new table (newjsc)
-- set reformated_entry_date as datetime type (%Y-%m-%d)
select * from newjsc;

-- add new data as new newjsc
drop table newjsc;
select * from newjsc;

-- create temporary table that is a copy of main table
create table jsc_temp like jsc_main;
insert into jsc_temp select * from jsc_main;
select * from jsc_temp;

-- drop main table and create new main table that is concatanation of new table and original table
drop table jsc_main;
create table jsc_main (select * from newjsc) UNION (select * from jsc_temp);
select * from jsc_main;

delete from jsc_main where reformated_entry_date < now() - interval 5 DAY;
select * from jsc_main;




