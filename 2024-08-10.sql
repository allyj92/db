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

alter table emp modify emp_no int(11) not null comment "직원번호";
alter table emp modify dept_no int(11) comment "부서번호";
alter table emp modify emp_name varchar(10) comment "직원이름";
alter table emp modify hdate date comment "입사일";
alter table emp add salary int(11) not null comment "월급";
drop table reservation;

create table customer(
	customer_no int(11) not null auto_increment primary key comment "회원번호",
	name varchar(20) not null comment "이름",
	address varchar(100) comment "주소"
);

insert into customer(name,address)
values("둘리","서울"),
("또치","인천")

insert into customer (name, address) 
values('도우너',null);

insert into customer(name,address)
values
('고길동', '부산'),
('마이콜',"부산");

create table book(
	book_no int(11) primary key not null AUTO_INCREMENT comment "도서번호",
	title varchar(30) not null comment "제목",
	publisher varchar(100) comment "출판사",
	pub_date date comment "출간일",
	price int(11) comment "가격"
);

insert into book(title,publisher,pub_date,price)
values("역사1","상상마당",20230101,10000),
("역사2","상상마당",20230102,20000),
("스프링웹프로젝트","한빛미디어",20230201,40000),
("자바프로그래밍",null,null,null);

create table contacts(
	last_name varchar(255) not null comment "성",
	first_name varchar(255) not null comment "이름",
	email varchar(255) not null comment "이메일",
	phone varchar(20) comment "연락처"
);

insert into contacts ()
values ("이","서연","stone@naver.com","010-2341-0000"),
("이","시우","lavera@naver.com",null),
("김","지호","shyla@gmail.com","010-3171-4126"),
("김","윤서","jeni@gmail.com","010-8121-2341"),
("최","수아","ferm@gmail.com",null)

create table gift(
name varchar(20) comment "상품명",
type varchar(20) comment "품목",
price int(11) comment "가격"
)

insert into gift()
values("참치세트","식품",10000),
("햄세트","식품",20000),
("샴푸세트","생활용품",30000),
("세차용품","생활용품",30000),
("주방용품","생활용품",50000),
("노트북","가전제품",60000),
("벽걸이TV","가전제품",70000);


create table class(
class_no int(11) not null auto_increment primary key comment "수업번호",
class_name varchar(30) comment "과목명",
class_time time comment "수업시간"
)

insert into class(class_name,class_time)
values("수학","09:00:00"),
("국어","10:00:00"),
("영어","11:00:00");

create table reservation(
	movie_name varchar(20) not null comment "영화명",
	user_name varchar(20) not null comment "예약자명",
	seat_NO VARCHAR(5) COMMENT "자리번호",
	DATE DATE COMMENT "예약일"
)

insert into reservation ()
values("아바타","둘리","A1",20240420),
("아바타","또치","A2",20240421),
("아바타","도우너","B1",20240421),
("슬램덩크","짱구","A2",20240420),
("영웅","고길동","B3",20240421)

-- 6번
create table product(
	product_no int(11) primary key not null comment "제품번호",
	product_name varchar(20) comment "제품명",
	price int(11) comment "가격",
	category varchar(10) comment "카테고리(과자,음료,주류)"
);

insert into product()
values(1,"허니버터칩",2300,"과자"),
(2,"새우깡",1100,"과자"),
(3,"코카콜라",1000,"과자"),
(4,"아침에주스",4900,"음료"),
(5,"처음처럼",3000,"주류"),
(6,"참이름",2500,"주류");


select customer_no, name from customer c ;

select * from customer;

select * from customer c where customer_no = 1;

select * from customer c where customer_no != 1;

select * from customer c where customer_no < 3;

select * from customer c where customer_no <= 3;

select * from customer where name = "둘리" and address = "서울";

select * 
from customer 
where address ="인천" or address = "서울";

select * from customer 
where not address = "서울";

select * from book
where price = 20000;

select * from book b
where price between 10000 and 30000;

select * from book b
where b.title="역사1" or b.title = "역사2";

select * from book b 
where b.pub_date < 20230130 and price = 10000;

select * from contacts c 
where c.last_name !="김";

select * from contacts c
where c.first_name ="윤서" or c.first_name ="수아";

select * from class c
where c.class_no =1;

select * from class c 
where c.class_time > "10:00";

select * from class c 
where c.class_time = "11:00" or c.class_time ="9:00";


select * from product p
where p.price < 2000;

select * from product p
where p.category ="과자" or p.category ="음료";

select product_no, product_name from product p
where p.price > 4000;

select * from book b
where price between 10000 and 30000;

select * from book b
where publisher in("상상마당","한빛미디어");

select * from gift g
where g.price between 30000 and 60000;

