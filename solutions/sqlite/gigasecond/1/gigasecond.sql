-- Schema: CREATE TABLE "gigasecond" ("moment" TEXT, "result" TEXT);
-- Task: update the gigasecond table and set the result based on the moment.


update gigasecond
set
    result = strftime('%Y-%m-%dT%H:%M:%S', datetime(strftime('%s', moment) + power(10, 9), 'unixepoch'))
