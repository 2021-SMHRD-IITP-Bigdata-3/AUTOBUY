drop table product;
drop sequence product_num;
delete from PRODUCT;


select * from product; 

--거래처 전체 재고 테이블 생성--------------------------------------

create sequence product_num
start with 101
increment by 1;

create table product(
product_num  number(20),
product_name varchar2(50),
supplier_name varchar2(20) not null,
product_price number(20) not null,
product_qntty number(20) not null,
product_pic varchar2(100),

constraint pk_product primary key(product_num, product_name)
);

select * from PRODUCT;
delete from PRODUCT where PRODUCT_NUM = 125;

insert into product values(product_num.nextval, '빨대 100개입',   '니니언즈유통', 1000, 100000, '101.png');
insert into product values(product_num.nextval, '컵 100개입',   '니니언즈유통', 10000, 100000,'102.png');
insert into product values(product_num.nextval, '컵뚜껑 100개입',   '니니언즈유통', 3000, 100000, '103.png');
insert into product values(product_num.nextval, '컵홀더 100개입',   '니니언즈유통', 2000, 100000, '104.png');
insert into product values(product_num.nextval, '원두 1kg',   '니니언즈유통', 10000, 100000, '105.png');
insert into product values(product_num.nextval, '우유 1L',   '니니언즈유통', 1500, 100000, '106.png');
insert into product values(product_num.nextval, '탄산수 20개입',   '니니언즈유통', 6000, 100000, '107.png');
insert into product values(product_num.nextval, '골드메달 애플주스 20개입',   '니니언즈유통', 25000, 100000, '108.png');
insert into product values(product_num.nextval, '소다워터 탄산수 20개입',   '니니언즈유통', 35000, 100000,'109.png');
insert into product values(product_num.nextval, '바닐라시럽 1L',   '오도바이유통', 6000, 100000, '100.png');
insert into product values(product_num.nextval, '카라멜시럽 1L',   '오도바이유통', 12000, 100000, '111.png');
insert into product values(product_num.nextval, '헤이즐럿시럽 1L',   '오도바이유통', 12000, 100000, '112.png');
insert into product values(product_num.nextval, '슈가시럽 1L',   '오도바이유통', 2000, 100000, '113.png');
insert into product values(product_num.nextval, '레몬시럽 1L ',   '오도바이유통', 12000, 100000, '114.png');
insert into product values(product_num.nextval, '청포도시럽 1L ',   '오도바이유통', 10000, 100000, '115.png');
insert into product values(product_num.nextval, '자몽시럽 1L ',   '오도바이유통', 10000, 100000, '116.png');
insert into product values(product_num.nextval, '페퍼민트티 20개입',   '오도바이유통', 4000, 100000, '117.png');
insert into product values(product_num.nextval, '캐모마일티 20개입',   '오도바이유통', 4000, 100000, '118.png');

update product set product_pic = '101.png' where product_num = 101;
update product set product_pic = '102.png' where product_num = 102;
update product set product_pic = '103.png' where product_num = 103;
update product set product_pic = '104.png' where product_num = 104;
update product set product_pic = '105.png' where product_num = 105;
update product set product_pic = '106.png' where product_num = 106;
update product set product_pic = '107.png' where product_num = 107;
update product set product_pic = '108.png' where product_num = 108;
update product set product_pic = '109.png' where product_num = 109;
update product set product_pic = '110.png' where product_num = 110;
update product set product_pic = '111.png' where product_num = 111;
update product set product_pic = '112.png' where product_num = 112;
update product set product_pic = '113.png' where product_num = 113;
update product set product_pic = '114.png' where product_num = 114;
update product set product_pic = '115.png' where product_num = 115;
update product set product_pic = '116.png' where product_num = 116;
update product set product_pic = '117.png' where product_num = 117;
update product set product_pic = '118.png' where product_num = 118;


--------------------------------------------------------------------
