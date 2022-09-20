create user ssu02 identified by ssu02 default tablespace USERS temporary tablespace TEMP;
grant connect, resource, dba to ssu02;


	create table ssu02.department
	(
		dept_id 		varchar2(10) 	not null,
		dept_name 	varchar2(20) 	not null,
		office 		varchar2(20),
		constraint pk_department primary key(dept_id)
	);



	create table ssu02.student
	(
		stu_id 		varchar2(10) 	not null,
		resident_id 	varchar2(14) 	not null,
		name 		varchar2(10) 	not null,
		year 		int,
		address 	varchar2(10),
		dept_id 	varchar2(10),
		constraint pk_student primary key(stu_id),
		constraint fk_student foreign key(dept_id) references ssu02.department(dept_id)
	);



	create table ssu02.professor
	(
		prof_id 		varchar2(10) 	not null,
		resident_id 	varchar2(14) 	not null,
		name 		varchar2(10) 	not null,
		dept_id 		varchar2(10),
		position 	varchar2(10),
		year_emp 	int,
		constraint pk_professor primary key(prof_id),
		constraint fk_professor foreign key(dept_id) references ssu02.department(dept_id)
	);


	#title size 28로 변경
	create table ssu02.course
	(
		course_id 	varchar2(10) 	not null,
		title 		varchar2(28) 	not null,
		credit 		int,
		constraint pk_course primary key(course_id)
	);



	create table ssu02.class
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
		constraint fk_class1 foreign key(course_id) references ssu02.course(course_id),
		constraint fk_class2 foreign key(prof_id) references ssu02.professor(prof_id)
	);



	create table ssu02.takes
	(
		stu_id 		varchar2(10) 	not null,
		class_id 	varchar2(10),
		grade 		char(5),
		constraint pk_takes primary key(stu_id, class_id),
		constraint fk_takes1 foreign key(stu_id) references ssu02.student(stu_id),
		constraint fk_takes2 foreign key(class_id) references ssu02.class(class_id)
	);



INSERT INTO SSU02.DEPARTMENT (DEPT_ID, DEPT_NAME, OFFICE) VALUES ('920', '컴퓨터공학과', '201호');
INSERT INTO SSU02.DEPARTMENT (DEPT_ID, DEPT_NAME, OFFICE) VALUES ('923', '산업공학과', '207호');
INSERT INTO SSU02.DEPARTMENT (DEPT_ID, DEPT_NAME, OFFICE) VALUES ('925', '전자공학과', '308호');

INSERT INTO SSU02.STUDENT (STU_ID, RESIDENT_ID, NAME, YEAR, ADDRESS, DEPT_ID) VALUES ('1292001', '900424-1825409', '김광식', 3, '서울', '920');
INSERT INTO SSU02.STUDENT (STU_ID, RESIDENT_ID, NAME, YEAR, ADDRESS, DEPT_ID) VALUES ('1292002', '900305-1730021', '김정현', 3, '서울', '920');
INSERT INTO SSU02.STUDENT (STU_ID, RESIDENT_ID, NAME, YEAR, ADDRESS, DEPT_ID) VALUES ('1292003', '891021-2308302', '김현정', 4, '대전', '920');
INSERT INTO SSU02.STUDENT (STU_ID, RESIDENT_ID, NAME, YEAR, ADDRESS, DEPT_ID) VALUES ('1292301', '890902-2704012', '김현정', 2, '대구', '923');
INSERT INTO SSU02.STUDENT (STU_ID, RESIDENT_ID, NAME, YEAR, ADDRESS, DEPT_ID) VALUES ('1292303', '910715-1524390', '박광수', 3, '광주', '923');
INSERT INTO SSU02.STUDENT (STU_ID, RESIDENT_ID, NAME, YEAR, ADDRESS, DEPT_ID) VALUES ('1292305', '921011-1809003', '김우주', 4, '부산', '923');
INSERT INTO SSU02.STUDENT (STU_ID, RESIDENT_ID, NAME, YEAR, ADDRESS, DEPT_ID) VALUES ('1292501', '900825-1506390', '박철수', 3, '대전', '925');
INSERT INTO SSU02.STUDENT (STU_ID, RESIDENT_ID, NAME, YEAR, ADDRESS, DEPT_ID) VALUES ('1292502', '911011-1809003', '백태성', 3, '서울', '925');

