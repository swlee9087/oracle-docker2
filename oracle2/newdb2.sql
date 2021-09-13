drop table imported_book;
drop table orders;
drop table customers;
drop table books;
drop table publishers;
drop table employees;

create table departments(
    dep_id number PRIMARY KEY,
    dep_name VARCHAR2(10),
    loc VARCHAR2(10)
);

create table employees(
    emp_id number  PRIMARY KEY,
    emp_name VARCHAR2(10),
    emp_job VARCHAR2(10),
    MGR NUMBER,
    hire_date    DATE DEFAULT SYSDATE,
    sal NUMBER,
    commission NUMBER,
    dep_id number
        constraint dep_emp_fk REFERENCES departments(dep_id)
    );
    
create table publishers(
    pub_id NUMBER PRIMARY KEY,
    pub_name VARCHAR2(50),
    mgr_name VARCHAR2(50),
    phone VARCHAR2(50)
);
create table books(
    book_id number PRIMARY KEY,
    book_title VARCHAR2(50),
    price NUMBER,
    pub_id NUMBER CONSTRAINT pub_book_fk REFERENCES publishers(pub_id)
);
create table customers(
    cust_id NUMBER PRIMARY KEY,
    cust_name VARCHAR2(50),
    address VARCHAR2(50),
    phone VARCHAR2(50)
);
create table orders(
    order_id NUMBER PRIMARY KEY,
    cust_id NUMBER CONSTRAINT cust_ord_fk REFERENCES customers(cust_id),
    book_id NUMBER CONSTRAINT book_ord_fk REFERENCES books(book_id),
    order_price number,
    order_date DATE DEFAULT SYSDATE
);

insert into publishers values(1,'�½�����', '�豸', '010-1111-1111');
insert into publishers values(2,'������', '������', '010-1222-2211');
insert into publishers values(3,'���ѹ̵��', '������', '010-3322-2211');
insert into publishers values(4,'�̻�̵��', '�̻�', '010-5522-5211');
insert into publishers values(5,'�Ｚ��', '�̺�â', '010-5772-5211');
insert into publishers values(6,'Person', 'James', '010-5788-5211');

insert into books values(1,'�౸�� ����',  7000, 1);
insert into books values(2,'�౸ �ƴ� ����',13000,2);
INSERT into books values(3, '�౸�� ����', 22000, 3);
insert into books values(4, '���� ���̺�',  22000, 3);
INSERT INTO Books VALUES(5, '�ǰ� ����', 8000, 1);
insert into Books VALUES (6, '���� �ܰ躰���', 8000, 1);
insert into books values(7, '�߱��� �߾�', 13000, 4);
INSERT INTO books VALUES(8, '�߱��� ��Ź��', 13000, 4);
insert into books values(9, '�ø��� �̾߱�',7500, 5);
INSERT INTO books VALUES(10, 'Olympic Champions', 13000,6);

INSERT into customers values(1, '�ڽü�', '���� ��ü����', '000-5000-0001');
insert into customers values(2,'�迬��','���ѹα� ����','000-6000-0001');
INSERT into customers values(3, '��̶�', '���ѹα� ������', '000-7000-0001');
insert into customers values(4, '�߽ż�', '�̱� Ŭ������', '000-5000-0001');
INSERT INTO Customers VALUES(5, '�ڼ���', '���ѹα� ����', NULL);

inSErt into orders values(1, 1, 1, 6000, TO_DATE('2020-07-01','yyyy-mm-dd'));
insert into orders values (2,1,3,21000,to_date('2020-07-03','yyyy-mm-dd'));
INSERT into orders values(3, 2, 5, 8000, to_date('2020-07-03', 'yyyy-mm-dd'));
insert into orders values(4, 3, 6, 6000, TO_DATE('2020-07-04', 'yyyy-mm-dd'));
INSERT INTO Orders VALUES(5, 4, 7, 20000, TO_DATE('2020-07-05', 'yyyy-mm-dd'));
INSERT INTO orders VALUES(6, 1, 2, 12000, TO_DATE('2020-07-07', 'yyyy-mm-dd'));
insert into orders values(7,4,8,13000, TO_DATE('2020-07-07','yyyy-mm-dd'));
INSERT INTO orders VALUES(8, 3, 10,  12000, TO_DATE('2020-07-09','yyyy-mm-dd'));
insert into orders values(9, 2, 10, 7000, to_date('2020-07-10', 'yyyy-mm-dd'));
insert into orders values(10, 3, 8, 13000, to_date('2020-07-10', 'yyyy-mm-dd'));


create table imported_book (
    bookid number PRIMARY KEY,
    bookname VARCHAR2(50),
    publisher VARCHAR2(50),
    price number
    );
insert into imported_book VALUES(21, 'Zen Golf', 'Person', 12000);
insert into imported_book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);

commit;

select * from tab;

select * from books;
select 
            book_id bookId,
            book_title bookTitle,
            price,
            pub_id pubId
      from books
      where price >= 10000
;
select * from customers;
select
            cust_id customerId,
            cust_name customerName,
            address,
            phone
      from customers
      where phone like '%[-]%'  
;
select * from orders;
select
            order_id orderId,
            cust_id custId,
            book_id bookId,
            order_price orderPrice,
            order_date orderDate
      from orders
      where -- like 
;
select * from publishers;
select
            pub_id pubId,
            pub_name pubName,
            mgr_name mgrName,
            phone
      from publishers
      where --like
;      