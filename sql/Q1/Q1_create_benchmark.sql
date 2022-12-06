CREATE DATABASE IF NOT EXISTS Q1;
USE Q1;
CREATE TABLE train(Id int,  Province_State string, Country_Region string, Date timestamp, ConfirmedCases double, Fatalities double, INDEX(KEY=Province_State, TS=Date, TTL_TYPE=absolute, TTL=64d), INDEX(KEY=Country_Region, TS=Date, TTL_TYPE=absandlat, TTL=(16d,10)));