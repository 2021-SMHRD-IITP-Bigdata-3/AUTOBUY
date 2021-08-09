--------- ���� ---------

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



--------- ���� ---------

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

insert into product values(product_num.nextval, '���� 100����',   '�ϴϾ�������', 1000, 100000, '101.jpg');
insert into product values(product_num.nextval, '�� 100����',   '�ϴϾ�������', 10000, 100000,'102.jpg');
insert into product values(product_num.nextval, '�ŶѲ� 100����',   '�ϴϾ�������', 3000, 100000, '103.jpg');
insert into product values(product_num.nextval, '��Ȧ�� 100����',   '�ϴϾ�������', 2000, 100000, '104.jpg');
insert into product values(product_num.nextval, '���� 1kg',   '�ϴϾ�������', 10000, 100000, '105.jpg');
insert into product values(product_num.nextval, '���� 1L',   '�ϴϾ�������', 1500, 100000, '106.jpg');
insert into product values(product_num.nextval, 'ź��� 20����',   '�ϴϾ�������', 6000, 100000, '107.jpg');
insert into product values(product_num.nextval, '���޴� �����ֽ� 20����',   '�ϴϾ�������', 25000, 100000, '108.jpg');
insert into product values(product_num.nextval, '�Ҵٿ��� ź��� 20����',   '�ϴϾ�������', 35000, 100000,'109.jpg');
insert into product values(product_num.nextval, '�ٴҶ�÷� 1L',   '������������', 6000, 100000, '100.jpg');
insert into product values(product_num.nextval, 'ī���÷� 1L',   '������������', 12000, 100000, '111.jpg');
insert into product values(product_num.nextval, '�����񷵽÷� 1L',   '������������', 12000, 100000, '112.jpg');
insert into product values(product_num.nextval, '�����÷� 1L',   '������������', 2000, 100000, '113.jpg');
insert into product values(product_num.nextval, '����÷� 1L ',   '������������', 12000, 100000, '114.jpg');
insert into product values(product_num.nextval, 'û�����÷� 1L ',   '������������', 10000, 100000, '115.jpg');
insert into product values(product_num.nextval, '�ڸ��÷� 1L ',   '������������', 10000, 100000, '116.jpg');
insert into product values(product_num.nextval, '���۹�ƮƼ 20����',   '������������', 4000, 100000, '117.jpg');
insert into product values(product_num.nextval, 'ĳ����Ƽ 20����',   '������������', 4000, 100000, '118.jpg');


create sequence menu_num
increment by 1
start with 1;


create table menu(
menu_num number(20) primary key,
menu_name varchar2(40) not null,
price number(20) not null
);

insert into menu values(menu_num.nextval, '�Ƹ޸�ī��',3000);
insert into menu values(menu_num.nextval, 'ī���',4000);
insert into menu values(menu_num.nextval, '�ٴҶ��',4500);
insert into menu values(menu_num.nextval, 'ī��Ḷ���߶�',5000);
insert into menu values(menu_num.nextval, '�����̵�',4500);
insert into menu values(menu_num.nextval, '���۹�ƮƼ',4500);


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


insert into material values(1, 101, '���� 100����', 0.01);
insert into material values(1, 102, '�� 100����',  0.01);
insert into material values(1, 103, '�ŶѲ� 100����', 0.01);
insert into material values(1, 104, '��Ȧ�� 100����', 0.01);
insert into material values(1, 105, '���� 1kg', 0.02);

insert into material values(2, 101, '���� 100����', 0.01);
insert into material values(2, 102, '�� 100����', 0.01);
insert into material values(2, 103, '�ŶѲ� 100����', 0.01);
insert into material values(2, 104, '��Ȧ�� 100����', 0.01);
insert into material values(2, 105, '���� 1kg', 0.02);
insert into material values(2, 106, '���� 1L', 0.2);

insert into material values(3, 101, '���� 100����', 0.01);
insert into material values(3, 102, '�� 100����',  0.01);
insert into material values(3, 103, '�ŶѲ� 100����', 0.01);
insert into material values(3, 104, '��Ȧ�� 100����', 0.01);
insert into material values(3, 105, '���� 1kg', 0.02);
insert into material values(3, 106, '���� 1L', 0.2);
insert into material values(3, 110, '�ٴҶ�÷� 1L', 0.02);

insert into material values(4, 101, '���� 100����', 0.01);
insert into material values(4, 102, '�� 100����', 0.01);
insert into material values(4, 103, '�ŶѲ� 100����', 0.01);
insert into material values(4, 104, '��Ȧ�� 100����', 0.01);
insert into material values(4, 105, '���� 1kg', 0.02);
insert into material values(4, 106, '���� 1L', 0.2);
insert into material values(4, 111, 'ī���÷� 1L', 0.02);

insert into material values(5, 101, '���� 100����', 0.01);
insert into material values(5, 102, '�� 100����',  0.01);
insert into material values(5, 103, '�ŶѲ� 100����', 0.01);
insert into material values(5, 104, '��Ȧ�� 100����', 0.01);
insert into material values(5, 107, 'ź��� 20����', 0.5);
insert into material values(5, 114, '����÷� 1L ', 0.02);

insert into material values(6, 101, '���� 100����', 0.01);
insert into material values(6, 102, '�� 100����', 0.01);
insert into material values(6, 103, '�ŶѲ� 100����', 0.01);
insert into material values(6, 104, '��Ȧ�� 100����', 0.01);
insert into material values(6, 117, '���۹�ƮƼ 20����', 0.5);


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










