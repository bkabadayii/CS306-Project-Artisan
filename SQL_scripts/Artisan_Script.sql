drop database if exists Artisan;
create database if not exists Artisan;
use Artisan;

create table country (
    name VARCHAR(255) NOT NULL,
    population BIGINT,
    country_code VARCHAR(10) primary key NOT NULL,
    development_index FLOAT,
    continent VARCHAR(20)
);

create table life_expectancy (
	country_code VARCHAR(20) NOT NULL,
    age FLOAT,
    FOREIGN KEY(country_code) REFERENCES country(country_code)
);

create table HIV_deaths (
	country_code VARCHAR(10) primary key NOT NULL,
    death_rate_age_under_5 FLOAT,
    death_rate_age_5_14 FLOAT,
    death_rate_age_14_49 FLOAT,
    death_rate_age_50_69 FLOAT,
    death_rate_age_over_70 FLOAT
);

create table deaths (
    country_code VARCHAR(10) NOT NULL,
    date VARCHAR(10),
    death_num INT,
    disease_type VARCHAR(255),
    FOREIGN KEY (country_code) REFERENCES country(country_code)
);

create table expect (
	country_code VARCHAR(10) NOT NULL,
    FOREIGN KEY(country_code) REFERENCES country(country_code)
);

create table cures_by_ART (
	country_code VARCHAR(10) NOT NULL,
    num_deaths_averted INT,
    FOREIGN KEY (country_code) REFERENCES HIV_deaths(country_code)
);