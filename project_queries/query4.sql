
SELECT 
    skills AS skill,
    ROUND(AVG(salary_year_avg)) AS average_salary,
    COUNT(*) AS data_points
FROM skills_job_dim AS skills_job
INNER JOIN job_postings_fact
    ON skills_job.job_id = job_postings_fact.job_id
INNER JOIN skills_dim
    ON skills_job.skill_id = skills_dim.skill_id
WHERE 
    job_location LIKE '%MD' AND
    job_title_short = 'Data Scientist' AND
    salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY data_points DESC



