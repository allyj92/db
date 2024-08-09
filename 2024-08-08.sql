INSERT INTO bootex.RESERVATION(MOVIE_NAME,USER_NAME,SEAT_NO,`DATE`)
VALUES('아바타', '둘리', 'A1', '2024-04-20' ),
('아바타', '또치', 'A2', '2024-04-20' ),
('아바타', '도우너', 'B1', '2024-04-21' ),
('슬램덩크', '짱구', 'A2', '20240420' ),
('영웅', '고길동', 'B3', '20240421' );

select * from customer c ;
select * from book b ;

New! 단축키 … 첫 글자를 탐색할 수 있도록 Drive 단축키가 업데이트되었습니다.
/* 숫자함수 */
-- 반올림, 올림, 내림
SELECT ROUND(1.4), CEIL(1.4), FLOOR(1.4); -- 1, 2, 1

-- 목록 중에서 가장 큰 값, 가장 작은 값
SELECT GREATEST(1, 2, 3), LEAST(1, 2, 3);
 
-- 절대값 
SELECT ABS(1), ABS(-1); -- 1, 1

-- 소수점자리 선택
select TRUNCATE(1.2345, 2); -- 1.23


/* 논리 함수 */
-- 컬럼이 NULL이면 ''으로 치환
SELECT NAME, IFNULL(ADDRESS, '없음') FROM CUSTOMER;

  
/* 문자열함수 */
-- 대문자로 변환
SELECT UPPER('abc'); -- ABC

-- 소문자로 변환
SELECT LOWER('ABC'); -- abc

-- 문자열 연결하기
SELECT CONCAT('ab', 'cd', 'e'); -- abcde

-- 문자열 자르기 (3번째 위치부터 끝까지, 3번째 위치부터 2글자)
SELECT SUBSTR('ABCDEFG', 3), SUBSTR('ABCDEFG', 3, 2); -- CDEFG, CD 

-- 문자열 자르기 (왼쪽부터 3글자, 오른쪽부터 3글자)
SELECT LEFT('ABCDEFG', 3), RIGHT('ABCDEFG', 3); -- ABC, EFG

-- 문자열 길이 구하기 (바이트크기, 자리수)
SELECT LENGTH('ABCDE'), CHAR_LENGTH('ABCDE'); -- 5, 5

-- 문자열 길이 구하기 (바이트크기, 자리수)
SELECT LENGTH('안녕하세요'), CHAR_LENGTH('안녕하세요'); -- 15, 5

-- 공백 제거하기
SELECT TRIM(' HELLO '); -- HELLO

-- 특정 문자로 자리 채우기
SELECT LPAD('ABC', 5, '*'), RPAD('ABC', 5, '-'); -- **ABC, ABC--

-- 문자 교체하기
SELECT REPLACE('오늘은 월요일 입니다', '월요일 ', '수요일'); -- 오늘은 수요일입니다
 

/* 날짜함수 */
-- 현재날짜, 현재시간 출력하기
SELECT CURDATE(), CURTIME();

-- 현재날짜와 시간 출력하기
SELECT NOW(), SYSDATE();

-- 1월 1일 출력하기
SELECT DATE('2023-1-1'), DATE('2023-01-01');

-- 현재 날짜의 년도, 월, 일, 요일 출력하기
SELECT YEAR(NOW()), MONTH(NOW()), DAY(NOW()), DAYNAME(NOW());

-- 현재 시간의 시, 분, 초 출력하기
SELECT HOUR(NOW()), MINUTE(NOW()), SECOND(NOW());

    
/* 그룹함수 */
-- 최소값, 최대값, 행의 개수, 합계, 평균 
SELECT MIN(PRICE),MAX(PRICE), COUNT(*), SUM(PRICE), AVG(PRICE) 
FROM GIFT; -- 10000, 70000, 7, 280000, 40000

-- 선물테이블에서 품목을 그룹으로 묶기
SELECT TYPE FROM GIFT
GROUP BY TYPE; -- 가전제품, 생활용품, 식품

-- 품목별 선물의 개수와 가격 합계 구하기 (최저가, 최고가, 개수, 합계, 평균가)
select TYPE, MIN(PRICE), MAX(PRICE), COUNT(*), SUM(PRICE), AVG(PRICE)
FROM GIFT
GROUP BY TYPE;

-- 품목별로 선물목록 구하기
select TYPE, GROUP_CONCAT(NAME) 
FROM GIFT
GROUP BY TYPE;


