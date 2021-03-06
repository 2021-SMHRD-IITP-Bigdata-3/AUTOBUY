drop table stock;
drop table sale;
drop table menu;
drop sequence menu_num;
drop table material;

delete from SALE;
delete from outgoing;

select * from menu;
select * from stock;
select * from material;
select * from sale;
select * from outgoing;

select menu_num, sold_qntty from sale where to_char(sold_date, 'yyyy-mm-dd')=to_char(sysdate, 'yyyy-mm-dd')
select menu_num, sold_qntty from sale where to_char(sold_date, 'yyyy-mm-dd')=to_char(sysdate, 'yyyy-mm-dd') and menu_num = 1


-- 메뉴 테이블 생성 ----------------------------------------------------
create sequence menu_num
increment by 1
start with 1;

create table menu(
menu_num number(20) primary key,
menu_name varchar2(40) not null,
price number(20) not null
);

-- 메뉴 테이블 값 삽입--
insert into menu values(menu_num.nextval, '아메리카노',3000);
insert into menu values(menu_num.nextval, '카페라떼',4000);
insert into menu values(menu_num.nextval, '바닐라라떼',4500);
insert into menu values(menu_num.nextval, '카라멜마끼야또',5000);
insert into menu values(menu_num.nextval, '레몬에이드',4500);
insert into menu values(menu_num.nextval, '페퍼민트티',4500);

select * from menu;

--------------------------------------------------------------------

-- 판매량 테이블 생성 ------------------------------------------------------

create table sale(
menu_num number(20) not null,
menu_name varchar2(50) not null,
sold_qntty number(20) not null,
sold_date date,

constraint menu_fk foreign key(menu_num)
references menu(menu_num)
on delete cascade
);

ALTER TABLE sale DROP PRIMARY KEY;



select * from sale order by sold_date, menu_num;

insert into sale values(1, '아메리카노', 101, sysdate);

select * from sale where menu_num = 1
--------------------------------------------------------------------

-- 원자재 테이블 생성 -----------------------------------------------------

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

select * from material order by menu_num, product_num

select * from material where menu_num = 5 order by product_num

select necessary_qntty from material

select menu_num, product_num, necessary_qntty 
from material 
where menu_num in (1,2) order by product_num;

'아메리카노' 
insert into material values(1, 101, '빨대 100개입', 0.01);
insert into material values(1, 102, '컵 100개입',  0.01);
insert into material values(1, 103, '컵뚜껑 100개입', 0.01);
insert into material values(1, 104, '컵홀더 100개입', 0.01);
insert into material values(1, 105, '원두 1kg', 0.02);

'카페라떼'
insert into material values(2, 101, '빨대 100개입', 0.01);
insert into material values(2, 102, '컵 100개입', 0.01);
insert into material values(2, 103, '컵뚜껑 100개입', 0.01);
insert into material values(2, 104, '컵홀더 100개입', 0.01);
insert into material values(2, 105, '원두 1kg', 0.02);
insert into material values(2, 106, '우유 1L', 0.2);

'바닐라라떼'
insert into material values(3, 101, '빨대 100개입', 0.01);
insert into material values(3, 102, '컵 100개입',  0.01);
insert into material values(3, 103, '컵뚜껑 100개입', 0.01);
insert into material values(3, 104, '컵홀더 100개입', 0.01);
insert into material values(3, 105, '원두 1kg', 0.02);
insert into material values(3, 106, '우유 1L', 0.2);
insert into material values(3, 110, '바닐라시럽 1L', 0.02);

'카라멜마끼야또'
insert into material values(4, 101, '빨대 100개입', 0.01);
insert into material values(4, 102, '컵 100개입', 0.01);
insert into material values(4, 103, '컵뚜껑 100개입', 0.01);
insert into material values(4, 104, '컵홀더 100개입', 0.01);
insert into material values(4, 105, '원두 1kg', 0.02);
insert into material values(4, 106, '우유 1L', 0.2);
insert into material values(4, 111, '카라멜시럽 1L', 0.02);


'레몬에이드'
insert into material values(5, 101, '빨대 100개입', 0.01);
insert into material values(5, 102, '컵 100개입',  0.01);
insert into material values(5, 103, '컵뚜껑 100개입', 0.01);
insert into material values(5, 104, '컵홀더 100개입', 0.01);
insert into material values(5, 107, '탄산수 20개입', 0.5);
insert into material values(5, 114, '레몬시럽 1L ', 0.02);


'페퍼민트 티'

insert into material values(6, 101, '빨대 100개입', 0.01);
insert into material values(6, 102, '컵 100개입', 0.01);
insert into material values(6, 103, '컵뚜껑 100개입', 0.01);
insert into material values(6, 104, '컵홀더 100개입', 0.01);
insert into material values(6, 117, '페퍼민트티 20개입', 0.5);

--------------------------------------------------------------------

-- 카페 전체 재고--------------------------------------------------------

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


delete from stock where product_num = 101 and customer_id = 'ym1828'
select * from stock where customer_id = 'ym1828' order by customer_id, product_num
select * from stock

select stock_qntty, minimum_qntty, standard_qntty from stock where customer_id = 'ym1828'

insert into stock values(101, '빨대 100개입', '언즈유통', null, null, null);

update stock set stock_qntty = 100 where product_num=101
update stock set stock_qntty = 1 where product_num=101

update stock set stock_qntty=(stock_qntty-10) where product_num = 101;

update stock set stock_qntty=(stock_qntty-10) where customer_id = 'ym1828' and product_num = 102
--------------------------------------------------------------------

create table outgoing(
customer_id varchar2(50),
product_num number(20),
product_name varchar2(50),
outgoing_qntty number(20),
outgoing_date date,

constraint outgoing_id_fk foreign key(customer_id)
references member(customer_id)
on delete cascade,

constraint outgoing_stock_fk foreign key(product_num, product_name)
references product(product_num, product_name)
on delete cascade
)

select * from outgoing

alter table outgoing modify(outgoing_qntty number(20,2))
insert into outgoing values('ym1828',101,'빨대 100개입',1,to_char(sysdate, 'yyyy-mm-dd'))
)