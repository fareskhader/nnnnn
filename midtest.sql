SELECT FIRST_NAME ,LAST_NAME,salary,
case
when salary<2000 then 'low'
when salary between 2000 and 5000 then 'mid'
when salary>=5000 then 'heigh'
else 'none'
end
from EMPLOYEES
ORDER BY EMPLOYEE_ID;
================================================================
SELECT avg(salary) FROM EMPLOYEES
where department_id=50;
================================================================
SELECT min(salary) as minimum, max(salary) as maximum
from EMPLOYEES
where department_id=100;
================================================================
SELECT count(*) 
from departments;
================================================================
SELECT count(*) 
from EMPLOYEES
where MANAGER_ID IS NOT NULL;
================================================================
SELECT SUM(salary) AS SAMMATION
FROM employees
WHERE department_id=50;
================================================================
select department_name
from departments
where MANAGER_ID in(200,145)
================================================================
select department_id,min(salary) as minimum,max(salary) as maximum
,avg(salary) as average
from employees
group by department_id;
================================================================
select department_id,min(salary) as minimum,max(salary) as maximum
,avg(salary) as average
from employees
where salary >10000
group by department_id
having avg(salary)>4000;
================================================================
select  distinct department_id
from employees;
================================================================
select FIRST_NAME,LAST_NAME
from employees
where first_name like 'A%'
================================================================
select * from jobs ;
================================================================
select salary_categorized,count(*)
from ( select 
      case
      when salary<5000 then 'low'
      when SALARY>=5000 and SALARY<10000 then 'medium'
      when SALARY>10000 then 'heigh'
      else 'none of this'
      end as  salary_categorized
       from employees 
        )
group by salary_categorized;
=================================================================
select * from employees
where first_name LIKE 'J%';
=================================================================
SELECT FIRST_NAME ,LAST_NAME,salary,
case
when salary<2000 then to_char(SALARY)
when salary between 2000 and 5000 then to_char(SALARY)
when salary>=5000 then 'heigh'
else 'none'
end
from EMPLOYEES
ORDER BY EMPLOYEE_ID;    
================================================================
select job_id,to_char(START_DATE,'YYYY')
from job_history;
================================================================
select concat(JOB_ID,to_char(start_date,'yyyy-MM-DD')) from job_history
================================================================
select concat(first_name,LAST_NAME)
from employees;
================================================================
select trim('          kkkk df d ') from dual;
================================================================
select trim(leading 'f' from 'fares') from dual;
================================================================
select upper(first_name) from employees;    
================================================================
select lower(first_name) from employees;  
================================================================
select EMPLOYEE_ID,first_name,HIRE_DATE,add_months(HIRE_DATE,-3) from employees;
================================================================
select EMPLOYEE_ID,first_name,HIRE_DATE,last_day(HIRE_DATE) from employees;
================================================================
select EMPLOYEE_ID,first_name,HIRE_DATE,next_day(HIRE_DATE,'sunday') from employees;
================================================================
select 
      HIRE_DATE,
      extract(YEAR from HIRE_DATE) as hire_year,
      extract(month from HIRE_DATE) as hire_month,
      extract(day from HIRE_DATE) as hire_day
from employees;
==================================================================
select 
      HIRE_DATE,
      round(hire_date,'YEAR') as hire_year,
      round(hire_date,'month') as hire_month,
      round(hire_date,'day') as hire_day
from employees;
===================================================================
select 
EMPLOYEE_ID,
first_name,
LAST_NAME,
case 
    when extract(year from hire_date)<2010 then 'veteran'
    when extract(year from hire_date) between 2010 and 2015 then 'experienced'
    else 'newcomer'
