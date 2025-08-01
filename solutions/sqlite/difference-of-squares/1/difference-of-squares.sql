-- Schema: CREATE TABLE "difference-of-squares" ("number" INT", property" TEXT, "result" INT);
-- Task: update the difference-of-squares table and set the result based on the number and property fields.

with recursive cnt(x) as (
    select 1
    union all
    select x+1 from cnt limit 100
)
update
    "difference-of-squares"
set result = case property
    when 'squareOfSum' then (select power(sum(x), 2) from cnt where x <= number)
    when 'sumOfSquares' then (select sum(power(x, 2)) from cnt where x <= number)
    when 'differenceOfSquares' then (select power(sum(x), 2) from cnt where x <= number) - (select sum(power(x, 2)) from cnt where x <= number)
    else null
end