-- P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

SELECT REPEAT('* ', @NUMBER := @NUMBER + 1) FROM information_schema.tables, (SELECT @NUMBER:=1) t LIMIT 20