-- Q1. 회원 테이블에서 같은 지역에 사는 회원의 수를 구하세요. 
select ADDRESS as '지역', COUNT(*) as '회원의 수'
FROM CUSTOMER
GROUP BY ADDRESS; -- COUNT함수에 *을 인자로 사용하면, NULL도 셈

select ADDRESS as '지역', COUNT(ADDRESS) as '회원의 수'
FROM CUSTOMER
GROUP BY ADDRESS; -- COUNT함수에 ADDRESS을 인자로 사용하면, NULL은 안셈

-- Q2. 회원테이블에서 지역별로 회원 목록 구하세요.
select IFNULL(ADDRESS,'--') AS 지역, GROUP_CONCAT(NAME) AS 회원목록
FROM CUSTOMER
GROUP BY ADDRESS;

-- Q3. 도서테이블에서 출판사를 기준으로 책의 개수와 가격의 합계를 구하세요
select IFNULL(PUBLISHER,'--') as '출판사', COUNT(*) as '개수', IFNULL(SUM(PRICE),0) as '합계'
FROM BOOK
GROUP BY PUBLISHER;

-- Q4. 도서테이블에서 월별로 출판된 책의 개수를 구하세요
-- 출판일에서 월만 구하기
SELECT MONTH(PUB_DATE) FROM BOOK;

SELECT CONCAT(MONTH(PUB_DATE),'월') AS '월', COUNT(*) AS '출판된 책의 개수' FROM BOOK
GROUP BY MONTH(PUB_DATE);

-- Q5. 연락처 테이블에서 성과 이름을 합쳐 풀 네임을 만드세요.
SELECT LAST_NAME, FIRST_NAME, CONCAT(LAST_NAME, FIRST_NAME) AS FULL_NAME 
FROM CONTACTS;

-- Q6. 연락처 테이블에서 같은 성을 가진 사람의 수를 구하세요.
select LAST_NAME as '성', COUNT(*) as '사람의 수'
FROM CONTACTS
GROUP BY LAST_NAME;

-- Q7. 영화예매 테이블에서 날짜별로 영화를 예매한 건수를 구하세요.
SELECT DATE AS 날짜, MOVIE_NAME AS 영화명, COUNT(*) AS 예매건수
FROM RESERVATION GROUP BY DATE, MOVIE_NAME;

select concat(left(SEAT_NO,1),"자리"), USER_NAME  from reservation r
group by left(seat_no,1)


-- Q8. 영화예매 테이블에서 A열에 앉은 사람과 B열에 앉은 사람을 구하세요.
SELECT CONCAT(LEFT(SEAT_NO,1),'열') AS 자리, GROUP_CONCAT(USER_NAME) AS 명단
FROM RESERVATION
GROUP BY LEFT(SEAT_NO,1);

-- Q9. 상품 테이블에서 카테고리별로 최고가를 구하고, 최고가 순으로 정렬하세요 
SELECT * FROM PRODUCT;

SELECT CATEGORY AS 카테고리, MAX(PRICE) AS 최고가 FROM PRODUCT
GROUP BY CATEGORY
ORDER BY MAX(PRICE) DESC;

-- Q10. 상품 테이블에서 카테고리별로 상품리스트와 합계를 구하세요
SELECT CATEGORY AS 카테고리, GROUP_CONCAT(PRODUCT_NAME) AS 제품리스트, SUM(PRICE) AS 합계
FROM PRODUCT
GROUP BY CATEGORY;

--  선물테이블에서 품목을 그룹으로 묶기
select TYPE form gift
group by type ; -- 가전제품, 생활용품, 식품


select 
	type,
	min(price),
	max(price),
	count(*),
	sum(price),
	avg(price)
from 
gift g
group by type; -- 품목별로 계산하기

-- 품목별로 선물목록 구하기
select type, group_concat(name)
from gift g 
group by type;

select address, count(ADDRESS) as "회원의 수" from customer c 
group by address

select address as "지역" ,group_concat( name) as "회원목록" from customer c 
group by address

select publisher as "출판사",count(PUBLISHER) as "개수",sum(price) as "합계" from book b
group by PUBLISHER 

select PUB_DATE as "월",count(PUB_DATE) as "출판된 책의 개수" from book
group by PUB_DATE 

select * from contacts;

INSERT INTO CONTACTS VALUES 
('이','서연','stone@naver.com','010-2341-0000'),
('이','시우','lavera@naver.com',NULL),
('김','지호','shyla@gmail.com','010-3171-4126'),
('김','윤서','jeni@gmail.com','010-8121-2341'),
('최','수아','fern@gmail.com', NULL);

