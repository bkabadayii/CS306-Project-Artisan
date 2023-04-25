use Artisan;

-- 1. JOINS AND SET OPERATIONS --

-- SELECT Developed Asia countries whose population > 20.000.000:
SELECT * from high_population_countries
INTERSECT
SELECT * from developed_asia_countries;


-- SELECT Low life expectancy country_code's whose Hiv death rates among childs are > 10:
SELECT country_code from low_life_expectancy_countries
INTERSECT
SELECT country_code from high_kid_HIV_death_rate_countries;

-- SELECT countries with High amount of art cures but low population:
SELECT country_code from high_ART_cure
EXCEPT
SELECT country_code from high_population_countries;

-- SELECT countries with High amount of art cures but low population:
SELECT country_code
FROM country
FULL OUTER JOIN cures_by_ART
ON country.country_code = cures_by_ART.country_code
WHERE country.population > 20000000 AND cures_by_ART.num_deaths_averted > 300000;


-- 2. IN AND EXISTS OPERATIONS --

-- Select high population countries who are also in low life expectancy countries:
SELECT * FROM high_population_countries
WHERE country_code IN (SELECT country_code FROM low_life_expectancy_countries);

SELECT * FROM high_population_countries
WHERE EXISTS (
    SELECT 
    country_code FROM low_life_expectancy_countries
    WHERE high_population_countries.country_code = low_life_expectancy_countries.country_code
);


-- 3. AGGREGATE OPERATORS --

-- Calculate the average life expectancy for each continent:
SELECT country.continent, AVG(life_expectancy.age) AS average_life_expectancy
FROM life_expectancy
INNER JOIN country ON life_expectancy.country_code = country.country_code
GROUP BY country.continent;

-- Calculate total deaths for each disease:
SELECT disease_type, 
       SUM(deaths.death_num) AS death_count
FROM deaths
GROUP BY disease_type
HAVING COUNT(*) >= 2;

-- Calculate total deaths for each country:
SELECT country_code, 
       SUM(deaths.death_num) AS death_count
FROM deaths
GROUP BY country_code
HAVING COUNT(*) >= 2;

-- Find the disease which kills the most for each country:
SELECT country_code, disease_type, MAX(death_num) AS max_death_num
FROM deaths
GROUP BY country_code
HAVING disease_type = (SELECT disease_type FROM deaths WHERE death_num = max_death_num);

-- Find the countries that have the minimum ART cure rate for each continent:
SELECT continent, country.country_code, MIN(num_deaths_averted) AS min_num_deaths_averted
FROM cures_by_ART
JOIN country ON cures_by_ART.country_code = country.country_code
GROUP BY continent
HAVING num_deaths_averted = (SELECT MIN(num_deaths_averted) FROM cures_by_ART WHERE country_code = country.country_code);

-- Find average development index and average ART cure rate for each continent:
SELECT 
    country.continent,
    AVG(country.development_index) AS avg_dev_index,
    AVG(cures_by_ART.num_deaths_averted) AS avg_art_cure
FROM 
    country
    INNER JOIN HIV_deaths ON country.country_code = HIV_deaths.country_code
    INNER JOIN cures_by_ART ON HIV_deaths.country_code = cures_by_ART.country_code
GROUP BY 
    country.continent;
