drop table supplier;
drop table product;
drop sequence product_num;

--�ŷ�ó ���̺� ����---------------------------------------------
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

insert into supplier values('�ϴϾ�������', '1022-110', '�迵��','01012341234', 'y11@naver.com', '���� ������');
insert into supplier values('��������', '1022-110', '�迵��','01012341234', 'y11@naver.com', '���� ������');


----------------------------------------------------------

--�ŷ�ó ��ü ��� ���̺� ����--------------------------------------
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

insert into product values(product_num.nextval, '���� 100����',   '�ϴϾ�������', 1000, 100000);
insert into product values(product_num.nextval, '�� 100����',   '�ϴϾ�������', 10000, 100000);
insert into product values(product_num.nextval, '�ŶѲ� 100����',   '�ϴϾ�������', 3000, 100000);
insert into product values(product_num.nextval, '��Ȧ�� 100����',   '�ϴϾ�������', 2000, 100000);
insert into product values(product_num.nextval, '���� 1kg',   '�ϴϾ�������', 10000, 100000);
insert into product values(product_num.nextval, '���� 1L',   '�ϴϾ�������', 1500, 100000);
insert into product values(product_num.nextval, 'ź��� 20����',   '�ϴϾ�������', 6000, 100000);
insert into product values(product_num.nextval, '���޴� �����ֽ� 20����',   '�ϴϾ�������', 25000, 100000);
insert into product values(product_num.nextval, '�Ҵٿ��� ź��� 20����',   '�ϴϾ�������', 35000, 100000);
insert into product values(product_num.nextval, '�ٴҶ�÷� 1L',   '�ϴϾ�������', 6000, 100000);
insert into product values(product_num.nextval, 'ī���÷� 1L',   '�ϴϾ�������', 12000, 100000);
insert into product values(product_num.nextval, '�����񷵽÷� 1L',   '�ϴϾ�������', 12000, 100000);
insert into product values(product_num.nextval, '�����÷� 1L',   '�ϴϾ�������', 2000, 100000);
insert into product values(product_num.nextval, '����÷� 1L ',   '�ϴϾ�������', 12000, 100000);
insert into product values(product_num.nextval, 'û�����÷� 1L ',   '�ϴϾ�������', 10000, 100000);
insert into product values(product_num.nextval, '�ڸ��÷� 1L ',   '�ϴϾ�������', 10000, 100000);
insert into product values(product_num.nextval, '���۹�ƮƼ 20����',   '�ϴϾ�������', 4000, 100000);
insert into product values(product_num.nextval, 'ĳ����Ƽ 20����',   '�ϴϾ�������', 4000, 100000);

--------------------------------------------------------------------
