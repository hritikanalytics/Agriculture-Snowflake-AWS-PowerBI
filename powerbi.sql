-- Create Storage Integration
CREATE OR REPLACE STORAGE INTEGRATION PBI_Integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::005097884719:role/powerbi.role'
  STORAGE_ALLOWED_LOCATIONS = ('s3://powerbi.project18/')
  COMMENT = 'Optional Comment';

-- Describe Integration
DESC INTEGRATION PBI_Integration;

-- Create Database and Schema
CREATE DATABASE IF NOT EXISTS PowerBI;
CREATE SCHEMA IF NOT EXISTS PowerBI.PowerBI;

-- Create Table
CREATE TABLE PowerBI.PowerBI.PBI_Dataset (
    Year        INT,
    Location    VARCHAR(100),
    Area        INT,
    Rainfall    FLOAT,
    Temperature FLOAT,
    Soil_type   VARCHAR(50),
    Irrigation  VARCHAR(50),
    Yields      INT,
    Humidity    FLOAT,
    Crops       VARCHAR(100),
    Price       INT,
    Season      VARCHAR(50)
);

-- Create Stage
CREATE OR REPLACE STAGE PowerBI.PowerBI.pbi_stage
  URL = 's3://powerbi.project18/'
  STORAGE_INTEGRATION = PBI_Integration;

-- Load Data
COPY INTO PowerBI.PowerBI.pbi_dataset
FROM @PowerBI.PowerBI.pbi_stage
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';

-- Verify
SELECT * FROM PowerBI.PowerBI.pbi_dataset;
LIST @PowerBI.PowerBI.pbi_stage;


select count(*) from pbi_dataset;


select pbi_dataset.year, count(pbi_dataset.*) total_count
from pbi_dataset
group by pbi_dataset.year
order by pbi_dataset.year;

create table agriculture as
select * from pbi_dataset;

select area from agriculture;

update agriculture 
set rainfall = 1.1*rainfall;

update agriculture
set area = 0.9*area;

select area from agriculture;

alter table agriculture
add year_group string;

UPDATE agriculture
SET year_group = CASE
    WHEN year BETWEEN 2004 AND 2009 THEN 'Y1'
    WHEN year BETWEEN 2010 AND 2015 THEN 'Y2'
    WHEN year BETWEEN 2016 AND 2019 THEN 'Y3'
    ELSE 'unknown'
END;

select * from agriculture;

ALTER TABLE agriculture
ADD Rainfall_Group STRING;

UPDATE agriculture
SET rainfall_group = CASE
    WHEN rainfall BETWEEN 255 AND 1199 THEN 'Low'
    WHEN rainfall BETWEEN 1200 AND 2800 THEN 'Medium'
    WHEN rainfall > 2800 THEN 'High'
    ELSE 'Unknown'
END;

select rainfall, rainfall_group from agriculture;

SELECT * FROM AGRICULTURE;

SELECT CURRENT_USER();