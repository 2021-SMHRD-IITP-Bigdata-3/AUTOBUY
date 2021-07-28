drop sequence menu_num;
drop table menu;
drop table sale;
drop table material;
drop table stock;

-- �޴� ���̺� ���� ----------------------------------------------------
create sequence menu_num
increment by 1
start with 1

create table menu(
menu_num number(20),
menu_name varchar2(40),
price number(20),
constraint menu_pk primary key(menu_num, menu_name)
)
-- �޴� ���̺� �� ����--
insert into menu values(menu_num.nextval, '�Ƹ޸�ī��',3000);
insert into menu values(menu_num.nextval, 'ī��ī���',4000);
insert into menu values(menu_num.nextval, '�ٴҶ��',4500);
insert into menu values(menu_num.nextval, 'ī��Ḷ���߶�',5000);
insert into menu values(menu_num.nextval, '�����̵�',4500);
insert into menu values(menu_num.nextval, '���۹�ƮƼ',4500);

select * from menu;

--------------------------------------------------------------------

-- �Ǹ� ���̺� ���� ------------------------------------------------------

create table sale(
menu_num number(20),
menu_name varchar2(20),
sold_qntty number(20),
sold_date date,

constraint menu_fk foreign key(menu_num, menu_name)
references menu(menu_num, menu_name)
on delete cascade
)

select * from sale

insert into sale values(1, '�Ƹ޸�ī��', 101, sysdate);
--------------------------------------------------------------------

-- ������ ���̺� ���� -----------------------------------------------------

create table material(
menu_num number(20) not null,
menu_name varchar2(50) not null,
product_num number(20) not null,
product_name varchar2(50) not null,
necessary_qntty number(20,3) not null,

constraint material_fk foreign key(menu_num, menu_name)
references menu(menu_num, menu_name)
on delete cascade
)

select * from material

'�Ƹ޸�ī��' 
insert into material values(1, '�Ƹ޸�ī��', 101, '���� 100����', 0.01);
insert into material values(1, '�Ƹ޸�ī��', 102, '�� 100����', 0.01);
insert into material values(1, '�Ƹ޸�ī��', 103, '�ŶѲ� 100����', 0.01);
insert into material values(1, '�Ƹ޸�ī��', 104, '��Ȧ�� 100����', 0.01);
insert into material values(1, '�Ƹ޸�ī��', 105, '���� 1kg', 0.02);

'ī���'
insert into material values(2, 'ī���', 101, '���� 100����', 0.01);
insert into material values(2, 'ī���', 102, '�� 100����', 0.01);
insert into material values(2, 'ī���', 103, '�ŶѲ� 100����', 0.01);
insert into material values(2, 'ī���', 104, '��Ȧ�� 100����', 0.01);
insert into material values(2, 'ī���', 105, '���� 1kg', 0.02);
insert into material values(2, 'ī���', 106, '���� 1L', 0.2);

'�ٴҶ��'
insert into material values(3, '�ٴҶ��', 101, '���� 100����', 0.01);
insert into material values(3, '�ٴҶ��', 102, '�� 100����', 0.01);
insert into material values(3, '�ٴҶ��', 103, '�ŶѲ� 100����', 0.01);
insert into material values(3, '�ٴҶ��', 104, '��Ȧ�� 100����', 0.01);
insert into material values(3, '�ٴҶ��', 105, '���� 1kg', 0.02);
insert into material values(3, '�ٴҶ��', 106, '���� 1L', 0.2);
insert into material values(3, '�ٴҶ��', 110, '�ٴҶ�÷� 1L', 0.02);

'ī��Ḷ���߶�'
insert into material values(4, 'ī��Ḷ���߶�', 101, '���� 100����', 0.01);
insert into material values(4, 'ī��Ḷ���߶�', 102, '�� 100����', 0.01);
insert into material values(4, 'ī��Ḷ���߶�', 103, '�ŶѲ� 100����', 0.01);
insert into material values(4, 'ī��Ḷ���߶�', 104, '��Ȧ�� 100����', 0.01);
insert into material values(4, 'ī��Ḷ���߶�', 105, '���� 1kg', 0.02);
insert into material values(4, 'ī��Ḷ���߶�', 106, '���� 1L', 0.2);
insert into material values(4, 'ī��Ḷ���߶�', 111, 'ī���÷� 1L', 0.02);


'�����̵�'
insert into material values(5, '�����̵�', 107, 'ź��� 20����', 0.5);
insert into material values(5, '�����̵�', 110, '����÷� 1L ', 0.02);
insert into material values(5, '�����̵�', 101, '���� 100����', 0.01);
insert into material values(5, '�����̵�', 102, '�� 100����', 0.01);
insert into material values(5, '�����̵�', 103, '�ŶѲ� 100����', 0.01);
insert into material values(5, '�����̵�', 104, '��Ȧ�� 100����', 0.01);


'���۹�Ʈ Ƽ'
insert into material values(6, '���۹�ƮƼ', 111, '���۹�ƮƼ 20����', 0.5);
insert into material values(6, '���۹�ƮƼ', 101, '���� 100����', 0.01);
insert into material values(6, '���۹�ƮƼ', 102, '�� 100����', 0.01);
insert into material values(6, '���۹�ƮƼ', 103, '�ŶѲ� 100����', 0.01);
insert into material values(6, '���۹�ƮƼ', 104, '��Ȧ�� 100����', 0.01);

--------------------------------------------------------------------

-- ī�� ��ü ���--------------------------------------------------------

create table stock(
product_num number(20) not null,
product_name varchar2(20) not null,
supplier_name varchar2(20) not null,
stock_qntty number(20),
minimum_qntty number(20),
standard_qntty number(20),

constraint stock_fk foreign key(product_num, product_name)
references product(product_num, product_name)
on delete cascade
)

select * from stock

insert into stock values(101, '���� 100����', '��������', null, null, null);


--------------------------------------------------------------------

)