end as employee_category
from employees;    
====================================================================
select * 
from employees
where salary> (select avg(salary) from employees)
====================================================================
select * from employees
 where department_id  not in (select DEPARTMENT_ID from departments
where MANAGER_ID between 50 and 100)
====================================================================
select first_name,LAST_NAME
from employees
where first_name like 'S%' or LAST_NAME like 'S%';
================================================================
SELECT * FROM employees
where extract(month from hire_date) = 5;
================================================================
SELECT * FROM employees
WHERE extract(YEAR FROM hire_date)=2014;
================================================================
SELECT * FROM employees
WHERE extract(YEAR FROM HIRE_DATE) = EXTRACT (YEAR FROM CURRENT_DATE);
================================================================
select trunc(sysdate)-to_date('01-01-2011') as day_difirence from dual
====================================================================
select  extract(year from hire_date) as hiring_date,count(*) 
FROM employees
WHERE extract(YEAR FROM HIRE_DATE) = EXTRACT(YEAR FROM CURRENT_DATE)
group by extract(month FROM hire_date),hiring_date;
====================================================================
select extract(year from hire_date) as joining_year,count(*)
from employees
group by joining_year
having count(*)>10;
=====================================================================
select * from employees;
====================================================================
SELECT * from employees
WHERE  (CURRENT_DATE-HIRE_DATE)>=5
====================================================================
select * 
from EMPLOYEES
where (extract (year from CURRENT_date) - extract (year from HIRE_DATE)) >=10 ;
====================================================================
SELECT EXTRACT(DAY FROM HIRE_DATE) AS EXTRACTED_DAY,EXTRACT(DAY FROM HIRE_DATE)+10,EMPLOYEE_ID,first_name,LAST_NAME
FROM EMPLOYEES;
====================================================================
select FIRST_NAME,LAST_NAME,commission_pct,
case
when commission_pct is not null then 'yes'
else 'no'
end as bonus
 from employees;
====================================================================
select MAX(salary) 
from employees
where job_id in
(select job_id from jobs
WHERE job_title like '%Clerk');
====================================================================
select sum(counts) from(
select count(*) as counts,department_id,SALARY from employees
group by department_id ,salary
order by department_id)
====================================================================
SELECT SUM(NUMBER_OF_EMPLOEES) FROM (
SELECT COUNT(*) AS NUMBER_OF_EMPLOEES FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ,SALARY);
====================================================================
select * from employees 
where first_name like 'S%' or last_name like 'S%';
====================================================================
select * from employees where extract(month from hire_date)=5
====================================================================
select * from employees where extract(year from hire_date)=2001
====================================================================
select trunc(sysdate)-to_date('01-01-2011') as day_difirence from dual
====================================================================select trunc(sysdate)-to_date('01-01-2011') as day_difirence from dual
SELECT TRUNC(SYSDATE) - TO_DATE('2011-01-01', 'YYYY-MM-DD') AS DAYS_DIFFERENCE
FROM DUAL;
====================================================================
select count(*) from employees 
where extract(year from hire_date)=extract(year from to_date('2015-01-01', 'YYYY-MM-DD'))
group by extract(month from CURRENT_DATE) 
====================================================================

SELECT  COUNT(*) AS JOIN_COUNT
FROM EMPLOYEES
WHERE EXTRACT(YEAR FROM HIRE_DATE) = EXTRACT(YEAR FROM CURRENT_DATE )
GROUP BY EXTRACT(MONTH FROM HIRE_DATE);

====================================================================

/* create table employee(
     EMP_NAME VARCHAR2(120) ,
     emp_id NUMBER (3) ,
     EMP_SALARY NUMBER (4,2), --2500,25$
     HIRE_DATE DATE  , 
     WORK_HOURES TIMESTAMP(3)
     , GENDER CHAR(1)  --EITHER MALE OR FEMALE
      ,primary KEY (emp_id)

 );

ALTER TABLE EMPLOYEE DROP PRIMARY KEY;
ALTER TABLE EMPLOYEE DROP COLUMN GENDER;
ALTER table EMPLOYEE
ADD CONSTRAINT EMP_COMP_PK primary key (EMP_SALARY);
ALTER TABLE EMPLOYEE
MODIFY EMP_NAME VARCHAR (50) NULL;

 ALTER table EMPLOYEE
ADD CONSTRAINT EMP_COMP_PK primary key (EMP_ID,EMP_NAME);
 DESCRIBE EMPLOYEE;*/
