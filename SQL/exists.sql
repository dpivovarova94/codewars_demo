-- For this challenge you need to create a SELECT statement that will contain data about departments that had a sale with a price over 98.00 dollars. This SELECT statement will have to use an EXISTS to achieve the task.

-- departments table schema
-- id
-- name
-- sales table schema
-- id
-- department_id (department foreign key)
-- name
-- price
-- card_name
-- card_number
-- transaction_date
-- resultant table schema
-- id
-- name
-- Create your SELECT statement here

-- with table1 as (
-- select d.id,
-- d.name,
-- sum(price) as price

-- from departments d
-- left join sales s on d.id = s.department_id
-- group by 1,2)

-- select id, name
-- from table1
-- where price >= 98
-- With EXISTS

SELECT d.id, d.name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM sales s
    WHERE s.department_id = d.id
    AND s.price > 98
);
