create table orders(
order_no int primary key not null comment "주문번호",
salesman_id int comment "판매자아이디",
order_date date not null comment  "주문일자"
)

create table categories(
menu_id int primary key not null comment "메뉴아이디",
menu_name char(10) not null comment "메뉴명",
kilocalories int not null comment "칼로리",
price int not null comment "가격"
)

create table location (
location_id int primary key not null,
address varchar(255) not null,
postal_code varchar(20),
city varchar(50)
)

create table menus(
menu_id int(11) primary key not null comment "메뉴아이디",
menu_name char(10) not null comment "메뉴명",
kilocalories int(11) not null comment "칼로리",
price int(11) not null comment "가격"
)

create table curriculum(
no int(11) primary key not null comment "과목번호",
name varchar(30) comment "과목명",
points int(11) comment "학점",
profid int(11) comment "교수번호"
)

create table emp(
emp_no int(11) primary key not null,
dept_no int(11),
emp_name varchar(10),
hdate date
)

create table cinema(
theater_no int(11) primary key not null comment "상영관번호",
location varchar(100) comment "위치",
tel varchar(50) comment "전화번호"
);

create table reservation(
theater_no int(11) not null,
movie_name varchar(20) not null,
user_name varchar(20),
seat_no int(11),
date date,
price int(11)
)

create table customer(
id int primary key,
name varchar(20) not null,
address varchar(100)
)

alter table customer add gender varchar(9);

alter table customer modify gender varchar(100);

alter table customer modify gender int not null;

alter table customer modify gender int not null comment "성별";

alter table customer change column Gender gen varchar(9);

alter table customer rename column gen to gender;

alter table customer drop column name;
alter table customer drop column address;
alter table customer drop column gender;

alter table customer add name varchar(20) not null;
alter table customer add address varchar(100);
alter table customer add gender varchar(9)

alter table orders rename column SALESMAN_ID to salesman_name;
alter table orders drop column order_date;

alter table location modify location_id int(11) not null comment "위치번호";
alter table location modify address varchar(255) not null comment "주소";
alter table location modify postal_code varchar(20) comment "우편번호";
alter table location modify city varchar(50) comment "도시명";

alter table curriculum rename column no to curricullum_no;
alter table curriculum rename column name to curricullum_name;
alter table curriculum rename column points to curriculum_points;
alter table curriculum rename column profid to curriculum_profid;

alter table curriculum modify curricullum_no int(11) not null comment "과목번호";
alter table curriculum modify curricullum_name varchar(30) not null comment "과목명";
alter table curriculum modify curriculum_points int(11) not null comment "학점";
alter table curriculum modify curriculum_points int(11) not null comment "교수번호";

