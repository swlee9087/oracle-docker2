drop table departments;
drop table employees;

create table departments(
    dep_id number primary key,
    dep_name varchar2(10),
    loc varchar2(10)
);
desc departments;
select * from departments;

create table employees(
    emp_id number primary key,
    emp_name varchar2(10),
    emp_job varchar2(10),
    mgr number,
    hire_date DATE DEFAULT SYSDATE,
    sal number,
    commi number,
    dep_id number
        constraint dep_emp_fk references departments(dep_id) 
    );
desc employees;
select * from employees;
------

create table publisher(
    pub_id NUMBER PRIMARY KEY,
    mgr_name VARCHAR2(10),
    phone NUMBER
);
desc publisher;
select * from publisher;

create table book(
    book_id NUMBER PRIMARY KEY,
    book_title VARCHAR2(20),
    price NUMBER,
    pub_id NUMBER 
        CONSTRAINT pub_book_fk REFERENCES publisher(pub_id)            
    );
desc book;
select * from book;
    
create table customer(
    cust_id NUMBER PRIMARY KEY,
    cust_name VARCHAR2(20),
    address VARCHAR2(20),
    phone NUMBER
);    
desc customer;
select * from customer;

create table orders(
    order_id NUMBER,    
    order_date NUMBER,
    order_price NUMBER,
    cust_id NUMBER
        CONSTRAINT cust_order_fk REFERENCES customer(cust_id),
    book_id NUMBER
        CONSTRAINT book_order_fk REFERENCES book(book_id)
);
desc orders;
select * from orders;
DROP TABLE orders;


----------------

create table prof(
    ssn number primary key,
    name VARCHAR2(50),
    age number,
    rank varchar2(50),
    speciality varchar2(50)
);
desc prof;

create table dept(
    dno number primary key,
    ssn number CONSTRAINT prof_dept_fk REFERENCES prof(ssn),
    dname varchar2(50),
    office varchar2(50)
);
desc dept;

create table workdept(
    pct_time number,
    ssn number CONSTRAINT prof_workdept_fk REFERENCES prof(ssn),
    dno number CONSTRAINT dept_workdept_fk REFERENCES dept(dno)
);
desc workdept;

create table graduate(
    ssn number primary key,
    dno number CONSTRAINT dept_graduate_fk REFERENCES dept(dno),
    name VARCHAR2(50),
    age number,
    deg_prog VARCHAR2(50),
    graduatessn number CONSTRAINT graduate_graduate_fk REFERENCES graduate(ssn)
);
desc graduate;

create table proj(
    pid number primary key,
    ssn number CONSTRAINT prof_proj_fk REFERENCES prof(ssn),
    sponsor VARCHAR2(50),
    start_date DATE DEFAULT SYSDATE,
    end_date DATE DEFAULT SYSDATE,
    budget number
);    
desc proj;

create table workin(
    ssn number CONSTRAINT prof_workin_fk REFERENCES prof(ssn),
    pid number CONSTRAINT proj_workin_fk REFERENCES proj(pid)
);
desc workin;

create table workprog(
    ssn number CONSTRAINT graduate_workprog_fk REFERENCES graduate(ssn),
    pid number CONSTRAINT proj_workprog_fk REFERENCES proj(pid)
);
desc workprog;