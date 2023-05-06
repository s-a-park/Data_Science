create Table customer (
customer_id VARCHAR(20) , 
customer_name  VARCHAR(10), 
age INT , 
customer_class VARCHAR(20), 
customer_job  VARCHAR(20), 
customer_point INT, 
PRIMARY KEY(customer_id)
);

create Table product (
product_number CHAR(3),
product_name VARCHAR(20) , 
total_stock INT , 
unit_price INT, 
manufacturer VARCHAR(20) , 
PRIMARY KEY(product_name)
);

create Table customer_order (
order_number CHAR(3), 
customer VARCHAR(20) ,
order_product CHAR(4),
amount INT , 
address VARCHAR(30), 
order_date VARCHAR(20) , 
PRIMARY KEY(order_number)
);

Insert Into customer VALUES ('apple', '정소화', 20, 'gold', 'student', 1000);
Insert Into customer VALUES ('banana', '김선우', 25, 'vip', 'nurse', 2500);
Insert Into customer VALUES ('carrot', '고명석', 28, 'gold', 'teacher', 4500);
Insert Into customer VALUES ('orange', '김용욱', 22, 'silver', 'student', 0);
Insert Into customer VALUES ('melon', '성원용', 35, 'gold', 'worker', 5000);
Insert Into customer VALUES ('peach', '오형준', NULL, 'silver', 'doctor', 300);
Insert Into customer VALUES ('pear', '채광주', 31, 'silver', 'worker', 500);


Insert Into product VALUES ('p01', '그냥만두', 5000, 4500, '대한식품');
Insert Into product VALUES ('p02', '매운쫄면', 2500, 5500, '민국푸드');
Insert Into product VALUES ('p03', '쿵떡파이', 3600, 2600, '한빛제과');
Insert Into product VALUES ('p04', '맛난초콜릿', 1250, 2500, '한빛제과');
Insert Into product VALUES ('p05', '얼큰라면', 2200, 1200, '대한식품');
Insert Into product VALUES ('p06', '통통우동', 1000, 1550, '민국푸드');
Insert Into product VALUES ('p07', '달콤비스킷', 1650, 1500, '한빛제과');



Insert Into customer_order VALUES ('o01', 'apple', 'p03', 10, '서울시 마포구', '2022-01-01');
Insert Into customer_order VALUES ('o02', 'melon', 'p01', 5, '인천시 계양구', '2022-01-10');
Insert Into customer_order VALUES ('o03', 'banana', 'p06', 45, '경기도 부천시', '2022-01-11');
Insert Into customer_order VALUES ('o04', 'carrot', 'p02', 8, '부산시 금정구', '2022-02-01');
Insert Into customer_order VALUES ('o05', 'melon', 'p06', 36, '경기도 용인시', '2022-02-20');
Insert Into customer_order VALUES ('o06', 'banana', 'p01', 19, '충청북도 보은군', '2022-03-02');
Insert Into customer_order VALUES ('o07', 'apple', 'p03', 22, '서울시 영등포구', '2022-03-15');
Insert Into customer_order VALUES ('o08', 'pear', 'p02', 50, '강원도 춘천시', '2022-04-10');
Insert Into customer_order VALUES ('o09', 'banana', 'p04', 15, '전라남도 목포시', '2022-04-11');
Insert Into customer_order VALUES ('o10', 'carrot', 'p03', 20, '경기도 안양시', '2022-05-22');

SELECT * From customer;
SELECT * From product;
SELECT * From customer_order;

/*예제 7-37*/
SELECT product.product_name From product, customer_order
where customer_order.customer = 'banana' and  product.product_number = customer_order.order_number;

/*예제 7-38*/
SELECT customer_order.order_product, customer_order.order_date From customer, customer_order
where customer.age >=30 and customer.customer_id = customer_order.customer;

/*예제 7-39*/
SELECT p.product_name From product p, customer c, customer_order o
where c.customer_name = '고명석' and c.customer_id = o.customer and p.product_number = o.order_product;

/*예제 7-40*/
SELECT p.product_name, p.unit_price From product p
where p.manufacturer = (SELECT manufacturer From product where product_name = '달콤비스킷');

/*예제 7-41*/
SELECT c.customer_name, c.customer_point From customer c
where c.customer_point = (SELECT Max(customer_point) From customer);

/*예제 7-42*/
SELECT product_name, manufacturer From product
where product_number IN (SELECT order_product From customer_order where customer = 'banana');

/*예제 7-43*/
SELECT product_name, manufacturer From product
where product_number Not IN (SELECT order_product From customer_order where customer = 'banana');

/*예제 7-44*/
SELECT product_name, unit_price,manufacturer From product
where unit_price > ALL (SELECT unit_price From product where manufacturer = '대한식품');

/*예제 7-45*/
SELECT customer_name From customer
where customer_id = (SELECT customer From customer_order where order_date = '2022-03-15');

/*예제 7-46*/
SELECT customer_name From customer
where customer_id != (SELECT customer From customer_order where order_date = '2022-03-15');

/*예제 7-47*/
Insert into customer Values ('strawberry','최유경',30,'vip','공무원',100);
SELECT * From customer;

/*예제 7-48*/
Insert into customer Values ('tomato','정은심',36,'gold',Null,4000);
SELECT *FROM customer;

/*예제 7-49*/
Update product Set product_name='통큰파이' where product_number = 'p03';
SELECT * From product;

/*예제 7-50*/
Update product Set unit_price=unit_price*1.1 ;
SELECT unit_price FROM product;

/*예제 7-51*/
Update customer_order Set amount=5 where customer=(Select customer_id From customer where customer_name = '정소화');
SELECT* FROM customer_order;

/*예제 7-52*/
DELETE From customer_order where order_date = '2022-05-22';
SELECT * FROM customer_order;

/* 예제 7-53*/
DELETE From customer_order where customer = (SELECT customer_id From customer where customer_name = '정소화');
SELECT *From customer_order;

/* 예제 7-54*/
DELETE From customer_order;
SELECT * From customer_order;

/*예제 7-55*/
Create view best ( C_id, C_name, C_age, C_class)
as SELECT customer_id, customer_name, age, customer_class From customer where customer_class = 'vip';
SELECT * From best;

/*예제 7-56*/
Create View manu_amount (M_manu, M_amount) As
SELECT manufacturer, count(*) From product Group by manufacturer;
SELECT * From manu_amount;

/*예제 7-57*/
SELECT * From best where C_age >=20;

제품1 뷰 생성

Create view P_1 As Select product_number,total_stock,manufacturer From product;
SELECT * From P_1; 


/*예제 7-58*/
Insert into P_1 Values ('p08', 1000,'신선식품');
SELECT * From P_1;

/*예제 7-59*/
Drop view best; 