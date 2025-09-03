create database project ;
use project ;
create table readers(
reader_id varchar(20),
fname varchar(30),
mname varchar(30),
lname varchar(30),
city varchar(30),
mobile_no varchar(20),
occupation varchar(30),
dob date, constraint readers_pk primary key (reader_id)
);
insert into readers (reader_id, fname, mname, lname, city, mobile_no, occupation, dob)
VALUES
  ('R001', 'Alice', 'Marie', 'Johnson', 'New York', '555-1234567', 'Teacher', '1985-03-12'),
  ('R002', 'Bob', 'Allen', 'Smith', 'Chicago', '555-2345678', 'Engineer', '1990-06-25'),
  ('R003', 'Carol', 'Ann', 'Davis', 'Los Angeles', '555-3456789', 'Doctor', '1978-11-30'),
  ('R004', 'David', 'Lee', 'Wilson', 'Houston', '555-4567890', 'Artist', '1995-01-15'),
  ('R005', 'Emma', 'Louise', 'Martinez', 'Miami', '555-5678901', 'Student', '2000-07-19'),
  ('R006', 'Frank', 'John', 'Taylor', 'Seattle', '555-6789012', 'Writer', '1982-09-09'),
  ('R007', 'Grace', 'Elizabeth', 'Brown', 'Boston', '555-7890123', 'Lawyer', '1988-05-05'),
  ('R008', 'Henry', 'Michael', 'Anderson', 'Denver', '555-8901234', 'Architect', '1975-12-22'),
  ('R009', 'Irene', 'Carol', 'Thomas', 'Atlanta', '555-9012345', 'Nurse', '1986-04-02'),
  ('R010', 'Jake', 'William', 'Harris', 'San Jose', '555-0123456', 'Programmer', '1992-08-18');
select * from readers;

create table book (
b_id varchar(20),
bname varchar(20),
bdomain varchar(20),
constraint book_bid_pk primary key(b_id)
);
insert into book (b_id, bname, bdomain) 
values
  ('B001', 'Physics', 'Science'),
  ('B002', 'Hamlet', 'Literature'),
  ('B003', 'Cooking101', 'Cooking');
select * from readers;

create table active_readers (
  account_id varchar(12),
  reader_id varchar(12),
  b_id varchar(12),
  atype varchar(12),
  astatus varchar(12),
  constraint activereaders_acnumber_pk primary key (account_id),
  constraint account_readerid_fk foreign key (reader_id) REFERENCES readers(reader_id),
  constraint account_bib_fk foreign key(b_id) REFERENCES book(b_id)
);

insert into active_readers (account_id, reader_id, b_id, atype, astatus) 
values
('A001', 'R001', 'B001', 'Regular', 'Active'),
('A002', 'R002', 'B002', 'Guest', 'Inactive'),
('A003', 'R003', 'B003', 'Regular', 'Active'),
('A004', 'R004', 'B001', 'Guest', 'Active'),
('A005', 'R005', 'B002', 'Regular', 'Inactive'),
('A006', 'R006', 'B003', 'Regular', 'Active'),
('A007', 'R007', 'B001', 'Guest', 'Inactive'),
('A008', 'R008', 'B002', 'Regular', 'Active'),
('A009', 'R009', 'B003', 'Guest', 'Active'),
('A010', 'R010', 'B001', 'Regular', 'Inactive');

select * from active_readers;

create table bookissue_details (
  issuenumber varchar(6),
  account_id varchar(12),
  bid varchar(20),
  bookname varchar(50),
  number_of_book_issued int(7),
  constraint trandetails_tnumber_pk primary key (issuenumber),
  constraint trandetails_acnumber_fk foreign key(account_id) references active_readers(account_id)
);
show tables;
insert into bookissue_details (issuenumber, account_id, bid, bookname, number_of_book_issued )
values ('ISS001', 'A001', 'B001', 'Physics', 1),
('ISS002', 'A002', 'B002', 'Hamlet', 2),
('ISS003', 'A003', 'B003', 'Cooking101', 1),
('ISS004', 'A004', 'B001', 'Physics', 1);

select * from active_readers;

select * from active_readers where astatus='Terminated';

select * from active_readers where astatus='Active';

select count(account_id) from active_readers where atype='Premium';
