CREATE PROCEDURE get_country_info (IN country_code VARCHAR(10))
  SELECT c.name, c.population, c.development_index, le.age, hd.death_rate_age_5_14
  FROM country c
  LEFT JOIN life_expectancy le ON c.country_code = le.country_code
  LEFT JOIN HIV_deaths hd ON c.country_code = hd.country_code
  WHERE c.country_code = country_code;