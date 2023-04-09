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
CREATE TABLE MJFdb.masterdata_company (
 account_code_mjf VARCHAR(20),
 account_name_mjf VARCHAR(20),
 account_ceo_mjf VARCHAR(20),
 account_address_mjf VARCHAR(20),
 account_type_mjf VARCHAR(20),
 account_item_mjf VARCHAR(20)
);
use MJFdb;
drop table MJFdb.member_table;
drop table MJFdb.member_webidpw;
drop table MJFdb.sales;
drop table MJFdb.masterdata_team;
drop table MJFdb.masterdata_company;
-----------------drop--------------------------------------------
select * from MJFdb.member_table;
select * from MJFdb.masterdata_company;

insert into MJFdb.masterdata_team(team_data) values('?곸뾽 4?');
insert into MJFdb.masterdata_company(account_code_mjf,account_name_mjf,account_ceo_mjf,account_address_mjf,account_type_mjf,account_item_mjf)
values('110-87-77775','紐낆? 媛援?,'?숈씤??,'?쒖슱?밸퀎???쒕?臾멸뎄 媛醫뚮줈 134','?꾩냼留?,'媛援? ?먯옄??);

select * from MJFdb.account_table;
select * from MJFdb.order_table;
select * from MJFdb.product_table;
select * from MJFdb.masterdata_team;

select * from MJFdb.member_webidpw;