select LAST_NAME as "성", COUNT(LAST_NAME) as "사람의 수" from contacts
group by LAST_NAME 

select SEAT_NO as "자리", group_concat(USER_NAME) as "명단" from reservation r 
group by SEAT_NO 

select CATEGORY as 카테고리, group_concat(PRODUCT_NAME) as 제품리스트, SUM(PRICE) as "합계" from PRODUCT
group by CATEGORY 





create table dept
(
	DEPT_NO INT(11) COMMENT "부서번호",
	DEPT_NAME VARCHAR(20) COMMENT "부서명",
	LOCATION VARCHAR(5) COMMENT "위치"
);

insert into dept (dept_no,dept_name,location)
values(1,"인사부","3층"),
(2,"홍보부","1층"),
(3,"개발부","2층"),
(null,"입사부서","2층");


create table emp
(
	EMP_NO INT(11) COMMENT "직원번호",
	EMP_NAME VARCHAR(20) COMMENT "직원명",
	EMP_RANK VARCHAR(10) COMMENT "직급",
	DEPT_NO INT(1) COMMENT "부서번호"
);

insert into emp (EMP_NO,EMP_NAME,EMP_RANK,DEPT_NO)
values(1001,"둘리","사원",1),
(1002,"또치","대리",2),
(1003,"도우너","대리",3),
(1004,"고길동","과장",4),
(1005,"마이콜","부장",NULL);

select * from EMP;
select * from DEPT;

select * 
from emp e 
JOIN DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO; 
-- 부서번호를 기준으로 두 테이블 연결

select * from EMP;



SELECT EMP.EMP_NO, EMP.EMP_NAME, EMP.DEPT_NO, DEPT.DEPT_NAME
FROM EMP 
JOIN DEPT
ON EMP.DEPT_NO = DEPT.DEPT_NO;

-- 테이블에 별칭 붙이기
select T1.EMP_NO,t2.DEPT_NO 
from EMP T1
join DEPT T2
on T1.DEPT_NO  = T2.DEPT_NO;

select *
from EMP, DEPT;
--   테이블 1의 row * 테이블2의 row만큼 가져온다
--  (4 * 5 = 20행)

select * from emp 
left join dept 
on EMP.DEPT_NO  = DEPT.DEPT_NO ;

select * from emp
left join dept
on emp.DEPT_NO  = dept.DEPT_NO; 

create table cinema(
	Theater_no int(11) comment "상영관번호",
	LOCATION VARCHAR(100) COMMENT "위치",
	TEL VARCHAR(50) COMMENT "전화번호"
);
-- 1번
insert into cinema (Theater_no,LOCATION,TEL)
values(1,"송도점","023-111-1111"),
(2,"구월점","032-222-2222")

-- 2번
create table MOVIE(
	THEATER_NO INT(11) COMMENT "상영관번호",
	MOVIE_NAME VARCHAR(20) comment "영화명"
)

insert into movie(THEATER_NO,MOVIE_NAME)
values(1,"슬램덩크"),
(1,"교섭"),
(2,"슬램덩크"),
(2,"아바타2"),
(2,"영웅");



select * from reservation;
select * from movie;
select * from cinema c ;
-- 3번
select movie.THEATER_NO,C.LOCATION , movie.MOVIE_NAME from movie 
join reservation
on movie.movie_name = reservation.MOVIE_NAME 
join cinema c 
group by C.LOCATION;

-- 4번
select M.THEATER_NO,M.MOVIE_NAME,R.USER_NAME 
from movie m 
join reservation r 
on M.MOVIE_NAME  = R.MOVIE_NAME
limit 3;




-- 5번
create table purchase(
	purchase_date date not null comment "구매일자",
	product_no int(11) not null comment "상품번호"
	
)

insert into purchase (purchase_date,product_no)
values(20240105,1),
(20240105,2),
(20240111,3),
(20240120,5),
(20240125,5),
(20240202,2),
(20240207,3),
(20240211,5),
(20240212,6)

select * from product;
select * from purchase;


select product.CATEGORY as "카테고리" , count(product.CATEGORY) as "판매건수" from product
join purchase
on product.PRODUCT_NO = purchase.product_no
group by product.CATEGORY 
; 
--  6번 //////
select * from product p ;
select * from purchase p ;

select P.CATEGORY as "카테고리", COUNT(*) as "판매건수" from product p 
join purchase p2 
on P.PRODUCT_NO = P2.product_no 
group by P.CATEGORY ;

