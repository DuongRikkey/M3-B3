create database s3b2;
use s3b2;
create table if not exists customers(
cid int primary key auto_increment,
cName varchar(255),
cAge int
);
create table if not exists orders(
old int primary key auto_increment,
cid int, 
constraint lk_01 foreign key(cid) references customers(cid)
);
alter table orders
add column oDate datetime,
add column oTotalPrice double;
create table if not exists products(
pid int primary key auto_increment,
pName varchar(255),
pPrice double
);
create table if not exists orderDetail(
old int,
constraint lk_02 foreign key(old) references orders(old),
pid int,
constraint lk_03 foreign key(pid) references products(pid),
odQuantity int
);
insert into customers(cName,cAge) values('Minh Quan',10),('NgocOaNH',20),('Hong Ha',50);
INSERT INTO orders (cid, oDate, oTotalPrice) 
VALUES 
(1, STR_TO_DATE('3/21/2006', '%m/%d/%Y'), 150000),
(2, STR_TO_DATE('3/23/2006', '%m/%d/%Y'), 200000),
(1, STR_TO_DATE('3/16/2006', '%m/%d/%Y'), 17000);
insert into products(pName,pPrice)value('MayGiat',300),('Tulanh',500),('Dieuhoa',700),('Quat',100),
('Bep dien',200),('May hut khi',500);
insert into orderDetail(old,pid,odQuantity)values(1,1,3),(1,4,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,4);
select old,oDate,oTotalPrice from Orders;
select c.*,p.pName,p.pPrice,od.odQuantity from customers as c inner join orders as o on c.cid=o.cid inner join orderDetail as od on o.old=od.old
inner join products as p on od.pid=p.pid where c.cid=o.cid;
select* from customers;
select c.* from customers as c left join orders as o on c.cid=o.cid where o.cid is null;
SELECT o.old, o.oDate, SUM(od.odQuantity * p.pPrice) AS totalPrice  
FROM orders AS o 
INNER JOIN orderDetail AS od ON o.old = od.old 
INNER JOIN products AS p ON od.pid = p.pid 
GROUP BY o.old, o.oDate;
