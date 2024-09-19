create database s3b5;
use s3b5;
CREATE TABLE account (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100),
    password VARCHAR(255),
    address VARCHAR(255),
    status BIT
);
CREATE TABLE product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    created DATE,
    price DOUBLE,
    stock INT,
    status BIT
);
CREATE TABLE bill (
    id INT PRIMARY KEY AUTO_INCREMENT,
    bill_type BIT,  -- 0: Nhập, 1: Xuất
    acc_id INT,
    created DATETIME,
    auth_date DATETIME,
    FOREIGN KEY (acc_id) REFERENCES account(id)
);
CREATE TABLE bill_detail (
    id INT PRIMARY KEY AUTO_INCREMENT,
    bill_id INT,
    product_id INT,
    quantity INT,
    price DOUBLE,
    FOREIGN KEY (bill_id) REFERENCES bill(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

INSERT INTO account (id, username, password, address, status)
VALUES 
(1, 'Hùng', '123456', 'Nghệ An', TRUE),
(2, 'Cường', '654321', 'Hà Nội', TRUE),
(3, 'Bách', '135790', 'Hà Nội', TRUE);
INSERT INTO bill (id, bill_type, acc_id, created, auth_date)
VALUES
(1, 0, 1, '2022-02-11', '2022-03-12'),
(2, 0, 1, '2023-10-05', '2023-10-10'),
(3, 1, 2, '2024-05-15', '2024-05-20');

INSERT INTO product (id, name, created, price, stock, status)
VALUES
(1, 'Quần dài', '2022-03-12', 1200, 5, True),
(2, 'Áo dài', '2023-03-15', 1500, 8, True),
(3, 'Mũ cối', '1999-03-08', 1600, 10, True);
INSERT INTO bill_detail (id, bill_id, product_id, quantity, price)
VALUES
(1, 1, 1, 3, 1200),
(2, 1, 2, 4, 1500),
(3, 2, 1, 1, 1200),
(4, 3, 2, 4, 1500),
(5, 4, 3, 7, 1600);


select a.* from account as a
order by a.username desc;

select bd.* from bill_detail as bd
order by bd.bill_id;

select b.* from bill as b
where b.created between '2022-02-11' and '2023-05-15';

select p.* from product as p
where p.status=1