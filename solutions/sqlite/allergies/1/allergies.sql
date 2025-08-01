-- Schema: CREATE TABLE "allergies" ("task" TEXT, "item" TEXT, "score" INT NOT NULL, "result" TEXT);
-- Task: update the bob allergies and set the result based on the task.
--       - The `allergicTo` task expects `true` or `false` based on the `score` and the `item` fields.
--       - For the `list` task you have to write corresponding items to the result field

create table allergens (item text not null, value int not null);
insert into allergens (item, value) values
('eggs', 1),
('peanuts', 2),
('shellfish', 4),
('strawberries', 8),
('tomatoes', 16),
('chocolate', 32),
('pollen', 64),
('cats', 128);


update allergies
set
    result = case task
    when 'allergicTo' then (
            case score & (select value from allergens where allergens.item = allergies.item)
            when 0 then 'false'
            else 'true'
            end
    )
    when 'list' then (
        select coalesce(group_concat(item, ', '), '') from allergens where score & value != 0
    )
    end
