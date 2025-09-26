create database colorados;
use colorados;

SELECT year, SUM(sales) AS total_sales
FROM colorado.colorado_motor_vehicle_sales
GROUP BY year
ORDER BY year;

SELECT county, SUM(sales) AS total_sales
FROM colorado.colorado_motor_vehicle_sales
GROUP BY county
ORDER BY total_sales DESC
LIMIT 5;

SELECT year, SUM(sales) AS denver_sales
FROM colorado.colorado_motor_vehicle_sales
WHERE county = 'Denver'
GROUP BY year
ORDER BY year;

SELECT quarter, SUM(sales) AS total_sales
FROM colorado.colorado_motor_vehicle_sales
GROUP BY quarter
ORDER BY total_sales DESC;

SELECT year, county, MAX(sales) AS highest_sales
FROM colorado.colorado_motor_vehicle_sales
GROUP BY year, county
QUALIFY RANK() OVER (PARTITION BY year ORDER BY sales DESC) = 1;
