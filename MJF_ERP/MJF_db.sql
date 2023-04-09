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
CREATE TABLE MJFdb.order_table_test (
 num        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 order_num VARCHAR(20), 
 order_date VARCHAR(20), 
 delivery_date VARCHAR(20), 
 account_code VARCHAR(20), 
 account_name VARCHAR(20), 
 product_code VARCHAR(20), 
 product_name VARCHAR(20), 
 product_color VARCHAR(20), 
 product_measure VARCHAR(20), 
 product_quantity INT, 
 product_price INT, 
 supply_price INT, 
 vat INT, 
 member_id VARCHAR(20), 
 member_name VARCHAR(20), 
 order_progress VARCHAR(20)
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
select * from MJFdb.order_table;

insert into MJFdb.masterdata_team(team_data) values('영업 4팀');
insert into MJFdb.masterdata_company(account_code_mjf,account_name_mjf,account_ceo_mjf,account_address_mjf,account_type_mjf,account_item_mjf)
values('110-87-77775','명지 가구','동인윤', '서울특별시 서대문구 가좌로 134', '도소매', '가구, 원자재');

insert into MJFdb.order_table_test(order_num, order_date, delivery_date, account_code, account_name, product_code, product_name, product_color, product_measure, product_quantity, product_price, supply_price, vat, member_id, member_name, order_progress)
values('221022-002', '2022-10-22','2022-11-22','110-82-00415','명지전문대학','H-OG-14-4','조립식 책꽂이','주황색','낱개',20,60000,1200000,120000, '20200102001','지수민','진행중');
select * from MJFdb.account_table;
select * from MJFdb.order_table;
select * from MJFdb.product_table;
select * from MJFdb.masterdata_team;

select * from MJFdb.member_webidpw;