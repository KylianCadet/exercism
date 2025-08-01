-- Schema: CREATE TABLE "eliuds-eggs" ("number" INT, "result" INT);
-- Task: update the eliuds-eggs table and set the result based on the number field.

create table powers (number int);
with recursive cnt(x) as (
    select 0
    union all
    select x+1 from cnt limit 50
)
insert into powers (number) select power(2, x) from cnt;


update "eliuds-eggs"
set result = (
    select sum((case eg.number & powers.number when 0 then 0 else 1 end))
    from "eliuds-eggs" eg
    left join powers on 1=1
    where eg.number = "eliuds-eggs".number
    group by eg.number
)

