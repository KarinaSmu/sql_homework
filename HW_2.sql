use db_phones;

create table sales
(
id int primary key auto_increment,
order_date date not null unique,
item_count int default 0
);

insert into sales (order_date, item_count)
values
('2022-01-01', 341),
('2022-01-02', 156),
('2022-01-03', 180),
('2022-01-04', 21),
('2022-01-05', 124);

select id,
case
	when item_count < 100 
    then 'Маленький заказ'
    when item_count >= 100 and item_count < 300
    then 'Средний заказ'
    when item_count >= 300 
    then 'Большой заказ'
end as oreder_type
from sales;

create table orders
(
id int primary key auto_increment,
employee_id VARCHAR(8) not null,
amount double default 0,
order_status varchar(16) not null
);

insert into orders (employee_id, amount, order_status)
values
('e03',15.00, 'OPEN'),
('e01',25.50, 'OPEN'),
('e05',100.70, 'CLOSED'),
('e02',22.18, 'OPEN'),
('e04',9.50, 'CANCELLED');
select *from orders;

select *,
if(order_status ='OPEN', 'Order is in open state',
	if(order_status ='CLOSED', 'Order is closed', 'Order is cancelled'))
as full_oreder_status
from orders;

