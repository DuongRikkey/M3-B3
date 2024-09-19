create database s3b1;
use s3b1;
create table if not exists color(
id int primary key auto_increment,
name varchar(100),
status bit
);
create table if not exists product(
id int primary key auto_increment,
name varchar(100),
created date
);
create table if not exists size(
id int primary key auto_increment,
name varchar(100),
status bit
);
create table if not exists product_detail(
id int primary key auto_increment,
product_id int,
constraint lk_01 foreign key(product_id)references product(id),
size_id int,
constraint lk_02 foreign key(size_id) references size(id),
color_id int, 
constraint lk_03 foreign key(color_id) references color(id)
);
insert into Color(name,status) values('Red',1),('Blue',1),('Green',1);
x