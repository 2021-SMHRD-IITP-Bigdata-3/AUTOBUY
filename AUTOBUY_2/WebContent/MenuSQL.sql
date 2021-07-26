drop sequence menu_num

create sequence menu_num
increment by 1
start with 1

create table menu(
menu_num number(20),
menu_name varchar2(20),
price number(20),
constraint menu_pk primary key(menu_num, menu_name)
)

insert into menu values(menu_num.nextval, 'americano',3000);
insert into menu values(menu_num.nextval, 'latte',4000);
insert into menu values(menu_num.nextval, 'vanila_latte',4500);

/