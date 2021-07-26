create sequence menu_num
increament 1
start with 1

create table menu(
menu_num number(20),
menu_name varchar2(20),
price number(20),

constraint menu_pk primary key(menu_seq, menu_name)
)

/