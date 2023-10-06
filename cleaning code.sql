-- data cleaning.

select
	*
from
	billionaires


-- standerdized Date Format

select 
	date,
	cast(date as date) as converted_date
from
	billionaires
	
alter table billionaires
	add Converted_date date;

update billionaires
	set converted_date = cast(date as date);

-- standerdized nummerical data

select
	new_gdp_country
from
	billionaires;
	
select
	gdp_country,
	replace(gdp_country, '$','')
from
	billionaires;

alter table billionaires 
	add new_gdp_country varchar;
	
update billionaires 
	set new_gdp_country = replace(gdp_country, '$','');
	
select 
	new_gdp_country,
	cast(replace(new_gdp_country, ',', '') as numeric)
from
	billionaires;
	
update billionaires
	set new_gdp_country = cast(replace(new_gdp_country, ',', '') as numeric);

alter table billionaires
	add gdp_country_new numeric,

update billionaires
	set gdp_country_new = cast(replace(new_gdp_country, ',', '') as numeric);

-- standardizing the birthdate
	
select
	birth_date,
	cast(split_part(birth_date, ' ', 1) as date),
	length(split_part(birth_date, ' ', 1))
from
	billionaires
order by
	3 desc

update billionaires
	set new_birthdate = cast(split_part(birth_date, ' ', 1) as date);

-- replace values

select
	distinct(status)
from
	billionaires;

 update billionaires
  set status = replace(status, 'Split Family Fortune', 'S');
  
 -- delete duplicated rows using delete and join
 
SELECT 
	person_name,
	count(person_name)
FROM 
	billionaires
GROUP by 
	1
HAVING COUNT(person_name) > 1;


DELETE  FROM
    billionaires a
        USING billionaires b
WHERE
    a.rank < b.rank
    AND a.person_name = b.person_name;


select
	person_name,
	rank
from
	billionaires
where 
	person_name = 'Li Li'
	
-- Populate the age blank with the average age.
	
select 
	round(avg(age))
from
	billionaires
	
update billionaires
	set age = CASE WHEN age is NULL then 65 else age end;