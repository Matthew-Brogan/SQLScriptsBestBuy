-- find all products--
select * from products;

-- products where price is 1400--
select * from products 
where price = 1400;

-- prices either 11.99 or 13.99
select * from products
where price = 11.99 or price = 13.99;

-- where products price doesnt equal 11.99
select * from products
where not price = 11.99;

-- order by price, high to low
select * from products
order by price desc;

-- employees with no middle initial
select * from employees
where MiddleInitial is null or MiddleInitial = '';

-- employees with first name starts with j
select * from employees 
where FirstName like 'j%';

-- distinct prices
select distinct price from products;

-- select macbook
select * from products
where Name like 'Macbook%';

-- product on sale
select * from products
where OnSale = 1;

-- avg price of all products
select avg(price) from products;

-- geek squad employees without MiddleInit
select * from employees
where MiddleInitial is null and Title like '%Geek%';

-- prices between 500 and 1200
select * from products
where price between 500 and 1200;

-- join computers name and category





