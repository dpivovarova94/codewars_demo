-- Given the schema presented below write a query, which uses a window function, that returns two most viewed posts for every category.

-- Order the result set by:

-- category name alphabetically
-- number of post views largest to lowest
-- post id lowest to largest
-- Note:
-- Some categories may have less than two or no posts at all.
-- Two or more posts within the category can be tied by (have the same) the number of views. Use post id as a tie breaker - a post with a lower id gets a higher rank.

WITH prep_table AS (
    SELECT
        c.id AS category_id,
        c.category,
        p.title,
        p.views,
        p.id AS post_id
    FROM
        categories c
    LEFT JOIN
        posts p ON p.category_id = c.id
),

second_table AS (
    SELECT
        category_id,
        category,
        title,
        views,
        post_id,
        RANK() OVER (PARTITION BY category ORDER BY views DESC, post_id) AS rank
    FROM
        prep_table
)

SELECT
    category_id,
    category,
    title,
    views,
    post_id
FROM
    second_table
WHERE
    rank <= 2
ORDER BY
    category,
    views DESC,
    post_id;
