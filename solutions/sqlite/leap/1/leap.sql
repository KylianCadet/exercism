-- Schema: CREATE TABLE "leap" ( "year" INT, "is_leap" BOOL);
-- Task: update the leap table and set the is_leap based on the year field.

update leap
    set is_leap = year % 4 == 0 and (not (year % 100 == 0) or year % 400 == 0)