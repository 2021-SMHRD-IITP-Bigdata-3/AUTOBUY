drop sequence order_num;
drop table detail_order;
drop table customer_order;
drop table order_suggest;



---------- ÁÖ¹® Å×ÀÌºí ------------
create sequence order_num
start with 10001
increment by 1;


create table customer_order(
order_num number(20) primary key,
customer_id varchar2(20) not null,
supplier_id varchar2(20), 
customer_store_name varchar2(30) not null,
customer_tel varchar2(20) not null,
customer_add varchar2(50) not null,
order_amount number(20) not null,
order_date date not null,
receipt_date date,
forwarding_date date,

constraint fk_cus_id foreign key(customer_id)
references Member(customer_id),
constraint fk_sup_id foreign key(supplier_id)
references Member(customer_id)
);


select * from CUSTOMER_ORDER;
select * from customer_order order by order_date desc;

				ÁÖ¹®¹øÈ£, °í°´¾ÆÀÌµð, ÁÖ¹®ÀÏÀÚ, ¿¬¶ôÃ³, ÁÖ¼Ò, ÁÖ¹®±Ý¾×
insert into customer_order values(order_num.nextval, customer_id, order_date, customer_tel, customer_add, order_amount);

insert into customer_order values(order_num.nextval, 'b', 'a', '½º¸¶Æ®¹÷½º','010-0000-0000', '±¤ÁÖ±¤¿ª½Ã', 130000, '2021-07-30', null, null );
insert into customer_order values(order_num.nextval, 'd',  'a', '½ºÅ¸¹Ú½º', '010-1111-1111', '³ªÁÖÇõ½Åµµ½Ã', 260000,'2021-07-28',  null, null);
insert into customer_order values(order_num.nextval, '1',  'a', '¿£Á©¸®³Ê½º', '010-2222-2222', '¸ñÆ÷½Ã', 260000,'2021-07-31',  null, null);



---------- ÁÖ¹®»ó¼¼ Å×ÀÌºí ------------
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
=======
select * from DETAIL_ORDER order by order_num, PRODUCT_num;

								ÁÖ¹®¹øÈ£, Á¦Ç°¹øÈ£, Á¦Ç°¸í, ÁÖ¹®¼ö·®
insert into detail_order values(order_num.nextval, product_num, product_name, order_qntty);

insert into detail_order values(10001, 101, '»¡´ë 100°³ÀÔ', 5);  
insert into detail_order values(10001, 102, 'ÄÅ 100°³ÀÔ', 5);   
insert into detail_order values(10001, 103, 'ÄÅ¶Ñ²± 100°³ÀÔ', 5);  
insert into detail_order values(10001, 104, 'ÄÅÈ¦´õ 100°³ÀÔ', 5);  
insert into detail_order values(10001, 105, '¿øµÎ 1kg', 5);   


insert into detail_order values(10002, 101, '»¡´ë 100°³ÀÔ', 10);  
insert into detail_order values(10002, 102, 'ÄÅ 100°³ÀÔ', 10);   
insert into detail_order values(10002, 103, 'ÄÅ¶Ñ²± 100°³ÀÔ', 10);  
insert into detail_order values(10002, 104, 'ÄÅÈ¦´õ 100°³ÀÔ', 10);  
insert into detail_order values(10002, 105, '¿øµÎ 1kg', 10);  

insert into detail_order values(10003, 101, '»¡´ë 100°³ÀÔ', 10);  
insert into detail_order values(10003, 102, 'ÄÅ 100°³ÀÔ', 10);   
insert into detail_order values(10003, 103, 'ÄÅ¶Ñ²± 100°³ÀÔ', 10);  
insert into detail_order values(10003, 104, 'ÄÅÈ¦´õ 100°³ÀÔ', 10);  
insert into detail_order values(10003, 105, '¿øµÎ 1kg', 10);  
















>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/AUTOBUY.g