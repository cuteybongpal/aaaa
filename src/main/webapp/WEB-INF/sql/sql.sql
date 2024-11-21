--member table
--=>회원 아이디, 비번, 이름, 성별, 생년월일, 메일, 연락처, 주소, 가입일자
create table member(
    id varchar2(30) not null,
    password varchar2(30),
    name varchar2(30),
    gender varchar2(10),
    birth varchar2(30),
    mail varchar2(30),
    phone varchar2(30),
    address varchar2(100),
    regist_day varchar2(30),
    primary key (id)
);
select * from member;
drop table member;
commit;
--데이터 삽입
insert into member values('id명','1234','이름','남','2010-02-05','test@gmail.com','010-1234-5678','주소',sysdate);
--product table
create table product(
    p_productId varchar2(10) not null,
    p_pname varchar2(30),
    p_unitPrice number,
    p_description varchar2(100),
    p_category varchar2(20),
    p_condition varchar2(20),
    p_filename varchar2(100),
    p_quantity number,
    primary key (p_productId)
);
delete from product where p_productId = '7979';
desc product; --테이블 구조
drop table product; --테이블 삭제
select * from tab; --테이블 목록
select * from product;
select * from product where p_productId='7979';
commit;

insert into product values('P2234', '삼성Phone 8v', 500000,
'최신 신상폰으로 ai가 탑재된 폰입니다.','스마트폰','New',
'01_samsungPhone.png',10);
insert into product values('P2235', 'iphone 와치', 600000,
'폰의 기능을 가진 시계','스마트폰','Old',
'02_iphone.png',20);
insert into product values('P2239', 'AI로봇', 700000,
'최신 신상폰으로 ai가 탑재된 로봇입니다.','로봇','Old',
'03_ai로봇.jpg',30);
insert into product values('P2242', '데스크탑', 1300000,
'최신 게임 데스크탑','PC','Old',
'03_ai로봇.jpg',30);
commit;

   

create table member(
    id varchar2(30) primary key, --unique, not null 두가지 조건 모두 만족해야 함!!
    pw varchar2(30) not null,
    name varchar2(50),
    logtime date default sysdate
);
select * from member;
insert into member (id,pw,name,logtime) values ('kim','1234','김이름',sysdate);
insert into member values ('lee','1234','이이름',sysdate);
insert into member (id,pw,logtime) values ('jang','1234',sysdate);
insert into member (pw,logtime) values ('jang',sysdate);
--아이디를 이용해서 사용자의 비번과 이름 가져오기
select name, pw from member where id='lee';
--아이디가 일치하는 사람의 이름 수정하기
update member set name='수정이름' where id='lee';
delete from member where id='lee' and pw='1234';
select id, pw from member where id='kim';
commit;
---------------[join실습]-------------
-----------------[2.p59 join예제]--------------------
-- depart 테이블
CREATE TABLE depart (
  deptno number NOT NULL ,    -- 부서번호(학과번호)
  dname varchar2(25) NOT NULL , -- 부서명(학과명)
  loc varchar2(10) DEFAULT NULL -- 위치
);

drop table depart purge;

INSERT INTO depart (deptno, dname) VALUES (302, '전기공학과'); 
INSERT INTO depart VALUES (101, '컴퓨터공학과', '1호관'); 
INSERT INTO depart VALUES (102, '멀티미디어학과', '2호관');
INSERT INTO depart VALUES (201, '전자공학과', '3호관');
INSERT INTO depart VALUES (202, '기계공학과', '4호관');

select * from depart;

-- emp 테이블
CREATE TABLE emp (
  empno number NOT NULL,      -- 직원번호
  name varchar2(20) NOT NULL,   -- 이름
  position varchar2(10) NOT NULL,   -- 직급  
  tel varchar2(15) NOT NULL,    -- 전화번호
  deptno number NOT NULL,     -- 학과번호
  PRIMARY KEY (empno)) ;        -- unique(데이터 중복 금지), not null (insert시 반드시 데이터가 있어야함)

INSERT INTO emp VALUES (20101, '홍길동', '사원', '031)781-2158', 101); 
INSERT INTO emp VALUES (10102, '김철수', '과장', '032)261-8947', 101);
INSERT INTO emp VALUES (10103, '이영희', '대리', '02)824-9637', 102); 
INSERT INTO emp VALUES (10104, '고길동', '사원', '02)824-9637', 102); 
INSERT INTO emp VALUES (10105, '강호동', '사원', '02)824-9637', 102); 
INSERT INTO emp VALUES (10106, '아이유', '사원', '02)881-2158', 105);

