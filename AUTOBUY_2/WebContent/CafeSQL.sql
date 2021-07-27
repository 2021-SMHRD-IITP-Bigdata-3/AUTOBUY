drop sequence menu_num
drop table menu
drop table sale
drop table material
drop table stock

-- 메뉴 테이블 생성 ----------------------------------------------------
create sequence menu_num
increment by 1
start with 1

create table menu(
menu_num number(20),
menu_name varchar2(20),
price number(20),
constraint menu_pk primary key(menu_num, menu_name)
)
-- 메뉴 테이블 값 삽입--
insert into menu values(menu_num.nextval, 'americano',3000);
insert into menu values(menu_num.nextval, 'latte',4000);
insert into menu values(menu_num.nextval, 'vanila_latte',4500);
insert into menu values(menu_num.nextval, 'caramel_macchiato',5000);
insert into menu values(menu_num.nextval, 'lemon_ade',4500);
insert into menu values(menu_num.nextval, 'peppermint_tea',4500);

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

--------------------------------------------------------------------

-- 원자재 테이블 생성 -----------------------------------------------------

create table material(
menu_num number(20) not null,
menu_name varchar2(20) not null,
product_num number(20) not null,
product_name number(20) not null,
necessary_qntty number(20) not null,

constraint material_fk foreign key(menu_num, menu_name)
references menu(menu_num, menu_name)
on delete cascade
)

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
references product(product_num, product_name),

constraint stock_fk1 foreign key(supplier_name)
references supplier(supplier_name)
on delete cascade
)

insert into stock values(1, '빨대 100개입', '언즈유통', null, null, null);


--------------------------------------------------------------------

)