--We create our table features and import our EUROPEAN SALES RECORD Data

CREATE TABLE esr
(
    region VARCHAR(20),
    country VARCHAR(30),
    itemtype VARCHAR(30), 
    saleschannel VARCHAR(30),
    orderpriority VARCHAR(3),
    orderdate date,
    orderid integer,
    shipdate date,
    unitssold integer,
    unitprice numeric,
    unitcost numeric,
    totalrevenue numeric,
    totalcost numeric,
    totalprofit numeric
);


--Our full Dataset
SELECT * FROM esr

--Our data is of European sales record with 14b dimensions;
--[region ,country,itemtype,saleschannel,orderpriority,orderdate,orderid,
    --shipdate,unitssold,unitprice,unitcost,totalrevenue,totalcost,totalprofit]

--Total revenue across Europe
SELECT SUM(totalrevenue) AS TOTAL_REVENUE_ACROSS_EUROPE 
FROM esr;

--Total Revenue per location(Country)
SELECT country,MAX(totalrevenue) AS TOTAL_REVENUE 
FROM esr
GROUP BY country;


--Total profits across europe
SELECT SUM(totalprofit) AS TOTAL_PROFIT_ACROSS_EUROPE 
FROM esr;

--Total units(products) sold
SELECT SUM(unitssold) AS TOTAL_PRODUCTS_ACROSS_EUROPE 
FROM esr;

--Total profit per country
SELECT country,MAX(totalprofit) AS TOTAL_PROFIT
FROM esr
GROUP BY country
ORDER BY TOTAL_PROFIT DESC;

-- ITEMS sold in Europe 
SELECT DISTINCT(itemtype)
FROM esr

-- Total Volume of Items sold per item category accross Europe
SELECT itemtype,SUM(unitssold) AS TOTAL_UNITS_SOLD
FROM esr
GROUP BY itemtype
ORDER BY TOTAL_UNITS_SOLD DESC;

--Profit per item(what item generated more profit)
SELECT itemtype,ROUND(SUM(totalprofit),2) AS TOTAL_PROFIT
FROM esr
GROUP BY itemtype
ORDER BY TOTAL_PROFIT DESC;

--sales channel types
SELECT DISTINCT(saleschannel)
FROM esr;

--number of sales channel
SELECT COUNT(DISTINCT(saleschannel))
FROM esr;

--number of products sold per sales channel
SELECT saleschannel,SUM(unitssold) AS NUMBER_OF_PRODUCTS
FROM esr
GROUP BY saleschannel;
