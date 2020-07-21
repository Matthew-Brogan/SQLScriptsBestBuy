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

-- stockLevel between 500 and 1200
select * from products
where StockLevel between 500 and 1200
order by price asc, StockLevel desc;

-- join computers name and category


-- inner
Select SalesID, sales.ProductID, quantity, products.ProductID, name, CategoryID from sales
inner join products
on sales.ProductID = products.ProductID;

-- left join
Select SalesID, sales.ProductID as 'sales prod id', quantity, products.ProductID, name, CategoryID from sales
left join products
on sales.ProductID = products.ProductID;

-- right join
Select SalesID, sales.ProductID as 'sales prod id', 
quantity, products.ProductID, name, CategoryID from sales
right join products
on sales.ProductID = products.ProductID;

-- join task 1 select all computers and join computers with category to display prod name and cat name
select products.Name,categories.Name from products 
inner join categories
on products.CategoryID = categories.CategoryID
where categories.Name = 'Computers';

-- joins task 2 fin prod name, price, rating where rating is 5
select products.Name, products.Price, reviews.Rating from products
inner join reviews
on products.ProductID = reviews.ProductID
where reviews.Rating = 5; 

-- joins task 3 find employee with the most total quantity sold, use sum() and group by
select employees.FirstName, sum(sales.Quantity) as total from employees
inner join sales
on sales.EmployeeID = employees.EmployeeID
group by employees.EmployeeID
order by total  desc;

-- find department name and category name for games and appliance
select departments.Name , categories.Name from departments
inner join categories
on departments.DepartmentID = categories.DepartmentID
where categories.Name = 'Appliances' or categories.Name = 'Games';

-- joins: find the product name, total # sold, and total price sold,for Eagles: Hotel California --You may need to use SUM()

select products.Name, sum(sales.Quantity), sum(sales.Quantity * sales.PricePerUnit) from products
inner join sales
on products.ProductID = sales.ProductID
where products.Name like '%Hotel california%';

-- --joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!)
select products.name , reviews.reviewer, reviews.rating, reviews.comment from products
inner join reviews
on products.ProductID = reviews.ProductID
where reviews.rating =1 and products.Name = 'Visio TV';

/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, sum(sales.Quantity) as total from sales
inner join employees
on sales.EmployeeID = employees.EmployeeID
inner join products
on products.productID = sales.ProductID
group by employees.EmployeeID, products.ProductID
order by total desc;












