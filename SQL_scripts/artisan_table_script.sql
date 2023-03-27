CREATE TABLE country (
    code VARCHAR(10) NOT NULL,
    name VARCHAR(30) NOT NULL,
    population INTEGER,
    continent VARCHAR(20),
    development_index FLOAT,
    PRIMARY KEY (code)
);

CREATE TABLE life_exceptancy (
    country_code VARCHAR(20) NOT NULL,
    age FLOAT,
    FOREIGN KEY (country_code) REFERENCES country(code), life_exceptancy(country_code)
);

CREATE TABLE HIV_deaths (
    country_code VARCHAR(10),
    death_rate_age_5 FLOAT,
    death_rate_age_6_14 FLOAT,
    death_rate_age_15_49 FLOAT,
    death_rate_age_50_69 FLOAT,
    death_rate_age_70 FLOAT,
    PRIMARY KEY (country_code)
);

CREATE TABLE deaths (
    disease_code INTEGER NOT NULL,
    country_code VARCHAR(10) NOT NULL,
    death_num INTEGER,
    date VARCHAR(20),
    disase_type VARCHAR(20)
);

CREATE TABLE expect (
    country_code VARCHAR(10) NOT NULL,
    FOREIGN KEY (country_code) REFERENCES country(code), life_exceptancy(code) 
);

CREATE TABLE cures_by_ART (
    country_code VARCHAR(10) NOT NULL,
    num_deaths_averted INTEGER,
    FOREIGN KEY country_code REFERENCES country(code), HIV_deaths(country_code)
);

CREATE TABLE cause (
    country_code VARCHAR(10) NOT NULL,
    deaths_disease_code INTEGER NOT NULL,
    FOREIGN KEY country_code REFERENCES country(code), deaths(country_code)
    FOREIGN KEY deaths_disease_code REFERENCES deaths(disease_code)
)