select * from emp;

commit;

--1)inner join 
--방법1: 오라클 전용 구문
select empno, name, dname , emp.deptno 
from emp, depart 
where emp.deptno = depart.deptno;

--방법2:Ansi  표준
select empno, name, deptno, dname 
from emp
join depart using(deptno);

--2)outer join(left join)
--방법1: 오라클 전용 구문
select e.name, e.deptno, d.dname
from emp e, depart d
where e.deptno=d.deptno(+); --(+)가 없는 쪽이 join의 방향=>left join

--방법2:Ansi  표준
select name, deptno, dname
from emp
left join depart using(deptno);

--3)outer join(right join)
--방법1: 오라클 전용 구문
select e.name, d.deptno, d.dname
from emp e, depart d
where e.deptno(+)=d.deptno; --(+)가 없는 쪽이 join의 방향=>right join

--방법2:Ansi  표준
select name, deptno, dname
from emp
right join depart using(deptno);

--4)full join => Ansi표준만 있음
select name, deptno, dname
from emp
full join depart using(deptno);

select *
from emp
full join depart using(deptno);

commit;



---------------[selfEX문제]-------------
--1. department 테이블
CREATE TABLE department (
  deptno number NOT NULL ,		-- 부서번호(학과번호)
  dname varchar2(25) NOT NULL , -- 부서명(학과명)
  loc varchar2(10) DEFAULT NULL	-- 위치
);

INSERT INTO department VALUES (101, '컴퓨터공학과', '1호관'); 
INSERT INTO department VALUES (102, '멀티미디어학과', '2호관');
INSERT INTO department VALUES (201, '전자공학과', '3호관');
INSERT INTO department VALUES (202, '기계공학과', '4호관');

--2. professor 테이블
CREATE TABLE professor (
  profno number NOT NULL,		-- 교수번호
  name varchar2(20) NOT NULL,	-- 이름
  userid varchar2(10) NOT NULL,	-- 아이디
  position varchar2(20) NOT NULL,	-- 직급
  sal number NOT NULL,			-- 급여
  hiredate date NOT NULL,			-- 입사일
  comm number DEFAULT NULL,	-- 보직수당
  deptno number NOT NULL,		-- 부서번호(학과번호)
  PRIMARY KEY (profno));	

