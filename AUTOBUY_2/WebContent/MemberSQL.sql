drop table member

create table member
(customer_id varchar2(10) primary key,
customer_pw varchar2(12) not null,
nickName varchar2(10) not null,
store_name varchar2(30),
client_resgist_number varchar2(30),
address varchar2(50),
ceo varchar2(10),
tel varchar2(13),
email varchar2(20),
payment varchar2(10)           
)

<<<<<<< HEAD
insert into MEMBER(customer_id,customer_pw,nickName)
values('ddd','dd','dd')
=======
insert into MEMBER
values ('d','d','d','null')
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/AUTOBUY.git
