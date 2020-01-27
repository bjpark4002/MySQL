# select practice
select *
from employees;

#부서정보
select *
from departments;

#부서관리자정보
select *
from dept_manager;

# 직함정보
select *
from titles;


select * from employees;

select emp_no, first_name, last_name from employees;

select emp_no,birth_date, gender f
from employees;


select 20 + 30;
select 30 / 20;
select 50 * 20;
select 50 - 70;


select * 
from salaries;

select distinct emp_no 
from salaries;

select dept_no 
from departments;

select distinct title 
from titles;


select emp_no, dept_no
from dept_manager
where dept_no = "d005";

select emp_no, dept_no
from dept_manager
where dept_no <> 'd003';


select emp_no, salary
from salaries
where salary >= 150000;

select emp_no, salary
from salaries
where salary <= 40000;


select *
from employees
where hire_date >= '2000-1-2';





 
select emp_no, dept_no, from_date
from dept_manager
where dept_no = 'd001' and from_date >= '1990-01-01';

select emp_no, gender, hire_date
from employees
where hire_date >= '1990-01-01' and gender = 'M';

select *
from employees
where hire_date >= '1990-01-01' ;

select emp_no, salary, from_date
from salaries
where salary > 60000 and from_date > '1990-01-01';

select emp_no, dept_no
from dept_manager
where dept_no = 'd002' or dept_no = 'd001';

select emp_no, title 
from titles
where title = 'Staff' or title = 'Engineer';

# same two below
select emp_no, dept_no
from dept_manager
where emp_no <> 'd003';

select emp_no, dept_no
from dept_manager
where not emp_no = 'd003';

# same two below

select emp_no, salary
from salaries
where salary >= 60000 and salary<70000;

select emp_no, salary
from salaries
where salary between 60000 and 69999;

select emp_no, dept_no
from dept_manager
where dept_no = 'd001' or dept_no = 'd002';

select emp_no, dept_no
from dept_manager
where dept_no in('d001','d002');

select *
from employees
where first_name = 'Tommaso';


# employee whose name starts with A
select emp_no, first_name
from employees
where first_name like 'A%';


#사원의 이름이 s로 끝남
select emp_no, first_name
from employees
where first_name like '%s';


#사원 이름2번째글자가 i
select emp_no, first_name
from employees
where first_name like '_i%';


# 사원 이름 5글자
select emp_no, first_name
from employees
where first_name like '_____';


#사원 이름에 o가 들어가고 마지막에 o가 포함되음않음
select emp_no, first_name
from employees
where first_name like '%o%' and not first_name like '%o';

# 사원의 급여 오름차순 (오름차순은 asc 생략가능)
select emp_no, salary
from salaries
order by salary asc;

#사원의 급여 내림차순
select emp_no, salary
from salaries
order by salary desc;

#사원의 이름 오름차순
select emp_no, first_name
from employees
order by first_name asc;
#사원의 이름 내림차순
select emp_no, first_name
from employees
order by first_name desc;

#사원의 입사일 오름차순
select emp_no, hire_date
from employees
order by hire_date asc;

#사원의 입사일 내림차순
select emp_no, hire_date
from employees
order by hire_date desc;

#절대값
select abs(-100);
#ceil
select ceil(10.1),  ceil(10.5), ceil(10.9) ;
select ceil(-10.1), ceil(-10.5), ceil(-10.9);

#소수점이하
select floor(10.9), floor(10.2), floor(10.5);

#반올림
select round(10.1, 0), round(10.111,1), round(11250.1111, -2);
#내림
select truncate(12345.12345, 2), truncate(12345.12345,-2), truncate(12345.12345,0);

#제곱
select pow(10,10);
#mod
select mod(10,3);

#greatest
select greatest(10,11,12,13);
#smallest 
select least(10,11,12,13);


select emp_no, salary*1.1, ceil(salary * 1.1 ) , floor(salary*1.1), round(salary*1.1,0)  
from salaries;


select concat('a','b','c');

select insert('aaaaa',2,0,'bbb');
#replace
select replace('aabbcc','bb','bumjin');

#substring.  if none, return 0 or return index (starting from 1 );
select instr('aabbccddee','ccd');



select left('abcdefg',3);

select right('abcdefg',3);

select mid('abcdefg',3,3);

select concat('[' ,'         abc           ', ']'); 

select concat('[' ,ltrim('         abc           '), ']'); 
select concat('[' ,rtrim('         abc           '), ']'); 
select concat('[' ,trim('         abc           '), ']'); 

select lcase('ADASDFDSAFDS');
select lower('ASDFZXCV');

select ucase('asgskdljgasU');
select upper('asdfzxcv');

select reverse('abcde');

select upper(concat(first_name,' ', last_name))
from employees;

#날짜 + 시간
select now(), sysdate(), current_timestamp(); 

#날짜
select curdate(), current_date;

#시간
select curtime(), current_time();

#시간 추가

