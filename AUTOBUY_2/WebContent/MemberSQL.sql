drop table member;

--회원 테이블 생성----------------------------------------------------------------
create table member
(customer_id varchar2(30) primary key,
customer_pw varchar2(12) not null,
nickName varchar2(50) not null,
customer_type varchar2(20) not null,
store_name varchar2(30),
client_resgist_number varchar2(30),
address varchar2(50),
ceo varchar2(10),
tel varchar2(13),
email varchar2(20),
payment varchar2(10)
)

select * from member;
------------------------------------------------------------------------------
