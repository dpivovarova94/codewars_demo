-- You have been provided with a PostgreSQL table named users. This table includes a jsonb column, info, which holds JSON data. Here is a simplified schema of the table:

-- id: primary key, integer.
-- info: JSON column which includes:
-- name: a string (user's name).
-- pets: an array of JSON objects (each object represents a pet and has a name field and type field).
-- In this task, you need to extract and analyze the initial letters of the pet names to find the most popular ones. The query should return a list of the initial letters, the count of pets starting with each letter, and the names of the users who own pets whose names start with each letter.

-- However, there are additional conditions to consider:

-- Each user should only be listed once per initial letter in the aggregation. If a user owns multiple pets with names starting with the same letter, each of these pets should be included in the pet_count.
-- When listing user names, they should be presented as a comma-separated string, ordered by the user's ID in ascending order.
-- The results should be sorted by the count of pets in descending order, and for equal counts, by the initial letter in ascending alphabetical order.
-- The output of your query should be a table with three columns:

-- first_letter: The initial letter of pet names.
-- pet_count: The count of pets whose names start with first_letter.
-- user_names: A comma-separated list of names of users who own pets whose names start with first_letter, ordered by user's ID in ascending order.

with first_table as
(
  SELECT
  u.id as user_id,
  u.info->>'name' AS user_name,
  pet->>'name' AS pet_name,
  left(pet->>'name', 1)  AS first_letter,
  pet->>'type' AS pet_type
FROM
  users u,
  jsonb_array_elements(u.info->'pets') AS pet
),

second_table as (

  select first_letter,
  user_name,
  user_id,
  count(pet_name) as pet_count
  from first_table
  group by 1,2, 3
  order by user_id)

  select first_letter,
  count(pet_count) as pet_count,
  string_agg(second_table.user_name, ', ') as user_names
  from second_table
  group by 1
  order by 2 desc, first_letter