INSERT INTO SSU02.PROFESSOR (PROF_ID, RESIDENT_ID, NAME, DEPT_ID, POSITION, YEAR_EMP) VALUES ('92001', '590327-1839240', '이태규', '920', '교수', 1997);
INSERT INTO SSU02.PROFESSOR (PROF_ID, RESIDENT_ID, NAME, DEPT_ID, POSITION, YEAR_EMP) VALUES ('92002', '690702-1350026', '고희석', '920', '부교수', 2003);
INSERT INTO SSU02.PROFESSOR (PROF_ID, RESIDENT_ID, NAME, DEPT_ID, POSITION, YEAR_EMP) VALUES ('92301', '741011-2765501', '최성희', '923', '부교수', 2005);
INSERT INTO SSU02.PROFESSOR (PROF_ID, RESIDENT_ID, NAME, DEPT_ID, POSITION, YEAR_EMP) VALUES ('92302', '750728-1102458', '김태석', '923', '교수', 1999);
INSERT INTO SSU02.PROFESSOR (PROF_ID, RESIDENT_ID, NAME, DEPT_ID, POSITION, YEAR_EMP) VALUES ('92501', '620505-1200546', '박철재', '925', '조교수', 2007);
INSERT INTO SSU02.PROFESSOR (PROF_ID, RESIDENT_ID, NAME, DEPT_ID, POSITION, YEAR_EMP) VALUES ('92502', '740101-1830264', '장민석', '925', '부교수', 2005);

INSERT INTO SSU02.COURSE (COURSE_ID, TITLE, CREDIT) VALUES ('C101', '전산개론', 3);
INSERT INTO SSU02.COURSE (COURSE_ID, TITLE, CREDIT) VALUES ('C102', '자료구조', 3);
INSERT INTO SSU02.COURSE (COURSE_ID, TITLE, CREDIT) VALUES ('C103', '데이터베이스', 4);
INSERT INTO SSU02.COURSE (COURSE_ID, TITLE, CREDIT) VALUES ('C301', '운영체제', 3);
INSERT INTO SSU02.COURSE (COURSE_ID, TITLE, CREDIT) VALUES ('C302', '컴퓨터구조', 3);
INSERT INTO SSU02.COURSE (COURSE_ID, TITLE, CREDIT) VALUES ('C303', '이산수학', 4);
INSERT INTO SSU02.COURSE (COURSE_ID, TITLE, CREDIT) VALUES ('C304', '객체지향언어', 4);
INSERT INTO SSU02.COURSE (COURSE_ID, TITLE, CREDIT) VALUES ('C501', '인공지능', 3);
INSERT INTO SSU02.COURSE (COURSE_ID, TITLE, CREDIT) VALUES ('C502', '알고리즘', 2);


