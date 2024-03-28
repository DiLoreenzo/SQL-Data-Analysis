--World Expenditure Data Analysis

--Creating our Schema
CREATE TABLE Expenditure(
       The_year INT,
	   Country VARCHAR(50),
	   Sector VARCHAR(60),
	   Expenditure_million_USD DECIMAL,
	   GDP_percent DECIMAL
);

--Our World Expenditure Data
SELECT * FROM Expenditure

--Total number of years displayed
SELECT COUNT(DISTINCT(the_year)) FROM expenditure

--year range(from when to when)
SELECT DISTINCT(the_year) FROM expenditure
ORDER BY 1

--Countries on record 
SELECT COUNT(DISTINCT(country)) FROM expenditure

--sectors on record
SELECT DISTINCT(sector) FROM expenditure


--total expenditure for each country per year
SELECT the_year,sector,country,ROUND(expenditure_million_USD,2) FROM expenditure 
Where sector LIKE '%function%'
GROUP BY the_year,country,sector,expenditure_million_USD
ORDER BY 1

--total expenditure for each country per year(sector components)
SELECT the_year,country,sector,ROUND(expenditure_million_USD,2) as expenditure FROM expenditure 
Where sector NOT LIKE '%function%'
GROUP BY the_year,country,sector,expenditure_million_USD
ORDER BY 1

--total gdp per year
SELECT the_year,sector,country,ROUND(gdp_percent,2) FROM expenditure 
Where sector LIKE '%function%'
GROUP BY the_year,country,sector,gdp_percent
ORDER BY 1

--ranking sectors by gdp per year
SELECT the_year,country,sector,gdp_percent FROM expenditure
WHERE sector NOT LIKE '%function%'
GROUP BY the_year,country,sector,gdp_percent
ORDER BY 1,3 DESC;

--highest expenditure sector for each country per year
SELECT the_year,country,sector,MAX(Expenditure_million_USD) AS highestExpenditure FROM expenditure
WHERE sector NOT LIKE '%function%'
GROUP BY 1,2,3
ORDER BY 1,2

--Each countries total Expenditure per year
SELECT the_year,country,sector,Expenditure_million_USD FROM expenditure
WHERE sector  LIKE '%function%'

