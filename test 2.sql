create table service_request(service_id int, cust_id int,service_desc varchar(45), request_open_date date, status_id int,emp_id int, request_closed_date date, charges int, feedback_rating varchar(56),primary key(service_id,cust_id,emp_id));
create table service_status(status_id int primary key, service_desc varchar(45));
create table employee(emp_id int primary key, ename varchar(45), age int, request_completed int, emp_rating varchar(45));
create table customer(cust_id int primary key, cname varchar(45), address1 varchar(45),address2 varchar(45), city varchar(45), pin_code int);
alter table service_request add foreign key (cust_id) references customer(cust_id);
alter table service_request add foreign key (status_id) references service_status(status_id);
alter table service_request add foreign key (emp_id) references employee(emp_id);
desc service_request;
alter table customer add column email_id varchar(50);
alter table service_request add foreign key(service_desc) references service_status(service_desc);
select c.cname,sr.service_desc,sr.charges,from service_request sr inner join customer c, inner join employee e
where sr.emp_id=(seelct e.emp_id where age>30);

select cust_id from service_request s join employee emp6 
on s.emp_id = e.emp_id 
where service_desc =(select e.ename where e,ename='jatin'  and service_desc ='closed');