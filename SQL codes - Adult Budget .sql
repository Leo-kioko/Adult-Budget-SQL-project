SELECT * FROM adult.adult_improved;

SELECT round(avg(age),2)
AS Average_age
FROM adult.adult_improved
where income>50000;

SELECT count(*) AS Private_sector_count
FROM adult.adult_improved
WHERE employment_type = "Private";

SELECT education,
COUNT(*) AS individuals
from adult.adult_improved
where income > 50000
group by education
order by individuals DESC;

SELECT avg(work_hours) 
AS average_work_hours
FROM adult.adult_improved
WHERE income >50000;

SELECT marital_status,
count(*) as all_peeps
from adult.adult_improved
where income<50000
group by marital_status;

SELECT work_class,
count(*) AS individuals
from adult.adult_improved
where income>50000
group by work_class
order by individuals desc;

SELECT race,
count(*) as individuals
from adult.adult_improved
group by race;

SELECT gender,
(count(*) * 100.0/ (SELECT count(*) from adult.adult_improved 
where income >50000))as proportion
from adult.adult_improved
where income >50000
group by gender;

SELECT origin_country,
count(*) as Americans
from adult.adult_improved
where origin_country = "United-States";

SELECT avg(work_hours) AS Average_hours_per_week, work_class
from adult.adult_improved
group by work_class;


SELECT * FROM adult.adult_improved;

SELECT count(*) as Divorced
from adult.adult_improved
where income >50000 and marital_status = "Divorced";

SELECT work_class, max(income) as highest_average_income 
from adult.adult_improved
group by work_class
order by max(income) DESC;

SELECT education, count(*) as government_officials
from adult.adult_improved
where employment_type like "%gov"
group by education
order by government_officials;

SELECT count(*) as workers_work_more_than_40hrs
from adult.adult_improved
where work_hours > 40;


SELECT work_class, count(*) AS common_occupation
from adult.adult_improved
where gender = "Female" AND income >50000
group by work_class
order by common_occupation DESC
LIMIT 1;

SELECT count(*) AS count
from adult.adult_improved
where marital_status like "Married%" and employment_type = "Private";

SELECT avg(age) AS median_age
FROM(
SELECT age, @rownum:= @rownum+1 AS the_row_number,
@total_rows:= @rownum
FROM (SELECT @rownum:=0) r,adult.adult_improved
where income > 50000
order by age
)
AS sorted
where the_row_number IN (floor((@total_rows+1)/2),
floor((@total_rows+2)/2)
);


SELECT count(*) as smart_rich
from adult.adult_improved
where education = "Bachelors" and income > 50000;

SELECT avg(income) AS Average_income, origin_country
from adult.adult_improved
group by origin_country
order by Average_income DESC;

SELECT count(*) as part_timers
from adult.adult_improved
where work_hours < 30;
