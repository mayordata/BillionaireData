select 
	*
from
	billionaires

-- Calculating Wealth distribution by industries.
	
create view industry as(
	select 
	industries,
	sum(final_worth) as total_final_worth
from
	billionaires
group by
	1
order by 
	2 desc
);

-- Calculating Wealth distribution by country.
	
create view country as (
	select 
	country,
	sum(final_worth) as total_final_worth
from
	billionaires
group by 
	1
order by 
	2 desc
);

-- Calculating Wealth distribution by source.
	
create view source as (
	select 
	source,
	sum(final_worth) as total_final_worth
from
	billionaires
group by 
	1
order by 
	2 desc
);
	
-- Calculating Wealth distribution by age group.
	
create view age_group as (
SELECT
  CASE
    WHEN age BETWEEN 0 AND 20 THEN '0-20'
    WHEN age BETWEEN 20 AND 40 THEN '20-40'
    WHEN age BETWEEN 40 AND 60 THEN '40-60'
    WHEN age BETWEEN 60 AND 80 THEN '60-80'
    WHEN age BETWEEN 80 AND 100 THEN '80-100'
    ELSE '100+'
  END AS age_group,
  COUNT(*) AS number_of_billioniares,
  sum(final_worth) as total_final_worth
FROM 
	billionaires b 
GROUP BY 
	age_group
ORDER by
	3 desc
);

-- Calculating Wealth distribution by gender

create view gender as (
	select 
	gender,
	count(gender) as number_of_billioniares,
	Sum(final_worth) as total_final_worth
from
	billionaires
group by
	1
order by 
	2 desc
);

-- Calculating Wealth distribution by place of birth (citizenship)

select
	country_of_citizenship,
	count(country_of_citizenship) as number_of_billioniares,
	sum(final_worth) as total_final_worth
from
	billionaires
group by
	1
order by 
	2 desc;

-- Calculating self made vs inherited

select 
	case 
		when self_made = 'TRUE' THEN 'Self-made'
		when self_made = 'FALSE' THEN 'Inherited'	
		else 'unknown'
	end as classification,
	count(*) as number_of_billionaires,
	sum(final_worth) as total_final_worth
from
	billionaires
group by 
 	1
 order by 
 	2 desc
	
select 
	self_made	
from
	billionaires

-- calculation correlation co efficient  btw wealth, gdp, cpi, tax
	
select
	corr(gdp_country_new, final_worth) as correlation
from
	billionaires
	
select 
	corr(gdp_country_new, cpi_change_country) as correlation
from
	billionaires


select 
	corr(gdp_country_new, total_tax_rate_country) as correlation
from
	billionaires
	
select 
	corr(gdp_country_new, age) as correlation
from
	billionaires
	
	