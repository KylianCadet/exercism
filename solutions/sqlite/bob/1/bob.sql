-- Schema: CREATE TABLE "bob" ("input" TEXT, "reply" TEXT);
-- Task: update the bob table and set the reply based on the input.

update bob set reply = 'Sure.' where input regexp '\?\s*$';
update bob set reply = 'Whoa, chill out!' where input regexp '[A-Z]' and input regexp '^[^a-z]+$';
update bob set reply = 'Calm down, I know what I''m doing!' where input regexp '[A-Z]' and input regexp '^[^a-z]+$' and input regexp '\?$';
update bob set reply = 'Fine. Be that way!' where input regexp '^(\s+)?$';
update bob set reply = 'Whatever.' where reply = '';