select now(), date_add(now(), interval 100 year);
select now(), date_add(now(), interval 100 month);
select now(), date_add(now(), interval 100 week);
select now(), date_add(now(), interval 100 day);
select now(), date_add(now(), interval 100 minute);
select now(), date_add(now(), interval 100 second);
# date_add and date_sub have same syntax

select hire_date, date_sub(hire_date, interval 100 day)
from employees;




select year(now()), week( date_sub( now(),interval 2 month));

select month(now()), monthname(now());
select now(), dayname(now());

select now(), date_format(now(), '%Y년 %m월 %d일 %H시 %I분 %s초');


#그룹함수
# number of employees
select count(emp_no) 
from employees;

select count(*)
from employees;

#numer of male employees
select count(gender) 
from employees 
where gender = 'M';

# # of emp who work in 'd005' currently ( use 9999-01-01)
select count(emp_no)
from dept_emp
where dept_no = 'd005' and to_date = '9999-01-01';


#sum of salaries
select sum(salary)
from salaries
where to_date = '9999-01-01';


select avg(salary)
from salaries
where to_date = '9999-01-01';

select max(salary)
from salaries
where to_date = '9999-01-01';

select min(salary)
from salaries
where to_date = '9999-01-01';


# 사원의 수를 성별로 구분
select gender, count(*)
from employees
group by gender;

#각 부서에 근무하고 있는 사원의 수
select dept_no, count(*)
from dept_emp
where to_date = '9999-01-01'
group by dept_no;

#각 부서별 과거의 매니저의 수
select dept_no, count(*)
from dept_manager
where to_date <> '9999-01-01'
group by dept_no;

#급여 수령 시작일별 급여 총합
select from_date , sum(salary)
from salaries
group by from_date;


#급여 수령 시작일별 급여 평균
select from_date, avg(salary)
from salaries
group by from_date;

#급여 수령 시작일별 급여 최고액
select from_date, max(salary)
from salaries
group by from_date;

#급여 수령 시작일별 급여 최저액
select from_date, min(salary)
from salaries
group by from_date;


# having

select title, count(title) 
from titles
group by title
having count(title)>=100000;

select dept_no, count(emp_no)
from dept_emp
group by dept_no
having count(emp_no)>= 50000;



# join !!!!



# 사원들의 사원번호, 근무 부서 번호, 근무부서 이름 ( 사원번호 오름차순정렬)
# these 2 below = cartesian product
select dept_emp.emp_no, dept_emp.dept_no, departments.dept_name
from dept_emp, departments
order by emp_no asc;

select a.emp_no, a.dept_no, b.dept_name
from dept_emp AS a, departments AS b
where a.dept_no = b.dept_no
order by a.emp_no asc;

# 각 사원들 사원번호, first name, 근무 부서번호
select a.emp_no , b.first_name, a.dept_no
from dept_emp as a, employees as b
where a.emp_no = b.emp_no;


# 각 사원들의 사원번호, 이름 , 현재 받고있는 급여액
select a.emp_no, a.first_name, b.salary
from employees as a, salaries as b
where a.emp_no = b.emp_no and b.to_date = '9999-01-01';

select *
from departments;

# 각 사원들의 사원번호, 이름 , 근무 부서 이름
select a.emp_no, c.first_name, b.dept_name
from dept_emp as a, departments as b, employees as c
where c.emp_no = a.emp_no and a.dept_no = b.dept_no;




#현재받는 급여의 평균액보다 많이받는 사원들의 사원번호, 급여

select emp_no, salary from salaries where salary > (select avg(salary) from salaries where to_date = '9999-01-01') and to_date = '9999-01-01';

# or # 

select a.emp_no, a.salary
from salaries AS a,
(select avg(salary) AS AvgSal
from salaries
where to_date = '9999-01-01'
group by to_date) AS b
where a.salary > b.AvgSal;



# d001 부서에 근무하고 있는 사원들의 사원번호와 first name을 가져온다

select A.emp_no, A.first_name
from employees AS A,(select * from dept_emp where dept_no = 'd001') AS B where A.emp_no = B.emp_no;


select emp_no, first_name
from employees where emp_no in(select emp_no from dept_emp where dept_no = 'd001');




# 1960년 이후에 태어난 사원들이 근무하고있는 사원들의 사원번호와 근무부서 번호를 가져온다
select A.emp_no, A.dept_no, B.birth_date
from dept_emp AS A,
(select emp_no, birth_date 
from employees
where birth_date >= '1960-01-01') AS B
where A.emp_no = B.emp_no;

select emp_no, dept_no 
from dept_emp
where emp_no in(select emp_no from employees where birth_date >= '1960-01-01');


#############creat database
create database test_db
character set = 'utf8'
collate = 'utf8_general_ci'; # to enable Korean I/O

use test_db;

create table test_table1(
data1 int(10),
data2 varchar(10),
data3 float(10,2)
);

select * from test_table1;

use employees;

select * from departments;

create table dept1
as 
select * from departments;

desc dept1;

select * from dept1;

create table dept2
as
select * from departments where 1=0;

select * from dept2;

create table dept3
as
select dept_no from departments;

select * from dept3;


