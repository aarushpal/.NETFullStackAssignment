create database ShoppingCartDb;
use ShoppingCartDb
create table users (
	userId INT PRIMARY KEY, 
	userName VARCHAR(50),
	password VARCHAR(9),	
	contactNumber VARCHAR(12),	
	city VARCHAR(50)
);




create table products (
	productId INT,
	productName VARCHAR(50) not null,
	quantityInStock int not null,	
	unitPrice int not null,	
	category VARCHAR(50) not null,
	constraint productId_pk_constraint primary key (productId),
	constraint quantityInStock_range_constraint check (quantityInStock > 0),
	constraint unitPrice_range_constraint check (unitPrice > 0)
);

drop table products;

create table cart (
	id int ,
	cartId INT not null,
	productId int,
	quantity int not null,
	constraint cartId_pk_constraint primary key (id),
	constraint productId_fk_constraint foreign key (productId) references products(productId) on delete cascade on update cascade,
	constraint quantity_range_constraint check (quantity > 0)
);

drop table cart

INSERT INTO users VALUES(1,'Aarush','12345678','9045682212','Delhi');
INSERT INTO users VALUES(2,'Skandha','wqeqweqw','8844839233','Dallas');
INSERT INTO users VALUES(3,'Praneetha','3243dfasd','7843275401','Pune');
INSERT INTO users VALUES(4,'Harshita','213421ds','7533331234','Mumbai');
INSERT INTO users VALUES(5,'Yamuna','dsfgds2','8443322889','Bangalore');

insert into products values(101, 'Banana', 10,5 ,'Fruits')
insert into products values(102, 'Apple', 12,50 ,'Fruits')
insert into products values(103, 'Tomato', 12,45 ,'Vegetables')
insert into products values(104, 'IPhone', 1,50000 ,'Technology')
insert into products values(105, 'Laptop', 2,55000 ,'Technology')

insert into cart values(1,201,101, 2)
insert into cart values(2,202,102, 1)
insert into cart values(3,203,102, 1)
insert into cart values(4,204,104, 1)
insert into cart values(5,205,105, 2)

--Display all products
select * from products

--Display products belong to particular category
select * from products where category = 'Technology'

--Display out of stock products (means quantity is zero)

--Display the products which price between 1000 to 10000
select * from products where unitPrice >= 1000 and unitPrice <= 10000

--Display the product details based on the ProductId
select * from products where productId = 104


--b. Display data based on the given CartId
select * from cart where cartId = 202

--Check is there any products added in Cart based on the ProductId
select * from cart as c join products as p on c.productId = p.productId

--c. Display All users 
select * from users;

--Display user details based on ContactNumber
select * from users where contactNumber = '9045682212'

--Display user details based on UserId
select * from users where userId = 2;

--ASSIGNMENT 2
--2.1 b. Write a Query to display the results from the above two tables:
			--CartId,  ProductName, Quantity, UnitPrice
			
		--Hint :  Quantity should takes from Cart table
select c.cartId, p.productName, c.quantity, p.unitPrice from cart as c join products as p on c.productId = p.productId

--2.2 

--  Create a table Called "Student"  table with the following columns:
						--	StudentId,  StudentName,  CourseName,  City Name, 

create table Student (
	studentId int primary key,
	studentName varchar(50),
	courseName varchar(50),
	cityName varchar(50),
	contactNumber varchar(12),
)

drop table Student

create table course (
	courseId int primary key,
	courseName varchar(50)
)

drop table course

insert into course values (1, 'Angular')
insert into course values (2, 'React')
insert into course values (3, '.NET')
insert into course values (4, 'JavaScript')
insert into course values (5, 'HTML')

insert into student values (1, 'Aarush', 'Angular', 'Delhi', '9045682212')
insert into student values (2, 'Aryan', 'React', 'Mumbai', '90456832212')
insert into student values (3, 'Dhanush', '.NET', 'Bangalore', '6045682212')
insert into student values (4, 'Gian', 'JavaScript', 'Hyderabad', '9045684212')
insert into student values (5, 'Praneetha', 'React', 'Bangalore', '7045682212')
insert into student values (6, 'Yamuna', '.NET', 'Mumbai', '9045682213')
insert into student values (7, 'Harshita', 'JavaScript', 'Pune', '9045682214')
insert into student values (8, 'Manoj', 'React', 'Delhi', '9045682215')
insert into student values (9, 'Jason', 'React', 'Mumbai', '9045682202')
insert into student values (10, 'Christina', 'JavaScript', 'Lucknow', '6045682212')

select * from student
select * from course

select * from student s join course c on s.courseId = c.courseId

--Find out how many Students are joined for "Angular"  Course
select count(*) from student where courseName = 'Angular'

--Find out how many Students are joined from  "Hyderabad"  City
select count(*) from student where cityName = 'Hyderabad'

--Display No. of Students are join from each  City based 
select count(*) as noOfStudents, cityName from student group by cityName

--Display No. of Students are join from each  Course  based 
select count(*) as noOfStudents, courseName from student group by courseName

--Display the counts  by grouping based on  city, course 
select count(*) as noOfStudents, courseName, cityName from student group by courseName, cityName order by courseName

--Prepare the sql queries for the following requirements (use subqueries):
--a. Display the products if any items exists in the cart table
select * from products where exists (select * from cart)

--b.Display the cart items whoe product price greater than 5000
select * from cart where productId in (select productId from products where unitPrice > 5000)