CREATE TABLE country (
    code VARCHAR(10) NOT NULL,
    name VARCHAR(30) NOT NULL,
    population INTEGER,
    continent VARCHAR(20),
    development_index FLOAT,
    PRIMARY KEY (code)
);

CREATE TABLE life_exceptancy (
    date VARCHAR(20) NOT NULL,
    age FLOAT, 
);

CREATE TABLE HIV_deaths (
    age_range VARCHAR(20),
    PRIMARY KEY (age_range)
);

CREATE TABLE deaths (
    disease_code INTEGER NOT NULL,
    death_num INTEGER,
    date VARCHAR(20)
    type VARCHAR(20)
);

CREATE TABLE expect (
    country_code VARCHAR(10) NOT NULL,
    life_exceptancy_date VARCHAR(20) NOT NULL,
    FOREIGN KEY (country_code) REFERENCES country(code),
    FOREIGN KEY (life_exceptancy_date) REFERENCES life_exceptancy(date),   
);

CREATE TABLE cures_by_ART (
    country_code VARCHAR(10) NOT NULL,
    HIV_deaths_age_range VARCHAR(20) NOT NULL,
    num_deaths_averted INTEGER,
    FOREIGN KEY country_code REFERENCES country(code),
    FOREIGN KEY HIV_deaths_age_range REFERENCES HIV_deaths(age_range),
);

CREATE TABLE cause (
    country_code VARCHAR(10) NOT NULL,
    deaths_disease_code INTEGER NOT NULL,
    FOREIGN KEY country_code REFERENCES country(code),
    FOREIGN KEY deaths_disease_code REFERENCES deaths(disease_code)
)



