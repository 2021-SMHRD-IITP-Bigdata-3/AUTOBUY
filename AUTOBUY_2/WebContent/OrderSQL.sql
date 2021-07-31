drop sequence order_num;
drop table detail_order;
drop table customer_order;
drop table order_suggest;

create sequence order_num
start with 1
increment by 1;

create table customer_order(
order_num number(20) primary key,
customer_id varchar2(20) not null,
order_date date not null,
customer_tel varchar2(20) not null,
customer_add varchar2(20) not null,
order_amount number(20) not null,

constraint fk_cus_id foreign key(customer_id)
references Member(customer_id)
);

create table detail_order(
order_num number(20) not null,
product_num number(20) not null,
product_name varchar2(20) not null,
order_qntty number(20) not null,

constraint fk_order_num foreign key(order_num)
references customer_order(order_num),
constraint fk_product_num foreign key(product_num, product_name)
references product(product_num, product_name)
);

create table order_suggest(
customer_id varchar2(30) not null,
product_num number(20) not null,
product_name varchar2(50) not null,
suggest_qntty number(20) not null,

constraint fk_id_sug foreign key(customer_id)
references member(customer_id),

constraint fk_pro_sug foreign key(product_num, product_name)
references product(product_num, product_name)
);

select * from ORDER_SUGGEST;