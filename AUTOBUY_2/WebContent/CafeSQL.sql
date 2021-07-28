drop sequence menu_num;
drop table menu;
drop table sale;
drop table material;
drop table stock;

-- 메뉴 테이블 생성 ----------------------------------------------------
create sequence menu_num
increment by 1
start with 1

create table menu(
menu_num number(20),
menu_name varchar2(40),
price number(20),
constraint menu_pk primary key(menu_num, menu_name)
)
-- 메뉴 테이블 값 삽입--
insert into menu values(menu_num.nextval, '아메리카노',3000);
insert into menu values(menu_num.nextval, '카페카페라떼',4000);
insert into menu values(menu_num.nextval, '바닐라라떼',4500);
insert into menu values(menu_num.nextval, '카라멜마끼야또',5000);
insert into menu values(menu_num.nextval, '레몬에이드',4500);
insert into menu values(menu_num.nextval, '페퍼민트티',4500);

select * from menu;

--------------------------------------------------------------------

-- 판매 테이블 생성 ------------------------------------------------------

create table sale(
menu_num number(20),
menu_name varchar2(20),
sold_qntty number(20),
sold_date date,

constraint menu_fk foreign key(menu_num, menu_name)
references menu(menu_num, menu_name)
on delete cascade
)

select * from sale

insert into sale values(1, '아메리카노', 101, sysdate);
--------------------------------------------------------------------

-- 원자재 테이블 생성 -----------------------------------------------------

create table material(
menu_num number(20) not null,
menu_name varchar2(50) not null,
product_num number(20) not null,
product_name varchar2(50) not null,
necessary_qntty number(20,3) not null,

constraint material_fk foreign key(menu_num, menu_name)
references menu(menu_num, menu_name)
on delete cascade
)

select * from material

'아메리카노' 
insert into material values(1, '아메리카노', 101, '빨대 100개입', 0.01);
insert into material values(1, '아메리카노', 102, '컵 100개입', 0.01);
insert into material values(1, '아메리카노', 103, '컵뚜껑 100개입', 0.01);
insert into material values(1, '아메리카노', 104, '컵홀더 100개입', 0.01);
insert into material values(1, '아메리카노', 105, '원두 1kg', 0.02);

'카페라떼'
insert into material values(2, '카페라떼', 101, '빨대 100개입', 0.01);
insert into material values(2, '카페라떼', 102, '컵 100개입', 0.01);
insert into material values(2, '카페라떼', 103, '컵뚜껑 100개입', 0.01);
insert into material values(2, '카페라떼', 104, '컵홀더 100개입', 0.01);
insert into material values(2, '카페라떼', 105, '원두 1kg', 0.02);
insert into material values(2, '카페라떼', 106, '우유 1L', 0.2);

'바닐라라떼'
insert into material values(3, '바닐라라떼', 101, '빨대 100개입', 0.01);
insert into material values(3, '바닐라라떼', 102, '컵 100개입', 0.01);
insert into material values(3, '바닐라라떼', 103, '컵뚜껑 100개입', 0.01);
insert into material values(3, '바닐라라떼', 104, '컵홀더 100개입', 0.01);
insert into material values(3, '바닐라라떼', 105, '원두 1kg', 0.02);
insert into material values(3, '바닐라라떼', 106, '우유 1L', 0.2);
insert into material values(3, '바닐라라떼', 110, '바닐라시럽 1L', 0.02);

'카라멜마끼야또'
insert into material values(4, '카라멜마끼야또', 101, '빨대 100개입', 0.01);
insert into material values(4, '카라멜마끼야또', 102, '컵 100개입', 0.01);
insert into material values(4, '카라멜마끼야또', 103, '컵뚜껑 100개입', 0.01);
insert into material values(4, '카라멜마끼야또', 104, '컵홀더 100개입', 0.01);
insert into material values(4, '카라멜마끼야또', 105, '원두 1kg', 0.02);
insert into material values(4, '카라멜마끼야또', 106, '우유 1L', 0.2);
insert into material values(4, '카라멜마끼야또', 111, '카라멜시럽 1L', 0.02);


'레몬에이드'
insert into material values(5, '레몬에이드', 107, '탄산수 20개입', 0.5);
insert into material values(5, '레몬에이드', 110, '레몬시럽 1L ', 0.02);
insert into material values(5, '레몬에이드', 101, '빨대 100개입', 0.01);
insert into material values(5, '레몬에이드', 102, '컵 100개입', 0.01);
insert into material values(5, '레몬에이드', 103, '컵뚜껑 100개입', 0.01);
insert into material values(5, '레몬에이드', 104, '컵홀더 100개입', 0.01);


'페퍼민트 티'
insert into material values(6, '페퍼민트티', 111, '페퍼민트티 20개입', 0.5);
insert into material values(6, '페퍼민트티', 101, '빨대 100개입', 0.01);
insert into material values(6, '페퍼민트티', 102, '컵 100개입', 0.01);
insert into material values(6, '페퍼민트티', 103, '컵뚜껑 100개입', 0.01);
insert into material values(6, '페퍼민트티', 104, '컵홀더 100개입', 0.01);

--------------------------------------------------------------------

-- 카페 전체 재고--------------------------------------------------------

create table stock(
product_num number(20) not null,
product_name varchar2(20) not null,
supplier_name varchar2(20) not null,
stock_qntty number(20),
minimum_qntty number(20),
standard_qntty number(20),

constraint stock_fk foreign key(product_num, product_name)
references product(product_num, product_name)
on delete cascade
)

select * from stock

insert into stock values(101, '빨대 100개입', '언즈유통', null, null, null);


--------------------------------------------------------------------

)