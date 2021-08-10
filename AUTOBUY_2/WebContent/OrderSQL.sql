drop sequence order_num;
drop table detail_order;
drop table customer_order;
drop table order_suggest;
<<<<<<< HEAD
drop table cart;
delete order_suggest
=======


delete order_suggest where customer_id='ym1828';
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/AUTOBUY.git
delete CUSTOMER_ORDER;
delete detail_order;
delete makeordernum;



---------- 주문 테이블 ------------
create sequence order_num
start with 10001
increment by 1;


create table customer_order(
order_num varchar2(50) primary key,
customer_id varchar2(20) not null, 
customer_store_name varchar2(50) not null,
customer_tel varchar2(20) not null,
customer_add varchar2(50) not null,
order_amount number(20),
order_date date not null,

constraint fk_cus_id foreign key(customer_id)
references Member(customer_id)
);

alter table customer_order modify(customer_store_name varchar2(60));

alter table customer_order modify(customer_store_name varchar2(50));
select * from CUSTOMER_ORDER;
select * from customer_order order by order_date desc;

				주문번호, 고객아이디, 주문일자, 연락처, 주소, 주문금액
insert into customer_order values(order_num.nextval, customer_id, order_date, customer_tel, customer_add, order_amount);

insert into customer_order values(order_num.nextval, 'b', 'a', '스마트벅스','010-0000-0000', '광주광역시', 130000, '2021-07-30', null, null );
insert into customer_order values(order_num.nextval, 'd',  'a', '스타박스', '010-1111-1111', '나주혁신도시', 260000,'2021-07-28',  null, null);
insert into customer_order values(order_num.nextval, '1',  'a', '엔젤리너스', '010-2222-2222', '목포시', 260000,'2021-07-31',  null, null);
insert into customer_order(order_num, customer_id, customer_store_name, customer_tel, customer_add, order_date) values(concat(to_char(sysdate, 'yyyymmdd'),10001),'ym1828','스벅','01077614401','빛가람동', sysdate);


---------- 주문상세 테이블 ------------
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

select * from DETAIL_ORDER;



-- 발주 제안 테이블---------------------------------
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

select * from ORDER_SUGGEST;

select * from DETAIL_ORDER order by order_num, PRODUCT_num;

								주문번호, 제품번호, 제품명, 주문수량
insert into detail_order values(order_num.nextval, product_num, product_name, order_qntty);

insert into detail_order values(10001, 101, '빨대 100개입', 5);  
insert into detail_order values(10001, 102, '컵 100개입', 5);   
insert into detail_order values(10001, 103, '컵뚜껑 100개입', 5);  
insert into detail_order values(10001, 104, '컵홀더 100개입', 5);  
insert into detail_order values(10001, 105, '원두 1kg', 5);   


insert into detail_order values(10002, 101, '빨대 100개입', 10);  
insert into detail_order values(10002, 102, '컵 100개입', 10);   
insert into detail_order values(10002, 103, '컵뚜껑 100개입', 10);  
insert into detail_order values(10002, 104, '컵홀더 100개입', 10);  
insert into detail_order values(10002, 105, '원두 1kg', 10);  

insert into detail_order values(10003, 101, '빨대 100개입', 10);  
insert into detail_order values(10003, 102, '컵 100개입', 10);   
insert into detail_order values(10003, 103, '컵뚜껑 100개입', 10);  
insert into detail_order values(10003, 104, '컵홀더 100개입', 10);  
insert into detail_order values(10003, 105, '원두 1kg', 10);  


-- 주문번호 만드는 테이블------------------------
create table makeordernum(
num number(20) primary key
);

select * from makeordernum;

--수동발주 장바구니 테이블------------------------

create table cart(
customer_id varchar2(40) not null,
product_num number(20) not null,
product_name varchar2(50) not null,
supplier_name varchar2(50) not null,
product_price number(20) not null,
product_pic varchar2(50)
)

select * from cart
drop table cart
select * from outgoing




