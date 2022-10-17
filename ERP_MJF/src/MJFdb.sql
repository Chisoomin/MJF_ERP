show tables from MJFdb;
use MJFdb;
CREATE TABLE MJFdb.member_table (
 num        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 member_id     VARCHAR(20),
 member_name    VARCHAR(100),
 email_address   VARCHAR(100),
 team    VARCHAR(20),
 memposition     VARCHAR(20),
 entrydate    VARCHAR(20),
 resigndate    VARCHAR(20)
);

CREATE TABLE MJFdb.member_webidpw (
 num        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 member_webid     VARCHAR(20),
 member_webpw    VARCHAR(20)
);

CREATE TABLE MJFdb.masterdata_team (
 num        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 team_data    VARCHAR(10)
);
use MJFdb;
drop table MJFdb.member_table;
drop table MJFdb.sales;
drop table MJFdb.masterdata_team;

select * from MJFdb.member_table;

insert into MJFdb.masterdata_team(team_data) values('영업 4팀');

select * from MJFdb.account_table;
select * from MJFdb.order_table;
select * from MJFdb.masterdata_team;

select * from MJFdb.member_webidpw;