================================================================
select * from employees;
================================================================
CREATE TABLE STUDENT(
STUDENT_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL
,FIRST_NAME VARCHAR(50)
,LAST_NAME VARCHAR(50),
EMAIL VARCHAR(150)
);

CREATE TABLE COURSE(
COURSE_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL
,COURSE_NAME VARCHAR(50),
CREDITS NUMBER
);
CREATE TABLE ENROLLMENT(
STUDENT_ID NUMBER ,
COURSE_ID NUMBER,
ENROLLMENT_DATE DATE  



);


ALTER TABLE STUDENT
ADD CONSTRAINT PK_STUDENT_ID PRIMARY KEY (STUDENT_ID);

ALTER TABLE COURSE
ADD CONSTRAINT PK_COURSE_ID PRIMARY KEY (COURSE_ID);



ALTER TABLE ENROLLMENT
ADD CONSTRAINT DL_COURSE_STUDENT_ID PRIMARY KEY (COURSE_ID,STUDENT_ID); -- COMPISITE KEY
ALTER TABLE ENROLLMENT
ADD CONSTRAINT FK_STUDENT_ID FOREIGN KEY (STUDENT_ID)  REFERENCES   STUDENT (STUDENT_ID)  ;
ALTER TABLE ENROLLMENT
ADD CONSTRAINT FK_COURSE_ID FOREIGN KEY (COURSE_ID)  REFERENCES   COURSE (COURSE_ID)  ;

alter table ENROLLMENT
modify ENROLLMENT_DATE DEFAULT CURRENT_DATE;

ALTER TABLE STUDENT 
MODIFY EMAIL DEFAULT 'TEST@GMAIL.COM';
INSERT INTO STUDENT (FIRST_NAME,LAST_NAME) VALUES ('IBRAHEEM','AWAD') --لازم ادخل كل القيم
INSERT INTO STUDENT (FIRST_NAME,LAST_NAME) VALUES ('ALAA','ABUU')

INSERT INTO COURSE VALUES(1,'DATA BASE',3)
INSERT INTO COURSE (COURSE_ID,COURSE_NAME,CREDITS) VALUES (2,'OS' , 3) 
INSERT INTO COURSE (COURSE_NAME,CREDITS) VALUES ('RTTETW' , 5)


ALTER TABLE TABLE_1
ADD CONSTRAINT PK_O PRIMARY KEY (ID)
---------------------------------------------------------------------

ALTER TABLE TABLE_2
ADD COL_2  NUMBER DEFAULT 2;
------------------------------------------

INSERT into STUDENT(FIRST_NAME,LAST_NAME) values ('alaa','khaled')
INSERT into STUDENT(STUDENT_ID,FIRST_NAME,LAST_NAME,EMAIL) values (5,'alaa','khaled','FOFF@GMAIL.COM')


CREATE TABLE STUDENTSSSSSSSSSSSSS(
STUDENT_ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY key NOT NULL
,FIRST_NAME VARCHAR(50)
,LAST_NAME VARCHAR(50),
EMAIL VARCHAR(150)
);
alter taBLE STUDENTSSSSSSSSSSSSS
DROP COLUMN LAST_NAME

ALTER TABLE STUDENTSSSSSSSSSSSSS DROP PRIMARY KEY;

 
ALTER TABLE STUDENTSSSSSSSSSS
DROP PRIMARY KEY;

alter taBLE STUDENTSSSSSSSSSSSSS
ADD CONSTRAINT P_O PRIMARY KEY (FIRST_NAME)