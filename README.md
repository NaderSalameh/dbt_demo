# dbt_demo
## dbt is an open-source command line tool that helps data engineers, data scientists, and data analysts transform data in their warehouse more effectively.

the repository demonstrates the usage of DBT using snowflake on GCP

includes:
  - Sourcing
  - Tests (native and custom)
  - Snapshots
  - Macros using JINJA
  - Types of Materializations: 
  
      - TABLE: Model that is rebuilt as a table on each dbt run 
      - VIEW: Model that is rebuilt as a view on each dbt run
      - INCREMENTAL: Only new or updated records added to a table on each dbt run 
      - EPHEMERAL: Temporary tables that are created and utilized within dbt but not added into the database  