INSERT INTO SSU02.CLASS (CLASS_ID, COURSE_ID, YEAR, SEMESTER, DIVISION, PROF_ID, CLASSROOM, ENROLL) VALUES ('C101-01', 'C101', 2012, 1, 'A', '92301', '301호', 40);
INSERT INTO SSU02.CLASS (CLASS_ID, COURSE_ID, YEAR, SEMESTER, DIVISION, PROF_ID, CLASSROOM, ENROLL) VALUES ('C102-01', 'C102', 2012, 1, 'A', '92001', '209호', 30);
INSERT INTO SSU02.CLASS (CLASS_ID, COURSE_ID, YEAR, SEMESTER, DIVISION, PROF_ID, CLASSROOM, ENROLL) VALUES ('C103-01', 'C103', 2012, 1, 'A', '92501', '208호', 30);
INSERT INTO SSU02.CLASS (CLASS_ID, COURSE_ID, YEAR, SEMESTER, DIVISION, PROF_ID, CLASSROOM, ENROLL) VALUES ('C103-02', 'C103', 2012, 1, 'B', '92301', '301호', 30);
INSERT INTO SSU02.CLASS (CLASS_ID, COURSE_ID, YEAR, SEMESTER, DIVISION, PROF_ID, CLASSROOM, ENROLL) VALUES ('C501-01', 'C501', 2012, 1, 'A', '92501', '103호', 45);
INSERT INTO SSU02.CLASS (CLASS_ID, COURSE_ID, YEAR, SEMESTER, DIVISION, PROF_ID, CLASSROOM, ENROLL) VALUES ('C501-02', 'C501', 2012, 1, 'B', '92502', '204호', 25);
INSERT INTO SSU02.CLASS (CLASS_ID, COURSE_ID, YEAR, SEMESTER, DIVISION, PROF_ID, CLASSROOM, ENROLL) VALUES ('C301-01', 'C301', 2012, 2, 'A', '92502', '301호', 30);
INSERT INTO SSU02.CLASS (CLASS_ID, COURSE_ID, YEAR, SEMESTER, DIVISION, PROF_ID, CLASSROOM, ENROLL) VALUES ('C302-01', 'C302', 2012, 2, 'A', '92501', '209호', 45);
INSERT INTO SSU02.CLASS (CLASS_ID, COURSE_ID, YEAR, SEMESTER, DIVISION, PROF_ID, CLASSROOM, ENROLL) VALUES ('C502-01', 'C502', 2012, 2, 'A', '92001', '209호', 30);
INSERT INTO SSU02.CLASS (CLASS_ID, COURSE_ID, YEAR, SEMESTER, DIVISION, PROF_ID, CLASSROOM, ENROLL) VALUES ('C502-02', 'C502', 2012, 2, 'B', '92301', '103호', 26);

INSERT INTO SSU02.TAKES (STU_ID, CLASS_ID, GRADE) VALUES ('1292001', 'C101-01', 'B+   ');
INSERT INTO SSU02.TAKES (STU_ID, CLASS_ID, GRADE) VALUES ('1292001', 'C103-01', 'A+   ');
INSERT INTO SSU02.TAKES (STU_ID, CLASS_ID, GRADE) VALUES ('1292001', 'C301-01', 'A    ');
INSERT INTO SSU02.TAKES (STU_ID, CLASS_ID, GRADE) VALUES ('1292002', 'C102-01', 'A    ');
INSERT INTO SSU02.TAKES (STU_ID, CLASS_ID, GRADE) VALUES ('1292002', 'C103-01', 'B+   ');
INSERT INTO SSU02.TAKES (STU_ID, CLASS_ID, GRADE) VALUES ('1292002', 'C502-01', 'C+   ');
INSERT INTO SSU02.TAKES (STU_ID, CLASS_ID, GRADE) VALUES ('1292003', 'C103-02', 'B    ');
INSERT INTO SSU02.TAKES (STU_ID, CLASS_ID, GRADE) VALUES ('1292003', 'C501-02', 'A+   ');
INSERT INTO SSU02.TAKES (STU_ID, CLASS_ID, GRADE) VALUES ('1292301', 'C102-01', 'C+   ');
INSERT INTO SSU02.TAKES (STU_ID, CLASS_ID, GRADE) VALUES ('1292303', 'C102-01', 'C    ');
INSERT INTO SSU02.TAKES (STU_ID, CLASS_ID, GRADE) VALUES ('1292303', 'C103-02', 'B+   ');
INSERT INTO SSU02.TAKES (STU_ID, CLASS_ID, GRADE) VALUES ('1292303', 'C501-01', 'A+   ');