select * from gift g
where g.type in("식품","생활용품");

select * from gift g
where price in(10000,30000,40000); 

select date,movie_name,user_name from reservation r 
where movie_name in("슬램덩크","영웅");

select * 
from reservation r 
where r.date = "2024-04-20" and (r.seat_NO ="a1" or r.seat_NO ="b");

select * from product
where price between 2000 and 3000;

select * from product p 
where p.category in('음료','주류') and price < 3000;

select * from book b 
where b.title like '역사%' and pub_date = 20230101;

select * from book b
where  publisher is not null and price > 20000;

select * from contacts 
where email like '%naver%' and last_name ='이';

select * from contacts c 
where phone is null and email like "%naver%"

select * from gift
where type like '%용품';

select * from gift g 
where g.name like "%세트" and price <= 20000;

select * from customer c 

update customer 
set name = '도우너';

select * from customer c ;

update customer 
set name = "도우너", address = "서울";

select * from customer c ;

update customer 
set address = '제주도'
where customer_no = 1;

select * from customer c ;

update book
set publisher = "민음사"
where price between 10000 and 30000;

select * from book;

update book
set publisher = "없음" , price = 0
where publisher is null


select * from book;



select * from contacts c ;

update contacts c
set c.first_name = "지수"
where c.last_name  = "이" and c.phone like '%2341%'; 
select * from contacts c ;

select * from c

select * from class

update class c
set c.class_time = "12:30:00";

select * from class

update class c
set class_name = "문학"
where class_no =2;

select * from class;

update product p 
set p.price = 5000
where product_no in(1,3,5);

select * from product p ;

update product
set category = "기타"
where product_no between 2 and 4;

select * from product;

select * from customer;

delete from customer where address = "제주도";

select * from customer;

delete from customer;


select * from customer;

truncate customer;

insert into customer(name,address)
values("둘리","서울");

select * from customer;

select * from book;

delete from book 
where pub_date in (20230101,20230201); 


select * from book;

select * from contacts c 

delete from contacts 
where phone is null and email like "%naver%"; 

select * from contacts c 

update contacts 
set phone = "010-1234-5678"
where phone is null
;

select * from contacts c 

delete from gift
where name like "%세트" and price <= 20000;

select * from gift g ;

select * from class;

delete from class
where class_time > "10:00";

select * from class;

delete from reservation 
where seat_no like 'A%';

select * from reservation r ;

select * from PRODUCT

delete from product 
where PRODUCT_NO IN(2,4,6);

select * from product p ;

select 
type,MIN(PRICE),MAX(PRICE),COUNT(*),SUM(PRICE),AVG(PRICE)
from GIFT
group by type;



-- 테이블 재생성

-- customer 테이블
create table customer(
	customer_no int primary key AUTO_INCREMENT,
	name varchar(50),
	address varchar(50)
)

insert into customer (name,address)
values("둘리","서울"),
("또치","인천"),
("도우너",null),
("고길동","부산"),
("마이콜","부산");

select * from customer c 

-- book 테이블
create table book(
	book_no int primary key auto_increment,
	title varchar(100),
	publisher varchar(100),
	pub_date date,
	price int
)

insert into book(title,publisher, pub_date,price)
values("역사1","상상마당",20230101,10000),
("역사2","상상마당",20230102,20000),
("스프링웹프로젝트","한빛미디어",20230201,40000),
("자바프로그래밍",null,null,null);

select * from book b ;

create table contacts(
	first_name varchar(50),
	last_name varchar(60),
	email varchar(100),
	phone varchar(100)
)

insert into contacts ()
values("이","서연","stone@naver.com","010-2341-0000"),
("이","시우","lavera@naver.com",null),
("김","지호","shyla@naver.com","010-3171-4126"),
("김","윤서","jeni@gmail.com","010-8121-2341"),
("최","수아","ferm@gmail.com",null)

select * from contacts;

create table gift(
	name varchar(50),
	type varchar(50),
	price int
)

insert into gift ()
values("참치세트","식품",10000),
("햄세트","식품",20000),
("샴푸세트","생활용품",30000),
("세차용품","생활용품",40000),
("주방용품","생활용품",50000),
("노트북","가전제품",60000),
("벽걸이TV","가전제품",70000)


select * from GIFT;

create table RESERVATION(
MOVIE_NAME VARCHAR(50),
USER_NAME VARCHAR(50),
SEAT_NO VARCHAR(50),
DATE VARCHAR(100)
)

insert into reservation()
VALUES("아바타","둘리","A1","20240420"),
("아바타","또치","A2","20240420"),
("아바타","도우너","B1","20240420"),
("슬램덩크","짱구","A2","20240421"),
("영웅","고길동","B3","20240421")

