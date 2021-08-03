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



--------------------------------------------------------------------
