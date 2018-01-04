SELEC id, username, (total-point - spend_point) AS POINT
FROM users;
ORDER BY point DESC
LIMIT 50
INTO OUTFILE '/tmp/bbs_points_top50.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
;