--GOOGLE PLAYSTORE APP ANALYSIS

--CREATING OUR SCHEMA
CREATE TABLE google(
	app VARCHAR(200),
	category VARCHAR(50),
	rating DECIMAL,
	reviews INT,
	app_size VARCHAR(50),
	installs VARCHAR(50),
	app_type VARCHAR(50),
	price VARCHAR(20),
	content_rating VARCHAR(50),
	genres VARCHAR(50),
	last_updated VARCHAR(50),
	current_ver VARCHAR(50),
	android_ver VARCHAR(50)


);


--GOOGLE PLAYSTORE APP ANALYSIS

--CREATING OUR SCHEMA
CREATE TABLE google(
	app VARCHAR(200),
	category VARCHAR(50),
	rating DECIMAL,
	reviews VARCHAR(20),
	app_size VARCHAR(50),
	installs VARCHAR(50),
	app_type VARCHAR(50),
	price VARCHAR(20),
	content_rating VARCHAR(50),
	genres VARCHAR(50),
	last_updated VARCHAR(50),
	current_ver VARCHAR(50),
	android_ver VARCHAR(50)


);

SELECT * FROM google

--Number of apps in our Google Play_store data
SELECT COUNT(DISTINCT(app)) as total_app_count FROM google 

--App Categories
SELECT DISTINCT(category) FROM google

--App count per category
SELECT category,COUNT(DISTINCT(app)) as app_count FROM google
GROUP BY category
ORDER BY 2 DESC;

--Percentage of apps in category
SELECT category, (COUNT(app) * 100 / COUNT(DISTINCT(app))) as app_count_category FROM google
GROUP BY category;

--Total reviews 
SELECT SUM(reviews) FROM google;


--Total Reviews per app Category
SELECT category,COUNT(DISTINCT(app)) as app_count,SUM(reviews)  FROM google
GROUP BY category
ORDER BY 3 DESC;

--Unique installs category
SELECT DISTINCT(installs) FROM google 

--Number of app in the installs category
SELECT installs, COUNT(DISTINCT(app)) FROM google
GROUP BY installs
ORDER BY 2 DESC;

--app type categories
SELECT DISTINCT(app_type) FROM google

--Number of apps per app_type category
SELECT app_type, COUNT(DISTINCT(app)) FROM google
GROUP BY app_type
ORDER BY 2 DESC;

--number of apps per app_type per category
SELECT category, app_type, COUNT(DISTINCT(app)) FROM google
GROUP BY category, app_type


--price category
SELECT DISTINCT(price) FROM google

--Corelation between ratings and reviews
SELECT SUM(reviews) FROM google;

SELECT rating, SUM(reviews) as review_sum FROM  google
GROUP BY rating
ORDER BY 2 DESC;

SELECT rating, SUM(reviews) as review_sum FROM  google
WHERE rating BETWEEN 3.9 AND 5.0
GROUP BY rating
ORDER BY 2 DESC;

