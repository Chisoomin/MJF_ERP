show tables from MJFdb;
use MJFdb;
CREATE TABLE MJFdb.member_table (
 num        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 member_id     VARCHAR(20),
 member_name    VARCHAR(100),
 email_address   VARCHAR(100),
 department    VARCHAR(20),
 team    VARCHAR(20),
 entrydate    VARCHAR(20),
 resigndate    VARCHAR(20)
);
use MJFdb;
drop table member_table;

select * from MJFdb.member_table;