select * from reservation r ;

create table product(
	product_no int primary key auto_increment,
	product_name varchar(50),
	price int,
	category varchar(50)
)

insert into product(product_name,price,category)
values("허니버터칩" , 2300, "과자"),
("새우깡",1100,"과자"),
("코카콜라",1000,"음료"),
("아침에주스",4900,"음료"),
("처음처럼",3000, "주류"),
("참이슬",2500,"주류")

select * from product p ;

select type from gift
group by type;

select address, count(*) 
from customer
group by address;

select address,group_concat(name) from customer c
group by address;

select publisher as "출판사" ,count(title) as "개수",sum(price) as "합계" from book
group by publisher;

select concat(month(pub_date),'월') as "월", count(*) as "출판된 책의 개수"
from book
group by month(pub_date) ;

select * from contacts c ;

select first_name, last_name ,concat(first_name,last_name) from contacts c ;

select first_name,count(*) from contacts c 
group by first_name ;

select date,MOVIE_NAME,count(*) 
from reservation 
group by date,MOVIE_NAME ;

select * from reservation r ;

select CONCAT(left(SEAT_NO,1),"열") as "자리", group_concat(USER_NAME) as "명단" from reservation r
group by left(SEAT_NO,1) 
;

select category as "카테고리",group_concat(product_name) as "제품리스트",sum(price) as "합계" from product p
group by category ;

create table dept_no (
dept_no int(11) comment "부서번호",
dept_name varchar(20) comment "직원명",
location varchar(5) comment "위치"
)

insert into dept_no ()
values(1, "인사부", "3층"),
(2, "홍보부", "1층"),
(3, "개발부", "2층"),
(null,"임시부서","2층");

select * from dept_no dn ;

create table emp(
emp_no int(11) comment "직원번호",
emp_name varchar(20) comment "직원명",
emp_rank varchar(10) comment "직급",
dept_no int(11) comment "부서번호"
)

insert into emp()
values(1001,"둘리","사원",1),
(1002,"또치","대리",2),
(1003,"도우너","대리",3),
(1004,"고길동","과장",3),
(1005,"마이콜","부장",null)

alter table dept_no rename to dept;


select * from dept;
select * from emp;

create table cinema(
theater_no int(11) comment "상영관번호",
location varchar(100) comment "위치",
tel varchar(50) comment "전화번호"
);

insert into cinema ()
values(1,"구월점","032-111-1111"),
(2,"구월점","032-222-2222");

update cinema
set location = "송도점"
where cinema.theater_no =2;

select * from cinema c ;

create table movie(
	theater_no int(11) comment "상영관번호",
	movie_name varchar(20) comment "영화명"
)

insert into movie()
values(1,"슬램덩크"),
(1,"교섭"),
(2,"슬램덩크"),
(2,"아바타2"),
(2,"영웅")

select * from cinema c ;
select * from movie m ;

select c.theater_no,c.location,m.movie_name from cinema c 
join movie m
on c.theater_no = m.theater_no 

select * from reservation r ;

select m.theater_no,m.movie_name,r.USER_NAME from movie m 
join reservation r 
on m.movie_name = r.MOVIE_NAME;


create table purchase(
purchase_date date not null comment "구매일자",
product_no int(11) not null comment "상품번호"
)

insert into purchase()
values("2024-01-05",1),
("2024-01-05",2),
("2024-01-11",3),
("2024-01-20",5),
("2024-01-25",5),
("2024-02-02",2),
("2024-02-07",3),
("2024-02-11",5),
("2024-02-12",6)


select * from product;
select * from purchase p ;

select category,count(*) from product p 
join purchase p2 
on p.product_no =p2.product_no 
group by category ;

select concat("주류:",count(*)) as "제일많이 팔린 품목" from product p 
join purchase p2 
on p.product_no =p2.product_no 
group by category
order by count(*) desc
limit 1;


select p.product_no,p.product_name ,group_concat(p2.purchase_date) from product p 
join purchase p2 
on p.product_no =p2.product_no 
group by p.product_no ;

create table attendance(
emp_no int(11) not null comment "사원번호",
att_date date not null comment "출석 체크한 날",
att_time time not null comment "출석 체크한 시간"
)

insert into attendance ()
values(1001,"2024-04-25","08:50"),
(1002,"2024-04-25","08:55"),
(1003,"2024-04-25","09:11"),
(1004,"2024-04-25","09:05"),
(1005,"2024-04-25","11:20"),
(1001,"2024-04-26","08:58"),
(1002,"2024-04-26","08:59"),
(1003,"2024-04-26","09:30"),
(1004,"2024-04-26","09:03"),
(1005,"2024-04-26","10:50")


