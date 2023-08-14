-- Let's try and replicate this detailed sales report using PostgreSQL!

-- Create an SQL report to calculate the number and total amount of sales for each half-hour interval within a given day. The report should include the percentage of sales for each interval compared to the total sales for the day.

-- Let's assume you have access to a PostgreSQL database with a sales table. The sales table has the following schema:

-- id (integer): A unique identifier for each record.
-- timestamp (timestamp): The date and time of the sale.
-- amount (decimal): The amount of the sale.
-- You need to write an SQL query that generates a report with the following columns for May 8, 2023 from 10:00 AM to 10:30 PM:

-- Time: The half-hour interval, formatted as 'HH12:MI AM'-'HH12:MI AM' (for example, '10:00 AM-10:30 AM').
-- Cnt: The number of sales within the interval.
-- Sales: The total amount of sales within the interval. The currency symbol should be a dollar sign ('$'). The formatting should be handled by PostgreSQL's money datatype.
-- %Sales: The percentage of sales within the interval compared to the total sales for the day. This should be calculated as (interval sales / total sales) * 100, and rounded to two decimal places.
-- Notes:

-- If a sale occurrs exactly at 10:30, it will be included in the "10:30AM-11:00AM" interval, not the "10:00AM-10:30AM" interval. This is a common way to handle such situations in time series analysis and ensures that every sale belongs to exactly one interval.
-- You should include all intervals from 10:00 AM to 10:30 PM, even if there are no sales within some intervals.
-- The sales data may include multiple sales with the same timestamp. Make sure your query correctly handles this situation.
-- Sales are only made during the operating hours of 10:00 AM - 10:30 PM. There are no sales during this day that are out of the boundaries.


-- select EXTRACT(HOUR FROM timestamp) as hour,
--  CASE WHEN EXTRACT(MINUTE FROM timestamp) < 30 THEN INTERVAL '0 minutes'
--              ELSE INTERVAL '30 minutes' END AS Time,
-- count(distinct id) as Cnt,
-- sum(amount)::money as Sales,
--  (sum(amount) * 100 / (Select sum(amount) From sales)) as "%Sales"
-- from sales
-- GROUP BY 1,2
-- order by 1,2

WITH TimeIntervals AS (
    SELECT
        generate_series(
            '2023-05-08 10:00:00'::timestamp,
            '2023-05-08 22:00:00'::timestamp,
            '30 minutes'::interval
        ) AS start_time,
        generate_series(
            '2023-05-08 10:30:00'::timestamp,
            '2023-05-08 22:30:00'::timestamp,
            '30 minutes'::interval
        ) AS end_time
),
IntervalSales AS (
    SELECT
        ti.start_time,
        ti.end_time,
        COUNT(s.id) AS cnt,
        SUM(case when s.amount IS NULL then 0 else s.amount end) AS sales,
        ( SUM(case when s.amount IS NULL then 0 else s.amount end) /  (Select sum(amount) From sales)) * 100 AS percent_sales
    FROM
        TimeIntervals ti
    LEFT JOIN
        sales s ON s.timestamp >= ti.start_time AND s.timestamp < ti.end_time
--     CROSS JOIN
--         (SELECT COALESCE(SUM(amount), 0) AS total_day_sales FROM sales WHERE timestamp >= '2023-05-08 10:00:00' AND timestamp < '2023-05-09 10:00:00') AS total
--
  GROUP BY
        ti.start_time, ti.end_time
--   , total_day_sales
)
SELECT
    TO_CHAR(start_time, 'HH12:MI AM') || '-' || TO_CHAR(end_time, 'HH12:MI AM') AS "Time",
    cnt AS "Cnt",
    (sales::money) AS "Sales",
    ROUND(percent_sales, 2) AS "%Sales"
FROM
    IntervalSales
ORDER BY
    start_time;
