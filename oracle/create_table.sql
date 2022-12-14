	create table department
	(
		dept_id 		varchar2(10) 	not null,
		dept_name 	varchar2(20) 	not null,
		office 		varchar2(20),
		constraint pk_department primary key(dept_id)
	);



	create table student
	(
		stu_id 		varchar2(10) 	not null,
		resident_id 	varchar2(14) 	not null,
		name 		varchar2(10) 	not null,
		year 		int,
		address 	varchar2(10),
		dept_id 	varchar2(10),
		constraint pk_student primary key(stu_id),
		constraint fk_student foreign key(dept_id) references department(dept_id)
	);



	create table professor
	(
		prof_id 		varchar2(10) 	not null,
		resident_id 	varchar2(14) 	not null,
		name 		varchar2(10) 	not null,
		dept_id 		varchar2(10),
		position 	varchar2(10),
		year_emp 	int,
		constraint pk_professor primary key(prof_id),
		constraint fk_professor foreign key(dept_id) references department(dept_id)
	);


	create table course
	(
		course_id 	varchar2(10) 	not null,
		title 		varchar2(28) 	not null,
		credit 		int,
		constraint pk_course primary key(course_id)
	);



	create table class
	(
		class_id 	varchar2(10) 	not null,
		course_id 	varchar2(10),
		year 		int,
		semester 	int,
		division 	char(1),
		prof_id 		varchar2(10),
		classroom 	varchar2(9),
		enroll 		int,
		constraint pk_class primary key(class_id),
		constraint fk_class1 foreign key(course_id) references course(course_id),
		constraint fk_class2 foreign key(prof_id) references professor(prof_id)
	);



	create table takes
	(
		stu_id 		varchar2(10) 	not null,
		class_id 	varchar2(10),
		grade 		char(5),
		constraint pk_takes primary key(stu_id, class_id),
		constraint fk_takes1 foreign key(stu_id) references student(stu_id),
		constraint fk_takes2 foreign key(class_id) references class(class_id)
	);
