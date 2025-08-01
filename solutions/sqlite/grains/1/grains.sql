-- Schema: CREATE TABLE "grains" ("task" TEXT, "square" INT, "result" INT);
-- Task: update the grains table and set the result based on the task (and square fields).


update grains
    set result = case task
        when 'single-square' then power(2, square  - 1)
        when 'total' then power(2, 64)
        else null
    end