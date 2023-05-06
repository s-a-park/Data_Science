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

Insert Into customer VALUES ('apple', '����ȭ', 20, 'gold', 'student', 1000);
Insert Into customer VALUES ('banana', '�輱��', 25, 'vip', 'nurse', 2500);
Insert Into customer VALUES ('carrot', '���', 28, 'gold', 'teacher', 4500);
Insert Into customer VALUES ('orange', '����', 22, 'silver', 'student', 0);
Insert Into customer VALUES ('melon', '������', 35, 'gold', 'worker', 5000);
Insert Into customer VALUES ('peach', '������', NULL, 'silver', 'doctor', 300);
Insert Into customer VALUES ('pear', 'ä����', 31, 'silver', 'worker', 500);


Insert Into product VALUES ('p01', '�׳ɸ���', 5000, 4500, '���ѽ�ǰ');
Insert Into product VALUES ('p02', '�ſ��̸�', 2500, 5500, '�α�Ǫ��');
Insert Into product VALUES ('p03', '��������', 3600, 2600, '�Ѻ�����');
Insert Into product VALUES ('p04', '�������ݸ�', 1250, 2500, '�Ѻ�����');
Insert Into product VALUES ('p05', '��ū���', 2200, 1200, '���ѽ�ǰ');
Insert Into product VALUES ('p06', '����쵿', 1000, 1550, '�α�Ǫ��');
Insert Into product VALUES ('p07', '���޺�Ŷ', 1650, 1500, '�Ѻ�����');



Insert Into customer_order VALUES ('o01', 'apple', 'p03', 10, '����� ������', '2022-01-01');
Insert Into customer_order VALUES ('o02', 'melon', 'p01', 5, '��õ�� ��籸', '2022-01-10');
Insert Into customer_order VALUES ('o03', 'banana', 'p06', 45, '��⵵ ��õ��', '2022-01-11');
Insert Into customer_order VALUES ('o04', 'carrot', 'p02', 8, '�λ�� ������', '2022-02-01');
Insert Into customer_order VALUES ('o05', 'melon', 'p06', 36, '��⵵ ���ν�', '2022-02-20');
Insert Into customer_order VALUES ('o06', 'banana', 'p01', 19, '��û�ϵ� ������', '2022-03-02');
Insert Into customer_order VALUES ('o07', 'apple', 'p03', 22, '����� ��������', '2022-03-15');
Insert Into customer_order VALUES ('o08', 'pear', 'p02', 50, '������ ��õ��', '2022-04-10');
Insert Into customer_order VALUES ('o09', 'banana', 'p04', 15, '���󳲵� ������', '2022-04-11');
Insert Into customer_order VALUES ('o10', 'carrot', 'p03', 20, '��⵵ �Ⱦ��', '2022-05-22');

SELECT * From customer;
SELECT * From product;
SELECT * From customer_order;

/*���� 7-37*/
SELECT product.product_name From product, customer_order
where customer_order.customer = 'banana' and  product.product_number = customer_order.order_number;

/*���� 7-38*/
SELECT customer_order.order_product, customer_order.order_date From customer, customer_order
where customer.age >=30 and customer.customer_id = customer_order.customer;

/*���� 7-39*/
SELECT p.product_name From product p, customer c, customer_order o
where c.customer_name = '���' and c.customer_id = o.customer and p.product_number = o.order_product;

/*���� 7-40*/
SELECT p.product_name, p.unit_price From product p
where p.manufacturer = (SELECT manufacturer From product where product_name = '���޺�Ŷ');

/*���� 7-41*/
SELECT c.customer_name, c.customer_point From customer c
where c.customer_point = (SELECT Max(customer_point) From customer);

/*���� 7-42*/
SELECT product_name, manufacturer From product
where product_number IN (SELECT order_product From customer_order where customer = 'banana');

/*���� 7-43*/
SELECT product_name, manufacturer From product
where product_number Not IN (SELECT order_product From customer_order where customer = 'banana');

/*���� 7-44*/
SELECT product_name, unit_price,manufacturer From product
where unit_price > ALL (SELECT unit_price From product where manufacturer = '���ѽ�ǰ');

/*���� 7-45*/
SELECT customer_name From customer
where customer_id = (SELECT customer From customer_order where order_date = '2022-03-15');

/*���� 7-46*/
SELECT customer_name From customer
where customer_id != (SELECT customer From customer_order where order_date = '2022-03-15');

/*���� 7-47*/
Insert into customer Values ('strawberry','������',30,'vip','������',100);
SELECT * From customer;

/*���� 7-48*/
Insert into customer Values ('tomato','������',36,'gold',Null,4000);
SELECT *FROM customer;

/*���� 7-49*/
Update product Set product_name='��ū����' where product_number = 'p03';
SELECT * From product;

/*���� 7-50*/
Update product Set unit_price=unit_price*1.1 ;
SELECT unit_price FROM product;

/*���� 7-51*/
Update customer_order Set amount=5 where customer=(Select customer_id From customer where customer_name = '����ȭ');
SELECT* FROM customer_order;

/*���� 7-52*/
DELETE From customer_order where order_date = '2022-05-22';
SELECT * FROM customer_order;

/* ���� 7-53*/
DELETE From customer_order where customer = (SELECT customer_id From customer where customer_name = '����ȭ');
SELECT *From customer_order;

/* ���� 7-54*/
DELETE From customer_order;
SELECT * From customer_order;

/*���� 7-55*/
Create view best ( C_id, C_name, C_age, C_class)
as SELECT customer_id, customer_name, age, customer_class From customer where customer_class = 'vip';
SELECT * From best;

/*���� 7-56*/
Create View manu_amount (M_manu, M_amount) As
SELECT manufacturer, count(*) From product Group by manufacturer;
SELECT * From manu_amount;

/*���� 7-57*/
SELECT * From best where C_age >=20;

��ǰ1 �� ����

Create view P_1 As Select product_number,total_stock,manufacturer From product;
SELECT * From P_1; 


/*���� 7-58*/
Insert into P_1 Values ('p08', 1000,'�ż���ǰ');
SELECT * From P_1;

/*���� 7-59*/
Drop view best; 