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

select * from PRODUCT;
delete from PRODUCT where PRODUCT_NUM = 125;

insert into product values(product_num.nextval, '���� 100����',   '�ϴϾ�������', 1000, 100000, '101.png');
insert into product values(product_num.nextval, '�� 100����',   '�ϴϾ�������', 10000, 100000,'102.png');
insert into product values(product_num.nextval, '�ŶѲ� 100����',   '�ϴϾ�������', 3000, 100000, '103.png');
insert into product values(product_num.nextval, '��Ȧ�� 100����',   '�ϴϾ�������', 2000, 100000, '104.png');
insert into product values(product_num.nextval, '���� 1kg',   '�ϴϾ�������', 10000, 100000, '105.png');
insert into product values(product_num.nextval, '���� 1L',   '�ϴϾ�������', 1500, 100000, '106.png');
insert into product values(product_num.nextval, 'ź��� 20����',   '�ϴϾ�������', 6000, 100000, '107.png');
insert into product values(product_num.nextval, '���޴� �����ֽ� 20����',   '�ϴϾ�������', 25000, 100000, '108.png');
insert into product values(product_num.nextval, '�Ҵٿ��� ź��� 20����',   '�ϴϾ�������', 35000, 100000,'109.png');
insert into product values(product_num.nextval, '�ٴҶ�÷� 1L',   '������������', 6000, 100000, '100.png');
insert into product values(product_num.nextval, 'ī���÷� 1L',   '������������', 12000, 100000, '111.png');
insert into product values(product_num.nextval, '�����񷵽÷� 1L',   '������������', 12000, 100000, '112.png');
insert into product values(product_num.nextval, '�����÷� 1L',   '������������', 2000, 100000, '113.png');
insert into product values(product_num.nextval, '����÷� 1L ',   '������������', 12000, 100000, '114.png');
insert into product values(product_num.nextval, 'û�����÷� 1L ',   '������������', 10000, 100000, '115.png');
insert into product values(product_num.nextval, '�ڸ��÷� 1L ',   '������������', 10000, 100000, '116.png');
insert into product values(product_num.nextval, '���۹�ƮƼ 20����',   '������������', 4000, 100000, '117.png');
insert into product values(product_num.nextval, 'ĳ����Ƽ 20����',   '������������', 4000, 100000, '118.png');

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
