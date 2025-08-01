-- Schema: CREATE TABLE "darts" ("x" REAL, "y" REAL, score INTEGER);
-- Task: update the darts table and set the score based on the x and y values.

with darts_with_distance as (
    select x, y, sqrt(power(x, 2) + power(y, 2)) as distance
    from darts
), darts_with_score as (
    select x, y,
    (case 
     when distance > 10 then 0
     when distance > 5 then 1
     when distance > 1 then 5
     else 10
    end) as score
    from darts_with_distance
)
update darts
set score = darts_with_score.score
from darts_with_score
where darts.x = darts_with_score.x
and darts.y = darts_with_score.y
