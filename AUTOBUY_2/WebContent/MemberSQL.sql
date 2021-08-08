drop table member;

--회원 테이블 생성----------------------------------------------------------------
create table member
(customer_id varchar2(30) primary key,
customer_pw varchar2(12) not null,
nickName varchar2(50) not null,
customer_type varchar2(20) not null,
store_name varchar2(50) not null,
client_resgist_number varchar2(30),
address varchar2(255) not null,
ceo varchar2(30),
tel varchar2(13) not null,
email varchar2(30),
payment varchar2(25)
);

select * from member;
------------------------------------------------------------------------------
select * from v$resource_limit where resource_name = 'processes';

conn system/1234