# Introduction

This project is the first of multiple projects meant to showcase my knowledge in GitHub and various data science tools, in this case SQL. For this project I worked with a dataset documenting over 1,000,000 data job postings.

From this dataset I wanted to know a few things:
- Which skills are in the most demand for data science jobs?
- Which companies are offering the most jobs that fit my skillset?
- Which skills and companies offer the highest pay?

# Dataset

![Visual of the tables in the dataset](assets\Database_Tables.png)
*Dataset and visual above sourced from Luke Barousse on Youtube 
https://www.youtube.com/watch?v=7mz73uXD9DA*

The database as visualized above contains 4 tables. The largest table, job_postings_fact contains the key details about each documented job postings. It contains details such as the location of the job, whether it was work from home, the average salary, the company offering the job, and any skills needed for the job. 

The company_dim table documents the companies offering each job, providing details like the company name and a link to them on google.

The skills_job_dim table is an intersection table meant to document which skills each job requires, jobs can have multiple skills which is why an intersection table was needed. 

The skills_dim table documents the skills, providing details like the name of the skill and what type it is such as "programming" or "analyst_tools".
  
To see the SQL statements used to create the database see: [sql_load](database_creation)  
*The statements were provided by the same source as the dataset so they will not be covered in this project but I do unstand them and have the skills to create a database on my own in SQL.*

# Tools Used

**SQL:** Allows me to query the dataset.  
**PostgreSQL:** The chosen database management system.  
**Visual Studio Code:** The tool to write my SQL queries. Connected to my locally run database using the SQLTools extension.  
**Git & GitHub:** Used to document and share my SQL queries and analysis.

# Analysis



# Conclusions