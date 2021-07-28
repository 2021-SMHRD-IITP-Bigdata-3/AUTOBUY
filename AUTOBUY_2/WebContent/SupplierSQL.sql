drop table supplier;
drop table product;
drop sequence product_num;

--거래처 테이블 생성---------------------------------------------
create table supplier(

supplier_id varchar2(20) primary key,
supplier_pw varchar2(20) not null,
supplier_name varchar2(20) not null,
supplier_regist  varchar2(20) not null,
supplier_mng varchar2(20) not null,
supplier_tel varchar2(20) not null,
supplier_email varchar2(20) not null,
supplier_address varchar2(20) not null
)

insert into supplier values('니니언즈유통', '1022-110', '김영민','01012341234', 'y11@naver.com', '광주 광역시');
insert into supplier values('언즈유통', '1022-110', '김영민','01012341234', 'y11@naver.com', '광주 광역시');


----------------------------------------------------------

--거래처 전체 재고 테이블 생성--------------------------------------
create sequence product_num
start with 101
increment by 1;

create table product(
product_num  number(20) not null,
product_name varchar2(50) not null,
supplier_name varchar2(20) not null,
product_price number(20) not null,
product_qntty number(20) not null,

constraint pk_product primary key(product_num, product_name)

)

select * from product

insert into product values(product_num.nextval, '빨대 100개입',   '니니언즈유통', 1000, 100000);
insert into product values(product_num.nextval, '컵 100개입',   '니니언즈유통', 10000, 100000);
insert into product values(product_num.nextval, '컵뚜껑 100개입',   '니니언즈유통', 3000, 100000);
insert into product values(product_num.nextval, '컵홀더 100개입',   '니니언즈유통', 2000, 100000);
insert into product values(product_num.nextval, '원두 1kg',   '니니언즈유통', 10000, 100000);
insert into product values(product_num.nextval, '우유 1L',   '니니언즈유통', 1500, 100000);
insert into product values(product_num.nextval, '탄산수 20개입',   '니니언즈유통', 6000, 100000);
insert into product values(product_num.nextval, '골드메달 애플주스 20개입',   '니니언즈유통', 25000, 100000);
insert into product values(product_num.nextval, '소다워터 탄산수 20개입',   '니니언즈유통', 35000, 100000);
insert into product values(product_num.nextval, '바닐라시럽 1L',   '니니언즈유통', 6000, 100000);
insert into product values(product_num.nextval, '카라멜시럽 1L',   '니니언즈유통', 12000, 100000);
insert into product values(product_num.nextval, '헤이즐럿시럽 1L',   '니니언즈유통', 12000, 100000);
insert into product values(product_num.nextval, '슈가시럽 1L',   '니니언즈유통', 2000, 100000);
insert into product values(product_num.nextval, '레몬시럽 1L ',   '니니언즈유통', 12000, 100000);
insert into product values(product_num.nextval, '청포도시럽 1L ',   '니니언즈유통', 10000, 100000);
insert into product values(product_num.nextval, '자몽시럽 1L ',   '니니언즈유통', 10000, 100000);
insert into product values(product_num.nextval, '페퍼민트티 20개입',   '니니언즈유통', 4000, 100000);
insert into product values(product_num.nextval, '캐모마일티 20개입',   '니니언즈유통', 4000, 100000);

--------------------------------------------------------------------
