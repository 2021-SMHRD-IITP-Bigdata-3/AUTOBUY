--------- 삭제 ---------

drop table stock;
drop table sale;
drop table material;
drop table menu;
drop sequence menu_num;
drop table detail_order;
drop table order_suggest;
drop table customer_order;
drop table member;
drop table product;
drop sequence product_num;
drop table makeordernum;


select * from customer_order;
select * from DETAIL_ORDER;


delete DETAIL_ORDER;
delete customer_order;



--------- 생성 ---------

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


create table product(
product_num  number(20),
product_name varchar2(50),
supplier_name varchar2(20) not null,
product_price number(20) not null,
product_qntty number(20) not null,
product_pic varchar2(100),

constraint pk_product primary key(product_num, product_name)
);


create sequence product_num
start with 101
increment by 1;

insert into product values(product_num.nextval, '빨대 100개입',   '니니언즈유통', 1000, 100000, '101.jpg');
insert into product values(product_num.nextval, '컵 100개입',   '니니언즈유통', 10000, 100000,'102.jpg');
insert into product values(product_num.nextval, '컵뚜껑 100개입',   '니니언즈유통', 3000, 100000, '103.jpg');
insert into product values(product_num.nextval, '컵홀더 100개입',   '니니언즈유통', 2000, 100000, '104.jpg');
insert into product values(product_num.nextval, '원두 1kg',   '니니언즈유통', 10000, 100000, '105.jpg');
insert into product values(product_num.nextval, '우유 1L',   '니니언즈유통', 1500, 100000, '106.jpg');
insert into product values(product_num.nextval, '탄산수 20개입',   '니니언즈유통', 6000, 100000, '107.jpg');
insert into product values(product_num.nextval, '골드메달 애플주스 20개입',   '니니언즈유통', 25000, 100000, '108.jpg');
insert into product values(product_num.nextval, '소다워터 탄산수 20개입',   '니니언즈유통', 35000, 100000,'109.jpg');
insert into product values(product_num.nextval, '바닐라시럽 1L',   '오도바이유통', 6000, 100000, '100.jpg');
insert into product values(product_num.nextval, '카라멜시럽 1L',   '오도바이유통', 12000, 100000, '111.jpg');
insert into product values(product_num.nextval, '헤이즐럿시럽 1L',   '오도바이유통', 12000, 100000, '112.jpg');
insert into product values(product_num.nextval, '슈가시럽 1L',   '오도바이유통', 2000, 100000, '113.jpg');
insert into product values(product_num.nextval, '레몬시럽 1L ',   '오도바이유통', 12000, 100000, '114.jpg');
insert into product values(product_num.nextval, '청포도시럽 1L ',   '오도바이유통', 10000, 100000, '115.jpg');
insert into product values(product_num.nextval, '자몽시럽 1L ',   '오도바이유통', 10000, 100000, '116.jpg');
insert into product values(product_num.nextval, '페퍼민트티 20개입',   '오도바이유통', 4000, 100000, '117.jpg');
insert into product values(product_num.nextval, '캐모마일티 20개입',   '오도바이유통', 4000, 100000, '118.jpg');


create sequence menu_num
increment by 1
start with 1;


create table menu(
menu_num number(20) primary key,
menu_name varchar2(40) not null,
price number(20) not null
);

insert into menu values(menu_num.nextval, '아메리카노',3000);
insert into menu values(menu_num.nextval, '카페라떼',4000);
insert into menu values(menu_num.nextval, '바닐라라떼',4500);
insert into menu values(menu_num.nextval, '카라멜마끼야또',5000);
insert into menu values(menu_num.nextval, '레몬에이드',4500);
insert into menu values(menu_num.nextval, '페퍼민트티',4500);


create table sale(
menu_num number(20) not null,
menu_name varchar2(50) not null,
sold_qntty number(20) not null,
sold_date date,

constraint menu_fk foreign key(menu_num)
references menu(menu_num)
on delete cascade
);


create table material(
menu_num number(20) not null,
product_num number(20) not null,
product_name varchar2(50) not null,
necessary_qntty number(20,3) not null,

constraint material_fk foreign key(menu_num)
references menu(menu_num)
on delete cascade,

constraint material_fk2 foreign key(product_num, product_name)
references product(product_num, product_name)
on delete cascade
);


