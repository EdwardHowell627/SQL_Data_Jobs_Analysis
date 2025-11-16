SELECT 
    job_location AS location,
    job_work_from_home AS work_from_home,
    job_title_short AS job_title,
    salary_year_avg AS yearly_salary,
    company.name AS company_name
FROM job_postings_fact AS job_postings
LEFT JOIN company_dim AS company
    ON job_postings.company_id = company.company_id
WHERE 
    (job_location LIKE '%MD' OR 
    job_work_from_home = TRUE) AND
    job_country = 'United States' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC;