select * from emp; -- 부서 넘버
select * from dept; -- 부서명 , 부서 번호
select * from attendance a ; -- 시간

select a.att_date as "날짜",group_concat(e.emp_name) as "지각자 명단" 
from emp e 
join attendance a 
on e.emp_no = a.emp_no
where a.att_time > "09:10"
group by a.att_date ;

select d.dept_no,d.dept_name,count(*) from dept d 
join emp e 
on d.dept_no = e.dept_no 
join attendance a 
on e.emp_no = a.emp_no
where att_time > "9:10"

create table store1(
	product varchar(20),
	price int(11)
)

insert into store1 ()
values ("소주", 4000),
("맥주", 5000),
("와인",20000)


create table store2(
	product varchar(20),
	price int(11)
)

insert into store2()
values ("소주", 4000),
("맥주", 5000),
("위스키", 50000)

select *
from store1 s
union
select *
from store2 s2 ;

select book_no, from book ;
-- union
select book_no, concat("(책)",title), price from book-- book_no, title, price
union
select product_no, concat("(과자)",product_name), price from product 
where product.category ="과자"; -- product_no, product_name, price

create table person(
 last_name varchar(5) primary key,
 first_name varchar(5),
 nickname varchar(10)
);

create table person(
 	last_name varchar(5) primary key,
 	first_name varchar(5),
 	nickname varchar(10),
);

-- 자식컬럼
create table emp(
	emp_no int primary key comment "직원번호",
	emp_name varchar(20) comment "직원명",
	dept_no int comment "소속부서",
	foreign key (dept_no) references dept(deot_no)
);

create table users(
id varchar(20) not null primary key comment "아이디",
password varchar(200) comment "패스워드",
name varchar(20) comment "이름"
);

-- 부모 테이블 user 참조
insert into users()
values("USER1",1234,"둘리"),
("USER2",1234,"도우너")

-- 자식테이블
create table BOARD(
no int(11) not null primary key comment "글번호",
title varchar(50) comment "제목",
content varchar(255) comment "내용",
writer varchar(20) comment "작성자",
REG_DATE datetime comment "등록일",
UPDATE_DATE datetime comment "수정일",
foreign key (writer) references users(id)

)

alter table board modify no int(11) auto_increment comment "글번호";

insert into board(title,content,writer,REG_DATE,UPDATE_DATE)
values
('안녕하세요~', '안녕하세요~', 'USER1', SYSDATE(), SYSDATE()),
('안녕하세요~', '안녕하세요~', 'USER2', SYSDATE(), SYSDATE()),
('출석체크합니다~', '출석체크합니다~', 'USER1', SYSDATE(), SYSDATE()),
('출석체크합니다~', '출석체크합니다~', 'USER2', SYSDATE(), SYSDATE()),
('등업해주세요~', '등업해주세요~', 'USER2', SYSDATE(), SYSDATE())


select u.id,u.name,b.content from users u
join board b
on u.id  = b.writer
order by id;

select u.id,u.name,count(*) from users u
join board b
on u.id  = b.writer
group by u.id
order by id;

create table class(
class_no int(11) not null primary key comment "수업번호",
class_name varchar(20) comment "수업명"
)

insert into class()
values
(1,"수학"),
(2,"국어"),
(3,"영어")

create table student(
student_no int(11) not null primary key comment "학생번호",
student_name varchar(20) comment "학생명"
)

insert into student()
values
(1001,"둘리"),
(1002,"또치"),
(1003,"도우너");

select * from student;

create table sudent_class(
st_no int(11) comment "학생번호",
cl_no int(11) comment "수강하는 수업의 번호"
)

insert into sudent_class ()
values
(1001,1),
(1001,2),
(1002,2),
(1002,3),
(1003,1),
(1003,2),
(1003,3)

alter table student_class
add constraint
foreign key (st_no) references class(class_no),
foreign key (cl_no) references studnet(student_no);

alter table sudent_class rename to student_class;

alter table student_class
add constraint fk_st_no
foreign key (st_no) references student(student_no),
add constraint fk_cl_no
foreign key (cl_no) references class(class_no);


select * from student s ; -- 수강생 목록 , student_no
select * from student_class; -- st_no , cl_no
select * from class; -- class_no

select class_no,class_name,group_concat(student_name) from student s 
join student_class sc 
on s.student_no = sc.st_no
join class c 
on sc.cl_no =c. class_no
group by c.class_name
order by class_no;

select class_no as "과목번호",class_name as "과목명",count(*) as "수강생수" from student s 
join student_class sc 
on s.student_no = sc.st_no
join class c 
on sc.cl_no =c. class_no
group by c.class_name
order by count(*) desc
limit 1;




