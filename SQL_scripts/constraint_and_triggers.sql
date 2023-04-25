ALTER TABLE country
ADD CONSTRAINT population_limit CHECK (population >= 1775 AND population <= 1421864100);

INSERT INTO country VALUES ("Artisan_country01", 2000000000, "ART01", 1, "Europe");
INSERT INTO country VALUES ("Artisan_country02", 1000, "ART02", 1, "Europe");