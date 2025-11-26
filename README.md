# Introduction

This project is the first of multiple projects meant to showcase my knowledge in GitHub and various data science tools, in this case SQL. For this project I worked with a dataset documenting over 1,000,000 data job (Data Scientist, Data Engineer, etc.) postings. Since this project focuses on showcases my knowledge in SQL I will be explaining all my queries and outputs without any focus on visualizations as my other projects will cover the visualization process more extensively.

From this dataset I wanted to know a few things:
- Which skills are in the most demand for data science jobs?
- Which companies are offering the most jobs that fit my skillset?
- Which skills and companies offer the highest pay?

# Dataset

![Visual of the tables in the dataset](assets/Database_Tables.png)
*Dataset and visual above sourced from Luke Barousse on Youtube 
https://www.youtube.com/watch?v=7mz73uXD9DA*

The database as visualized above contains 4 tables. The largest table, job_postings_fact contains the key details about each documented job postings. It contains details such as the location of the job, whether it was work from home, the average salary, the company offering the job, and any skills needed for the job. 

The company_dim table documents the companies offering each job, providing details like the company name and a link to them on google.

The skills_job_dim table is an intersection table meant to document which skills each job requires, jobs can have multiple skills which is why an intersection table was needed. 

The skills_dim table documents the skills, providing details like the name of the skill and what type it is such as "programming" or "analyst_tools".
  
To see the SQL statements used to create the database see [database_creation](database_creation)  
*The statements were provided by the same source as the dataset so they will not be covered in this project but I do unstand them and have the skills to create a database in SQL.*

# Tools Used

**SQL:** Allows me to query the dataset.  
**PostgreSQL:** The chosen database management system.  
**Visual Studio Code:** The tool to write my SQL queries. Connected to my locally run database using the SQLTools extension.  
**Git & GitHub:** Used to document and share my SQL queries and analysis.

# Analysis

All of the dicussed queries are stored in [project_queries](project_queries)  

### Simple Exploration

For my first queries I wanted to do some simple exploration of the dataset, I started by determining what time period my dataset was based and whether any months had more job postings than others. To accomplish this I extracted the year and month from the dataset and grouped by both.   
For each showcase query I will be providing the SQL statement and the results which may be truncated if the resulting table from the query was too large.

```sql
SELECT
    EXTRACT(MONTH FROM job_posted_date) AS month_posted,
    EXTRACT(YEAR FROM job_posted_date) AS year_posted,
    COUNT(job_posted_date)
FROM job_postings_fact
GROUP BY year_posted, month_posted
ORDER BY year_posted, month_posted;
```
| month_posted | year_posted | count  |
|--------------|-------------|--------|
| 12           | 2022        | 1895   |
| 1            | 2023        | 92266  |
| 2            | 2023        | 64560  |
| 3            | 2023        | 64158  |
| 4            | 2023        | 62915  |
| 5            | 2023        | 52235  |
| 6            | 2023        | 61500  |
| 7            | 2023        | 63855  |
| 8            | 2023        | 75067  |
| 9            | 2023        | 62433  |
| 10           | 2023        | 66601  |
| 11           | 2023        | 64404  |
| 12           | 2023        | 55797  |

From the results we can see that most of the dataset is from 2023 with a small portion of December 2022. We can also notice that there is a spike in postings around the new years with 92266 postings and that the rest of the year remaining mostly stable around 60000 with August as the other other notable exception with 75000 postings.

I also wanted to check how many jobs are being offered from home versus locally so I did another quick query grouping by the job_work_from_home (True/False) column.
```sql
SELECT
    CASE
        WHEN job_work_from_home THEN 'Work From Home'
        ELSE 'In Person'
    END,
    COUNT(*)
FROM job_postings_fact
GROUP BY job_work_from_home;
```
| case            | count   |
|-----------------|---------|
| In Person       | 718080  |
| Work From Home  | 69606   |

The vast majority of job listings were in person job postings with there being over 10 times more in person job postings than work from home job posings.

### Available Jobs



# Conclusions
