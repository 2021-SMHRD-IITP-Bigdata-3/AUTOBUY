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
menu_name varchar2(20),
price number(20),
constraint menu_pk primary key(menu_num, menu_name)
)
-- �޴� ���̺� �� ����--
insert into menu values(menu_num.nextval, 'americano',3000);
insert into menu values(menu_num.nextval, 'latte',4000);
insert into menu values(menu_num.nextval, 'vanila_latte',4500);
insert into menu values(menu_num.nextval, 'caramel_macchiato',5000);
insert into menu values(menu_num.nextval, 'lemon_ade',4500);
insert into menu values(menu_num.nextval, 'peppermint_tea',4500);

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

--------------------------------------------------------------------

-- ������ ���̺� ���� -----------------------------------------------------

create table material(
menu_num number(20) not null,
menu_name varchar2(20) not null,
product_num number(20) not null,
product_name varchar2(20) not null,
necessary_qntty number(20,3) not null,

constraint material_fk foreign key(menu_num, menu_name)
references menu(menu_num, menu_name)
on delete cascade
)

select * from material

'�Ƹ޸�ī��' 
insert into material values(1, 'americano', 101, '���� 100����', 0.01);
insert into material values(1, 'americano', 102, '�� 100����', 0.01);
insert into material values(1, 'americano', 103, '�ŶѲ� 100����', 0.01);
insert into material values(1, 'americano', 104, '��Ȧ�� 100����', 0.01);
insert into material values(1, 'americano', 105, '���� 1kg', 0.02);

'��'
insert into material values(2, 'latte', 101, '���� 100����', 0.01);
insert into material values(2, 'latte', 102, '�� 100����', 0.01);
insert into material values(2, 'latte', 103, '�ŶѲ� 100����', 0.01);
insert into material values(2, 'latte', 104, '��Ȧ�� 100����', 0.01);
insert into material values(2, 'latte', 105, '���� 1kg', 0.02);
insert into material values(2, 'latte', 106, '���� 1L', 0.2);

'�ٴҶ��'
insert into material values(3, 'vanila_latte', 101, '���� 100����', 0.01);
insert into material values(3, 'vanila_latte', 102, '�� 100����', 0.01);
insert into material values(3, 'vanila_latte', 103, '�ŶѲ� 100����', 0.01);
insert into material values(3, 'vanila_latte', 104, '��Ȧ�� 100����', 0.01);
insert into material values(3, 'vanila_latte', 105, '���� 1kg', 0.02);
insert into material values(3, 'vanila_latte', 106, '���� 1L', 0.2);
insert into material values(3, 'vanila_latte', 110, '�ٴҶ�÷� 1L', 0.02);

'ī��Ḷ���߶�'
insert into material values(4, 'caramel_macchiato', 101, '���� 100����', 0.01);
insert into material values(4, 'caramel_macchiato', 102, '�� 100����', 0.01);
insert into material values(4, 'caramel_macchiato', 103, '�ŶѲ� 100����', 0.01);
insert into material values(4, 'caramel_macchiato', 104, '��Ȧ�� 100����', 0.01);
insert into material values(4, 'caramel_macchiato', 105, '���� 1kg', 0.02);
insert into material values(4, 'caramel_macchiato', 106, '���� 1L', 0.2);
insert into material values(4, 'caramel_macchiato', 111, 'ī���÷� 1L', 0.02);


'�����̵�'
insert into material values(5, 'lemon_ade', 107, 'ź��� 20����', 0.5);
insert into material values(5, 'lemon_ade', 110, '����÷� 1L ', 0.02);
insert into material values(5, 'lemon_ade', 101, '���� 100����', 0.01);
insert into material values(5, 'lemon_ade', 102, '�� 100����', 0.01);
insert into material values(5, 'lemon_ade', 103, '�ŶѲ� 100����', 0.01);
insert into material values(5, 'lemon_ade', 104, '��Ȧ�� 100����', 0.01);


'���۹�Ʈ Ƽ'
insert into material values(6, 'peppermint_tea', 111, '���۹�ƮƼ 20����', 0.5);
insert into material values(6, 'peppermint_tea', 101, '���� 100����', 0.01);
insert into material values(6, 'peppermint_tea', 102, '�� 100����', 0.01);
insert into material values(6, 'peppermint_tea', 103, '�ŶѲ� 100����', 0.01);
insert into material values(6, 'peppermint_tea', 104, '��Ȧ�� 100����', 0.01);

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