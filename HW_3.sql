create table staff
(
id int primary key auto_increment,
firstname varchar(45) not null,
lastname varchar(45) not null,
post varchar(45) not null,
seniority int default 0,
salary int default 0,
age int default 0
);

insert into staff (firstname, lastname, post, seniority, salary, age)
values
('Вася', 'Петров', 'Начальник', 40, 100000, 60),
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Санин', 'Инженер', 12,  50000, 35),
('Иван', 'Иванов', 'Рабочий', 40,  30000, 59),
('Петр', 'Петров', 'Рабочий', 20,  25000, 40),
('Сидр', 'Сидоров', 'Рабочий', 10,  20000, 35),
('Антон', 'Антонов', 'Рабочий', 8,  19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5,  15000, 25),
('Максим', 'Максимов', 'Рабочий', 2,  11000, 22),
('Юрий', 'Галкин', 'Рабочий', 3,  12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10,  10000, 49);

select * from staff
order by salary desc;

select * from staff
order by salary;

select salary from staff
order by salary desc
limit 5;

select post, sum(salary) from staff
group by post;

select count(*) from staff
where age between 24 and 49
and post='Рабочий';

select count(distinct post) from staff;

select post from staff
group by post
having avg(age)<30;
