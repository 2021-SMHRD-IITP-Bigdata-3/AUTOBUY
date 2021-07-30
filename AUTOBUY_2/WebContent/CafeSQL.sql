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



��ó: https://photo199.tistory.com/253 [����ȣ������ ��α�]

-- �޴� ���̺� ���� ----------------------------------------------------
create sequence menu_num
increment by 1
start with 1;

create table menu(
menu_num number(20) primary key,
menu_name varchar2(40) not null,
price number(20) not null
);
-- �޴� ���̺� �� ����--
insert into menu values(menu_num.nextval, '�Ƹ޸�ī��',3000);
insert into menu values(menu_num.nextval, 'ī���',4000);
insert into menu values(menu_num.nextval, '�ٴҶ��',4500);
insert into menu values(menu_num.nextval, 'ī��Ḷ���߶�',5000);
insert into menu values(menu_num.nextval, '�����̵�',4500);
insert into menu values(menu_num.nextval, '���۹�ƮƼ',4500);

select * from menu;

--------------------------------------------------------------------

-- �Ǹŷ� ���̺� ���� ------------------------------------------------------

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

insert into sale values(1, '�Ƹ޸�ī��', 101, sysdate);

select * from sale where menu_num = 1
--------------------------------------------------------------------

-- ������ ���̺� ���� -----------------------------------------------------

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

'�Ƹ޸�ī��' 
insert into material values(1, 101, '���� 100����', 0.01);
insert into material values(1, 102, '�� 100����',  0.01);
insert into material values(1, 103, '�ŶѲ� 100����', 0.01);
insert into material values(1, 104, '��Ȧ�� 100����', 0.01);
insert into material values(1, 105, '���� 1kg', 0.02);

'ī���'
insert into material values(2, 101, '���� 100����', 0.01);
insert into material values(2, 102, '�� 100����', 0.01);
insert into material values(2, 103, '�ŶѲ� 100����', 0.01);
insert into material values(2, 104, '��Ȧ�� 100����', 0.01);
insert into material values(2, 105, '���� 1kg', 0.02);
insert into material values(2, 106, '���� 1L', 0.2);

'�ٴҶ��'
insert into material values(3, 101, '���� 100����', 0.01);
insert into material values(3, 102, '�� 100����',  0.01);
insert into material values(3, 103, '�ŶѲ� 100����', 0.01);
insert into material values(3, 104, '��Ȧ�� 100����', 0.01);
insert into material values(3, 105, '���� 1kg', 0.02);
insert into material values(3, 106, '���� 1L', 0.2);
insert into material values(3, 110, '�ٴҶ�÷� 1L', 0.02);

'ī��Ḷ���߶�'
insert into material values(4, 101, '���� 100����', 0.01);
insert into material values(4, 102, '�� 100����', 0.01);
insert into material values(4, 103, '�ŶѲ� 100����', 0.01);
insert into material values(4, 104, '��Ȧ�� 100����', 0.01);
insert into material values(4, 105, '���� 1kg', 0.02);
insert into material values(4, 106, '���� 1L', 0.2);
insert into material values(4, 111, 'ī���÷� 1L', 0.02);


'�����̵�'
insert into material values(5, 101, '���� 100����', 0.01);
insert into material values(5, 102, '�� 100����',  0.01);
insert into material values(5, 103, '�ŶѲ� 100����', 0.01);
insert into material values(5, 104, '��Ȧ�� 100����', 0.01);
insert into material values(5, 107, 'ź��� 20����', 0.5);
insert into material values(5, 114, '����÷� 1L ', 0.02);


'���۹�Ʈ Ƽ'

insert into material values(6, 101, '���� 100����', 0.01);
insert into material values(6, 102, '�� 100����', 0.01);
insert into material values(6, 103, '�ŶѲ� 100����', 0.01);
insert into material values(6, 104, '��Ȧ�� 100����', 0.01);
insert into material values(6, 117, '���۹�ƮƼ 20����', 0.5);

--------------------------------------------------------------------

-- ī�� ��ü ���--------------------------------------------------------

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

insert into stock values(101, '���� 100����', '��������', null, null, null);

update stock set stock_qntty = 100 where product_num=101
update stock set stock_qntty = 1 where product_num=101

update stock set stock_qntty=(stock_qntty-10) where product_num = 101;

update stock set stock_qntty=(stock_qntty-10) where customer_id = 'ym1828' and product_num = 102
--------------------------------------------------------------------

)