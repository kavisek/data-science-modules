-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates

SELECT DISTINCT CITY FROM STATION
WHERE (CITY LIKE '%a'
OR CITY LIKE '%o'
OR CITY LIKE '%e'
OR CITY LIKE '%i'
OR CITY LIKE '%u')

AND

(CITY LIKE 'a%'
OR CITY LIKE 'o%'
OR CITY LIKE 'e%'
OR CITY LIKE 'i%'
OR CITY LIKE 'u%')
