use db_phones;

create table phones
(
id int primary key auto_increment,
phone_name varchar(30) not null unique,
manufacturer varchar(30) not null,
item_count int default 0,
price decimal
);

insert into phones (phone_name, manufacturer, item_count, price)
values
('POCO F5', 'Xiaomi', 32, 32500),
('RedmiNote9', 'Xiaomi', 10, 10200),
('iPhone 14', 'Apple', 5, 102000),
('iPhone 12', 'Apple', 1, 45000),
('iPhone 11', 'Apple', 15, 32000),
('Galaxy S10', 'Samsung', 2, 74000),
('Honor 11', 'Huawei', 12, 9500);

select phone_name, manufacturer, price from phones
where item_count > 2;

select * from phones
where  manufacturer = 'Samsung';

select * from phones
where  manufacturer = 'Samsung';

select * from phones
where phone_name REGEXP 'iPhone';

select * from phones
where manufacturer REGEXP 'Samsung';

select * from phones
where phone_name REGEXP '[0-9]';

select * from phones
where phone_name REGEXP '5';

select * from phones;
