-- Schema: CREATE TABLE "raindrops" ("number" INT, "sound" TEXT);
-- Task: update the raindrops table and set the sound based on the number.

update raindrops
    set sound =
        coalesce(nullif(
            (case when number % 3 == 0 then 'Pling' else '' end) ||
            (case when number % 5 == 0 then 'Plang' else '' end) ||
            (case when number % 7 == 0 then 'Plong' else '' end),
            ''
        ), number)