INSERT INTO professor VALUES 
(9901, '김도훈', 'capool', '교수', 500, 
To_Date( '2010.12.08 16:33', 'yyyy.mm.dd hh24:mi'), 20, 101); 
INSERT INTO professor VALUES
(9902, '이재우', 'sweat413', '조교수', 320, 
To_Date( '1995.04.12 00:00:00', 'yyyy.mm.dd hh24:mi:ss'), null, 201); 
INSERT INTO professor VALUES
(9903, '성연희', 'pascal', '조교수', 360, 
To_Date('1993.03.17', 'YYYY.MM.DD'), 15, 101); 
INSERT INTO professor VALUES
(9904, '염일웅', 'blue77', '전임강사', 240, 
To_Date('1998-10-11 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), null, 102); 
INSERT INTO professor VALUES
(9905, '권혁일', 'refresh', '교수', 450,  
To_Date('1986-02-11 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 25, 102);
INSERT INTO professor VALUES
(9906, '이만식', 'pocari', '부교수', 420,  
To_Date('1988-07-11 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), null, 101); 
INSERT INTO professor VALUES
(9907, '전은지', 'totoro', '전임강사', 210,  
To_Date('2001-05-11 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), null, 101);
INSERT INTO professor VALUES
(9908, '남은혁', 'bird13', '부교수', 400,  
To_Date('1990-10-18 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 17, 202);


--3. student 테이블
CREATE TABLE student (
  studno number NOT NULL,     	-- 학생번호
  name varchar2(20) NOT NULL,  	-- 이름
  userid varchar2(10) NOT NULL, 	-- 아이디
  grade number NOT NULL,     	-- 학년
  idnum varchar2(13) NOT NULL, 	-- 주민번호
  birthdate date NOT NULL, 		-- 생년월일
  tel varchar2(15) NOT NULL,   	-- 전화번호
  height number NOT NULL,    	-- 키
  weight number NOT NULL,    	-- 몸무게
  deptno number NOT NULL,    	-- 학과번호
  profno number DEFAULT NULL, 	-- 담당교수의 일련번호
  PRIMARY KEY (studno)) ;

INSERT INTO student VALUES 
(10101, '전인하', 'jun123', 4, '7907021369824', To_Date('1979-07-02', 'yyyy-mm-dd'), '051)781-2158', 176, 72, 101, 9903); 
INSERT INTO student VALUES 
(10102, '박미경', 'ansel414', 1, '8405162123648', To_Date('1984-05-16', 'yyyy-mm-dd'), '055)261-8947', 168, 52, 101, null);
INSERT INTO student VALUES 
(10103, '김영균', 'mandu', 3, '8103211063421', To_Date('1981-03-21', 'yyyy-mm-dd'), '051)824-9637', 170, 88, 101, 9906); 
INSERT INTO student VALUES 
(10104, '지은경', 'gomo00', 2, '8004122298371', To_Date('1980-04-12', 'yyyy-mm-dd'), '055)418-9627', 161, 42, 101, 9907); 
INSERT INTO student VALUES 
(10105, '임유진', 'youjin12', 2, '8301212196482', To_Date('1983-01-21', 'yyyy-mm-dd'), '02)312-9838', 171, 54, 101, 9907); 
INSERT INTO student VALUES 
(10106, '서재진', 'seolly', 1, '8511291186273', To_Date('1985-11-29', 'yyyy-mm-dd'), '051)239-4861', 186, 72, 101, null); 
INSERT INTO student VALUES 
(10107, '이광훈', 'huriky', 4, '8109131276431', To_Date('1981-09-13', 'yyyy-mm-dd'), '055)736-4981', 175, 92, 101, 9903); 
INSERT INTO student VALUES 
(10108, '류민정', 'cleansky', 2, '8108192157498', To_Date('1981-08-19', 'yyyy-mm-dd'), '055)248-3679', 162, 72, 101, 9907); 
INSERT INTO student VALUES 
(10201, '김진영', 'simply', 2, '8206062186327', To_Date('1982-06-06', 'yyyy-mm-dd'), '055)419-6328', 164, 48, 102, 9905); 
INSERT INTO student VALUES 
(10202, '오유석', 'yousuk', 4, '7709121128379', To_Date('1977-09-12', 'yyyy-mm-dd'), '051)724-9618', 177, 92, 102, 9905); 
INSERT INTO student VALUES 
(10203, '하나리', 'hanal', 1, '8501092378641', To_Date('1985-01-09', 'yyyy-mm-dd'), '055)296-3784', 160, 68, 102, null); 
INSERT INTO student VALUES 
(10204, '윤진욱', 'samba7', 3, '7904021358671', To_Date('1979-04-02', 'yyyy-mm-dd'), '053)487-2698', 171, 70, 102, 9905); 
INSERT INTO student VALUES 
(20101, '이동훈', 'dals', 1, '8312101128467', To_Date('1983-12-10', 'yyyy-mm-dd'), '055)426-1752', 172, 64, 201, null); 
INSERT INTO student VALUES 
(20102, '박동진', 'ping2', 1, '8511241639826', To_Date('1985-11-24', 'yyyy-mm-dd'), '051)742-6384', 182, 70, 201, null); 
INSERT INTO student VALUES 
(20103, '김진경', 'lovely', 2, '8302282169387', To_Date('1983-02-28', 'yyyy-mm-dd'), '052)175-3941', 166, 51, 201, 9902); 
INSERT INTO student VALUES 
(20104, '조명훈', 'rader214', 1, '8412141254963', To_Date('1984-12-14', 'yyyy-mm-dd'), '02)785-6984', 184, 62, 201, null);

select * from department;
select * from professor;
select * from student;
commit;

------- 문제풀기--------
--1.학생 테이블의 학생이름과 학생번호를 출력하라
select name, studno from student;
--2.단일컬럼에서 DISTINCT(검색결과 중복 제거 옵션)키워드 사용
--학생 테이블에서 중복되는 행을 제외한 학과번호 출력
select deptno from student;
select DISTINCT deptno from student;
--3.학과 테이블에서 학과이름 컬럼의 별명은 dept_name, 
--학과번호 컬럼의 별명은 DN으로 부여하여 출력
select dname as dept_name, deptno as DN from department;
select * from department;
--4. department테이블을 사용하여 deptno를 학과, dname를 학과명, 
--loc를 위치로 별명을 설정하여 출력하세요.
select deptno as "학과", dname 학과명, loc 위치 from department;
--5.교수 테이블에서 교수이름, 급여, 보너스를 포함한 연봉을 출력하라.
--단, 보너스를 포함한 연봉은 급여*12를 한 결과에 보너스 100을 더한 값으로 계산한다.
select name, sal, sal*12+100 from professor;
select name, sal, sal*12+100 as 연봉 from professor;
--6.학생 테이블에서 1학년 학생만 검색하여 학번, 이름, 학과 번호를 출력
select studno, name, deptno from student where grade=1;
--7.학생 테이블에서 학과번호가 101번인 학생들의 학번, 이름, 학년을 출력
select studno, name, grade, deptno from student where deptno=101;
--8. 학생 테이블에서 몸무게가 70키로 이하인 학생만 검색하여 
--학번, 이름, 학년, 학과번호, 몸무게를 출력
select studno, name, grade, deptno, weight from student where weight <= 70;
--9. 학생테이블에서 키가 170이상인 학생의 학번, 이름, 학년, 학과번호, 키를 출력
select studno, name, grade, deptno, height from student where height >= 170;
--10. 학생 테이블에서 1학년이면서 몸무게가 70키로이상인 학생만 검색하여 
--이름, 학년, 몸무게, 학과 번호를 출력
select name 이름, grade 학년, weight 몸무게, deptno "학과 번호" from student where grade=1 or weight >= 70;

--1.테이블 생성
create table dbtest(
    name varchar2(30),
    age number(3),
    height number(5,2),
    logtime date
);
--테이블 확인
select * from tab;
--테이블 구조 확인
desc dbtest;
--테이블 안 데이터 확인
select * from dbtest;

--테이블 삭제
--1)휴지통 이동
drop table dbtest;
--복원하기
FLASHBACK table dbtest to before drop;
--휴지통 비우기
purge recyclebin;
--2)휴지통 이동 안하고 바로 영구 삭제
drop table dbtest purge;

--테이블에 데이터 추가(sysdate:시스템의 현재 날짜와 시간을 저장)
insert into dbtest (name, age, height, logtime) 
values ('김동률', 50, 185.5666, sysdate);
insert into dbtest (name, age, height, logtime) 
values ('김미정', 50, 185.5666, sysdate);
insert into dbtest (name, age, height, logtime) 
values ('김동률', 50, 185.5333, sysdate);
insert into dbtest (name, age, height, logtime) 
values ('아이유', 30, 165.5333, sysdate);
insert into dbtest (name, age, height, logtime) 
values ('박진영', 48, 188.5333, sysdate);
insert into dbtest (name, age, height, logtime) 
values ('자이언티', 30, 175.5333, sysdate);
insert into dbtest (name, age) 
values ('브라운아이즈', 45);
insert into dbtest values ('거미', 46, 165.6, sysdate);
insert into dbtest values ('brian', 46, 165.6, sysdate);
insert into dbtest values ('정미김', 46, 165.6, sysdate);
insert into dbtest values ('김머시기', 46, 165.6, sysdate);

--영구저장
commit;

--데이터 검색
--1)테이블의 모든 내용 표시
select name, age, height, logtime from dbtest;
select * from dbtest;
--2)일부 컬럼만 표시
select name, age from dbtest;
--3)테이블에서 데이터가 있는 age 컬럼의 갯수
select count(age) from dbtest;
select count(height) from dbtest;
--4)저장된 모든 행(데이터)의 갯수
select count(*) from dbtest;
--5)정렬
select * from dbtest order by name; --(기본 오름차순)
select * from dbtest order by name asc;
select * from dbtest order by name desc; --내림차순
select * from dbtest order by age;
select * from dbtest order by age, height;
select * from dbtest order by age, height desc;
--6)조건검색
select * from dbtest where name='자이언티';
select * from dbtest where name='brian';
select * from dbtest where name='Brian';
select * from dbtest where name like '%김%';
select * from dbtest where name like '%김';
select * from dbtest where name like '김%';
select * from dbtest where name like '김___';
select * from dbtest where name like '%김%'  and age<=47;
select * from dbtest where height is null or logtime is null;
select * from dbtest where height is not null;

commit; --DB에 저장

--데이터 수정 update
select * from dbtest;
--1)이름이 김동률인 사람의 나이를 한살 증가시키기
update dbtest set age= age+1 where name='김동률';
--연습문제1) 나이가 null인 사람의 나이를 30으로 넣기
update dbtest set age=30 where age is null;
--연습문제2) height가 null인 사람의 키를 170으로 넣기
update dbtest set height=170 where height is null;
commit;
update dbtest set height=170;
rollback;

--데이터 삭제 delete
--1)이름이 김머시기 인 데이터 삭제
delete dbtest where name = '김머시기';
--2)모든 데이터 삭제
delete  dbtest;
--연습문제1) 이름이 '김'으로 시작하는 사람들 모두 삭제
delete dbtest where name like '김%';
