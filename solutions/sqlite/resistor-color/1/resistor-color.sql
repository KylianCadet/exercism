-- CREATE TABLE "color_code" ("color" TEXT, "result" INT);
-- Task: update the color_code table and set the result based on the color.

update color_code
set result = case color
    when 'black' then 0
    when 'brown' then 1
    when 'red' then 2
    when 'orange' then 3
    when 'yellow' then 4
    when 'green' then 5
    when 'blue' then 6
    when 'violet' then 7
    when 'grey' then 8
    when 'white' then 9
    else null
end