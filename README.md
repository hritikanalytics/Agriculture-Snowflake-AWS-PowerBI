# Agriculture Data Pipeline | Snowflake + AWS S3 + Power BI

## Project Overview
An end-to-end data pipeline project that ingests agricultural data from AWS S3 into Snowflake, performs SQL-based data transformation and analysis, and visualizes insights through a Power BI dashboard.

## Tools & Technologies
- **Cloud Storage:** AWS S3
- **Data Warehouse:** Snowflake
- **Language:** SQL
- **Visualization:** Power BI
- **Concepts:** Data Pipeline, ETL, Data Transformation, CASE Statements, Grouping

## Dataset
- 3,158 rows of agricultural data
- Columns: Year, Location, Area, Rainfall, Temperature, Soil Type, Irrigation, Yields, Humidity, Crops, Price, Season

## Project Steps
1. Created AWS S3 bucket and uploaded raw CSV dataset
2. Configured Snowflake Storage Integration with AWS IAM role
3. Created external stage connecting Snowflake to S3
4. Loaded data into Snowflake using COPY INTO command
5. Performed data transformation using SQL
6. Added derived columns using CASE statements (Year Group, Rainfall Group)
7. Connected Snowflake data to Power BI for dashboard visualization

## Key SQL Operations
- Storage Integration setup with AWS S3
- External Stage creation
- COPY INTO for bulk data loading
- CASE statements for derived column creation
- GROUP BY aggregations for trend analysis

## Key Insights
- 3,158 agricultural records analyzed across multiple Indian locations
- Rainfall classified into High (2,649 records) and Low (509 records) groups
- Year data grouped into 3 periods: Y1 (2004-2009), Y2 (2010-2015), Y3 (2016-2019)
- Data connected to Power BI for interactive dashboard reporting

## Screenshots
*(Snowflake query results and Power BI dashboard screenshots available in the /screenshots folder)*

## Author
**Hritik Mishra**
- GitHub: https://github.com/hritikanalytics
- Email: hmxanalysis@gmail.com
