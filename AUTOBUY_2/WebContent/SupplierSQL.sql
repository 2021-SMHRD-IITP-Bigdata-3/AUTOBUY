drop table product;
drop sequence product_num;
delete from PRODUCT;


select * from product; 

--�ŷ�ó ��ü ��� ���̺� ����--------------------------------------

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


insert into product values(product_num.nextval, '���� 100����',   '�ϴϾ�������', 1000, 100000, '101.jpg');
insert into product values(product_num.nextval, '�� 100����',   '�ϴϾ�������', 10000, 100000,'102.jpg');
insert into product values(product_num.nextval, '�ŶѲ� 100����',   '�ϴϾ�������', 3000, 100000, '103.jpg');
insert into product values(product_num.nextval, '��Ȧ�� 100����',   '�ϴϾ�������', 2000, 100000, '104.jpg');
insert into product values(product_num.nextval, '���� 1kg',   '�ϴϾ�������', 10000, 100000, '105.jpg');
insert into product values(product_num.nextval, '���� 1L',   '�ϴϾ�������', 1500, 100000, '106.jpg');
insert into product values(product_num.nextval, 'ź��� 20����',   '�ϴϾ�������', 6000, 100000, '107.jpg');
insert into product values(product_num.nextval, '���޴� �����ֽ� 20����',   '�ϴϾ�������', 25000, 100000, '108.jpg');
insert into product values(product_num.nextval, '�Ҵٿ��� ź��� 20����',   '�ϴϾ�������', 35000, 100000,'109.jpg');
insert into product values(product_num.nextval, '�ٴҶ�÷� 1L',   '������������', 6000, 100000, '100.jpg');
insert into product values(product_num.nextval, 'ī���÷� 1L',   '������������', 12000, 100000, '111.jpg');
insert into product values(product_num.nextval, '�����񷵽÷� 1L',   '������������', 12000, 100000, '112.jpg');
insert into product values(product_num.nextval, '�����÷� 1L',   '������������', 2000, 100000, '113.jpg');
insert into product values(product_num.nextval, '����÷� 1L ',   '������������', 12000, 100000, '114.jpg');
insert into product values(product_num.nextval, 'û�����÷� 1L ',   '������������', 10000, 100000, '115.jpg');
insert into product values(product_num.nextval, '�ڸ��÷� 1L ',   '������������', 10000, 100000, '116.jpg');
insert into product values(product_num.nextval, '���۹�ƮƼ 20����',   '������������', 4000, 100000, '117.jpg');
insert into product values(product_num.nextval, 'ĳ����Ƽ 20����',   '������������', 4000, 100000, '118.jpg');



--------------------------------------------------------------------
