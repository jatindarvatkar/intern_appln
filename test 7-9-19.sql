SELECT * FROM student_info.student;
alter table student
drop column address ;
alter table student
drop column pt_house_color;
alter table student
add column batch_id int;
create table std_status(status_id int primary key, status_desc varchar(45));
create table batch(batch_id int primary  key, batch_name varchar(45), teacher_id int);
create table score(roll_no int,foreign key(roll_no)references student(roll_no), test_date date, topic varchar(45), marks_obtained int);
create table attendance(roll_no int primary key, foreign key(roll_no) references student(roll_no), attended_date date, present varchar(450));
create table teacher(t_id int primary key, tname varchar(45));

alter table student
add column qualification varchar(450) after roll_no;

create table student_copy as select * from student;

select s.sname  from student s join attendance a on s.roll_no = a.roll_no inner join batch b on s.batch_id = b.batch_id inner join score se on s.roll_no = se.roll_no
where b.batch_name = 'july 2019' and se.test_date = '2017-12-18' and a.present = 'N';

update student s join batch b on s.batch_id = b.batch_id 
set b.batch_name = 'March 2017'
where b.batch_name ='Feb 2017'
and s.sname = 'Jatin';

update batch b join student s on s.batch_id = b.batch_id
set b.student_count = count(s.roll_no)
where s.batch_id = b.batch_id;

select s.sname from student s join batch b on s.batch_id = b.batch_id
where s.Qualification = 'Graduate'
and s.year_of_pass = extract(year from s.year_of_pass)=2014
and b.batch_name = 'July 2019';

select s.sname , se.topic , se.marks_obtained from student s join score se on s.roll_no = se.roll_no inner join batch b on s.batch_id = b.batch_id
where b.batch_name ='July 2017';

select b.batch_name , count(*) from student s join batch b on s.batch_id = b.batch_id inner join std_status sd on s.status_id = sd.status_id
where sd.status_desc  = 'Placed'
group by b.batch_name 
having count(*)<5;

select s.sname from student s join batch b on s.batch_id = b.batch_id inner join attendance a on s.roll_no = a.roll_no
where b.batch_name  = 'July 2017';

create view v1 as select s.roll_no , s.sname , b.batch_name from student s join batch b on s.batch_id = b.batch_id;
select * from v1;

create index i1 on student(roll_no);

select s.roll_no , sd.status_desc from student s left join std_status sd on s.status_id = sd.status_id
where sd.status_desc = 'Placed';

delete a from student s join std_status sd on s.status_id = sd.status_id inner join attendance a on s.roll_no = a.roll_no
where sd.status_desc = 'Placed';

delete s from student s join score se on s.roll_no = se.roll_no
where avg(marks_obtained)<50;