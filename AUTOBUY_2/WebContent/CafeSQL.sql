drop sequence menu_num;
drop table menu;
drop table sale;
drop table material;
drop table stock;
delete from SALE 

select * from menu;
select * from stock;
select * from material;
select * from sale;

select menu_num, sold_qntty from sale where to_char(sold_date, 'yyyy-mm-dd')=to_char(sysdate, 'yyyy-mm-dd')
select menu_num, sold_qntty from sale where to_char(sold_date, 'yyyy-mm-dd')=to_char(sysdate, 'yyyy-mm-dd') and menu_num = 1



ÃâÃ³: https://photo199.tistory.com/253 [¸¶µûÈ£½¦ÇÁÀÇ ºí·Î±×]

-- ¸Ş´º Å×ÀÌºí »ı¼º ----------------------------------------------------
create sequence menu_num
increment by 1
start with 1;

create table menu(
menu_num number(20) primary key,
menu_name varchar2(40) not null,
price number(20) not null
);
-- ¸Ş´º Å×ÀÌºí °ª »ğÀÔ--
insert into menu values(menu_num.nextval, '¾Æ¸Ş¸®Ä«³ë',3000);
insert into menu values(menu_num.nextval, 'Ä«Æä¶ó¶¼',4000);
insert into menu values(menu_num.nextval, '¹Ù´Ò¶ó¶ó¶¼',4500);
insert into menu values(menu_num.nextval, 'Ä«¶ó¸á¸¶³¢¾ß¶Ç',5000);
insert into menu values(menu_num.nextval, '·¹¸ó¿¡ÀÌµå',4500);
insert into menu values(menu_num.nextval, 'ÆäÆÛ¹ÎÆ®Æ¼',4500);

select * from menu;

--------------------------------------------------------------------

-- ÆÇ¸Å·® Å×ÀÌºí »ı¼º ------------------------------------------------------

create table sale(
menu_num number(20) not null,
menu_name varchar2(50) not null,
sold_qntty number(20) not null,
sold_date date,

constraint menu_fk foreign key(menu_num)
references menu(menu_num)
on delete cascade
)

ALTER TABLE sale DROP PRIMARY KEY;



select * from sale order by menu_num

insert into sale values(1, '¾Æ¸Ş¸®Ä«³ë', 101, sysdate);

select * from sale where menu_num = 1
--------------------------------------------------------------------

-- ¿øÀÚÀç Å×ÀÌºí »ı¼º -----------------------------------------------------

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
)

select * from material order by menu_num, product_num

select * from material where menu_num = 5 order by product_num

select necessary_qntty from material

select menu_num, product_num, necessary_qntty 
from material 
where menu_num in (1,2) order by product_num;

'¾Æ¸Ş¸®Ä«³ë' 
insert into material values(1, 101, '»¡´ë 100°³ÀÔ', 0.01);
insert into material values(1, 102, 'ÄÅ 100°³ÀÔ',  0.01);
insert into material values(1, 103, 'ÄÅ¶Ñ²± 100°³ÀÔ', 0.01);
insert into material values(1, 104, 'ÄÅÈ¦´õ 100°³ÀÔ', 0.01);
insert into material values(1, 105, '¿øµÎ 1kg', 0.02);

'Ä«Æä¶ó¶¼'
insert into material values(2, 101, '»¡´ë 100°³ÀÔ', 0.01);
insert into material values(2, 102, 'ÄÅ 100°³ÀÔ', 0.01);
insert into material values(2, 103, 'ÄÅ¶Ñ²± 100°³ÀÔ', 0.01);
insert into material values(2, 104, 'ÄÅÈ¦´õ 100°³ÀÔ', 0.01);
insert into material values(2, 105, '¿øµÎ 1kg', 0.02);
insert into material values(2, 106, '¿ìÀ¯ 1L', 0.2);

'¹Ù´Ò¶ó¶ó¶¼'
insert into material values(3, 101, '»¡´ë 100°³ÀÔ', 0.01);
insert into material values(3, 102, 'ÄÅ 100°³ÀÔ',  0.01);
insert into material values(3, 103, 'ÄÅ¶Ñ²± 100°³ÀÔ', 0.01);
insert into material values(3, 104, 'ÄÅÈ¦´õ 100°³ÀÔ', 0.01);
insert into material values(3, 105, '¿øµÎ 1kg', 0.02);
insert into material values(3, 106, '¿ìÀ¯ 1L', 0.2);
insert into material values(3, 110, '¹Ù´Ò¶ó½Ã·´ 1L', 0.02);

'Ä«¶ó¸á¸¶³¢¾ß¶Ç'
insert into material values(4, 101, '»¡´ë 100°³ÀÔ', 0.01);
insert into material values(4, 102, 'ÄÅ 100°³ÀÔ', 0.01);
insert into material values(4, 103, 'ÄÅ¶Ñ²± 100°³ÀÔ', 0.01);
insert into material values(4, 104, 'ÄÅÈ¦´õ 100°³ÀÔ', 0.01);
insert into material values(4, 105, '¿øµÎ 1kg', 0.02);
insert into material values(4, 106, '¿ìÀ¯ 1L', 0.2);
insert into material values(4, 111, 'Ä«¶ó¸á½Ã·´ 1L', 0.02);


'·¹¸ó¿¡ÀÌµå'
insert into material values(5, 101, '»¡´ë 100°³ÀÔ', 0.01);
insert into material values(5, 102, 'ÄÅ 100°³ÀÔ',  0.01);
insert into material values(5, 103, 'ÄÅ¶Ñ²± 100°³ÀÔ', 0.01);
insert into material values(5, 104, 'ÄÅÈ¦´õ 100°³ÀÔ', 0.01);
insert into material values(5, 107, 'Åº»ê¼ö 20°³ÀÔ', 0.5);
insert into material values(5, 114, '·¹¸ó½Ã·´ 1L ', 0.02);


'ÆäÆÛ¹ÎÆ® Æ¼'

insert into material values(6, 101, '»¡´ë 100°³ÀÔ', 0.01);
insert into material values(6, 102, 'ÄÅ 100°³ÀÔ', 0.01);
insert into material values(6, 103, 'ÄÅ¶Ñ²± 100°³ÀÔ', 0.01);
insert into material values(6, 104, 'ÄÅÈ¦´õ 100°³ÀÔ', 0.01);
insert into material values(6, 117, 'ÆäÆÛ¹ÎÆ®Æ¼ 20°³ÀÔ', 0.5);

--------------------------------------------------------------------

-- Ä«Æä ÀüÃ¼ Àç°í--------------------------------------------------------

create table stock(
customer_id varchar2(30) not null,
product_num number(20) not null,
product_name varchar2(50) not null,
supplier_name varchar2(50) not null,
stock_qntty number(20,3),
minimum_qntty number(20),
standard_qntty number(20),

constraint id_fk foreign key(customer_id)
references member(customer_id)
on delete cascade,

constraint stock_fk foreign key(product_num, product_name)
references product(product_num, product_name)
on delete cascade
)

delete from stock where product_num = 101 and customer_id = 'ym1828'
select * from stock where customer_id = 'ym1828' order by customer_id, product_num
select * from stock

insert into stock values(101, '»¡´ë 100°³ÀÔ', '¾ğÁîÀ¯Åë', null, null, null);

update stock set stock_qntty = 100 where product_num=101
update stock set stock_qntty = 1 where product_num=101

update stock set stock_qntty=(stock_qntty-10) where product_num = 101;

update stock set stock_qntty=(stock_qntty-10) where customer_id = 'ym1828' and product_num = 102
--------------------------------------------------------------------

)