select CONCAT("주류"," : ",COUNT(*)) from product p 
join purchase p2 
on P.PRODUCT_NO = P2.product_no 
group by P.CATEGORY 
order by COUNT(*) desc
limit 1
;


-- 7번
select p.PRODUCT_NO,p.PRODUCT_NAME,group_concat(c.purchase_date) from product p
join purchase c
on p.PRODUCT_NO = c.product_no 
group by PRODUCT_NAME 
order by PRODUCT_NO;

--  8번
create table ATTENDANCE(
EMP_NO INT(11) not null COMMENT "사원번호",
ATT_DATE date not null COMMENT "출석 체크한 날",
ATT_TIME time not null COMMENT "출석 체크한 시간"
);

insert into attendance (EMP_NO,ATT_DATE,ATT_TIME)
VALUES (1001, '2024-04-25', '08:50'),
(1002, '2024-04-25', '08:55'),
(1003, '2024-04-25', '09:01'),
(1004, '2024-04-25', '09:05'),
(1005, '2024-04-25', '11:20'),
(1001, '2024-04-26', '08:58'),
(1002, '2024-04-26', '08:59'),
(1003, '2024-04-26', '09:30'),
(1004, '2024-04-26', '09:03'),
(1005, '2024-04-26', '10:50');

-- 9번
select * from attendance a ;

select a.ATT_DATE as "날짜",group_concat( e.EMP_NAME) as "지각자명단" 
from attendance a 
join emp e
on a.emp_no = e.emp_no
where a.ATT_TIME > "09:10"
group by a.att_date
order by group_concat( e.EMP_NAME) desc;
-- SELECT > JOIN + ON > WHERE > GROUP BY 순서 중요!

)

-- 10번 

-- 부서번호e emp
select * from emp;

-- 개발부 dept
select * from dept;

-- emp
select * from attendance a ;

select d.DEPT_NO as "부서번호", d.DEPT_NAME as "부서명", count(*) as "지각건수" 
from emp e
join attendance a
on e.EMP_NO = a.EMP_NO 
join dept d
on d.DEPT_NO = e.DEPT_NO
where a.att_time > "09:10" and D.DEPT_NO =3;


-- 테이블 정규화
-- 특정 데이터만 보관하도록 테이블을 쪼개는 것
-- 장점: 중복된 데이터는 허용하지 않음으로써, DB의 용량을 줄일 수 있다
-- 단점: 데이터를 한번에 조회할 때, JOIN이 필요함

-- 테이블 반정규화
-- 내용이 중복되더라도 테이블을 하나로 만드는 것
-- 장점 : 조회가 편함
-- 단점 : DB의 용량이 늘어남

create table TEMP(
THEATER_NO INT  COMMENT '상영관번호',
    LOCATION VARCHAR(100)  COMMENT '위치',
    TEL VARCHAR(50)  COMMENT '전화번호',
	MOVIE_NAME VARCHAR(20)  COMMENT '영화명'
)

insert into temp 
values
(1,'송도점','032-111-1111','슬램덩크'), -- 상영관의 정보가 중복됨
(1,'송도점','032-111-1111','교섭'),
(2,'구월점','032-222-2222','슬램덩크'),
(2,'구월점','032-222-2222','아바타2'),
(2,'구월점','032-222-2222','영웅');


create table store1(
product varchar(20),
price int(11)
)

insert into store1(product,price)
values("소주",4000),
("맥주",5000),
("와인",20000);

create table store2(
product varchar(20),
price int(11)
)

insert into store2(product,price)
values("소주",4000),
("맥주",5000),
("위스키",50000)

-- 두 슈퍼의 제품을 모두 가져오기
select *
from store1 s union all
select *
from store2;

-- 중복을 제거하고 두 슈퍼의 제품을 모두 가져오기
select * 
from store1; 
-- union
select *
from store2;


select 'A', 123
union
select 'B', 456;

select 123,123
union
select 'b','b',456;

desc PRODUCT;
desc book;

select * from product p ;
select * from book;

select BOOK_NO as "제품번호",concat("(책)",TITLE) as 제품명,IFNULL(PRICE,0) as "가격" from book
union ALL
select PRODUCT_NO,concat("(과자)",product_name)PRODUCT_NAME,price from product
where category ="과자";



create table perseon(
last_name varchar(5) primary key,
firt_name varchar(5),
nickname varchar(10)
);


create table perseon(
last_name varchar(5),
firt_name varchar(5),
nickname varchar(10),
primary key(last_name)
);