insert into material values(1, 101, '빨대 100개입', 0.01);
insert into material values(1, 102, '컵 100개입',  0.01);
insert into material values(1, 103, '컵뚜껑 100개입', 0.01);
insert into material values(1, 104, '컵홀더 100개입', 0.01);
insert into material values(1, 105, '원두 1kg', 0.02);

insert into material values(2, 101, '빨대 100개입', 0.01);
insert into material values(2, 102, '컵 100개입', 0.01);
insert into material values(2, 103, '컵뚜껑 100개입', 0.01);
insert into material values(2, 104, '컵홀더 100개입', 0.01);
insert into material values(2, 105, '원두 1kg', 0.02);
insert into material values(2, 106, '우유 1L', 0.2);

insert into material values(3, 101, '빨대 100개입', 0.01);
insert into material values(3, 102, '컵 100개입',  0.01);
insert into material values(3, 103, '컵뚜껑 100개입', 0.01);
insert into material values(3, 104, '컵홀더 100개입', 0.01);
insert into material values(3, 105, '원두 1kg', 0.02);
insert into material values(3, 106, '우유 1L', 0.2);
insert into material values(3, 110, '바닐라시럽 1L', 0.02);

insert into material values(4, 101, '빨대 100개입', 0.01);
insert into material values(4, 102, '컵 100개입', 0.01);
insert into material values(4, 103, '컵뚜껑 100개입', 0.01);
insert into material values(4, 104, '컵홀더 100개입', 0.01);
insert into material values(4, 105, '원두 1kg', 0.02);
insert into material values(4, 106, '우유 1L', 0.2);
insert into material values(4, 111, '카라멜시럽 1L', 0.02);

insert into material values(5, 101, '빨대 100개입', 0.01);
insert into material values(5, 102, '컵 100개입',  0.01);
insert into material values(5, 103, '컵뚜껑 100개입', 0.01);
insert into material values(5, 104, '컵홀더 100개입', 0.01);
insert into material values(5, 107, '탄산수 20개입', 0.5);
insert into material values(5, 114, '레몬시럽 1L ', 0.02);

insert into material values(6, 101, '빨대 100개입', 0.01);
insert into material values(6, 102, '컵 100개입', 0.01);
insert into material values(6, 103, '컵뚜껑 100개입', 0.01);
insert into material values(6, 104, '컵홀더 100개입', 0.01);
insert into material values(6, 117, '페퍼민트티 20개입', 0.5);


create table stock(
customer_id varchar2(30) not null,
product_num number(20) not null,
product_name varchar2(50) not null,
supplier_name varchar2(50) not null,
product_price number(20) not null,
stock_qntty number(20,3),
minimum_qntty number(20),
standard_qntty number(20),
product_pic varchar2(100),

constraint id_fk foreign key(customer_id)
references member(customer_id)
on delete cascade,

constraint stock_fk foreign key(product_num, product_name)
references product(product_num, product_name)
on delete cascade
);


create table customer_order(
order_num varchar2(50) primary key,
customer_id varchar2(20) not null, 
customer_store_name varchar2(30) not null,
customer_tel varchar2(20) not null,
customer_add varchar2(50) not null,
order_amount number(20),
order_date date not null,

constraint fk_cus_id foreign key(customer_id)
references Member(customer_id)
);


create table detail_order(
order_num varchar2(50) not null,
product_num number(20) not null,
product_name varchar2(20) not null,
order_qntty number(20) not null,
supplier_name varchar2(50) not null,
receipt_date date,
forwarding_date date,
product_pic varchar2(100),

constraint fk_order_num foreign key(order_num)
references customer_order(order_num),
constraint fk_product_num foreign key(product_num, product_name)
references product(product_num, product_name)
);


create table order_suggest(
customer_id varchar2(30) not null,
product_num number(20) not null,
product_name varchar2(50) not null,
supplier_name varchar2(50) not null,
product_price number(20) not null,
suggest_qntty number(20) not null,
product_pic varchar2(100),

constraint fk_id_sug foreign key(customer_id)
references member(customer_id),

constraint fk_pro_sug foreign key(product_num, product_name)
references product(product_num, product_name)
);

create table makeordernum(
num number(20) primary key
);










