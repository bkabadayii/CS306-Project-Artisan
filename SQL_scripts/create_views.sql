CREATE VIEW high_population_countries AS
SELECT *
FROM country
WHERE population > 20000000;

CREATE VIEW low_life_expectancy_countries AS
SELECT country_code, age
FROM life_expectancy
WHERE age < 65;

CREATE VIEW high_kid_HIV_death_rate_countries AS
SELECT death_rate_age_5_14, country_code
FROM HIV_deaths
WHERE death_rate_age_5_14 > 10;

CREATE VIEW menengitis_deaths AS
SELECT country_code, disease_type, death_num
FROM deaths
WHERE disease_type = 'menengitis';

CREATE VIEW high_ART_cure AS
SELECT *
FROM cures_by_ART
WHERE num_deaths_averted > 300000;

CREATE VIEW developed_asia_countries AS
SELECT *
FROM country
WHERE continent = 'Asia' AND development_index > 0.9;