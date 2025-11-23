WITH jobs_with_skill AS(
    SELECT
        DISTINCT job_id
    FROM skills_job_dim AS skills_job
    INNER JOIN skills_dim
        ON skills_job.skill_id = skills_dim.skill_id
    WHERE
        skills IN ('python', 'r', 'sql', 'sas', 'excel', 'power bi', 'matlab')
)


SELECT
    company_dim.name AS company_name,
    ROUND(AVG(salary_year_avg)) AS average_salary,
    COUNT(job_postings.company_id) AS job_count
FROM jobs_with_skill
INNER JOIN job_postings_fact AS job_postings
    ON jobs_with_skill.job_id = job_postings.job_id
INNER JOIN company_dim ON
    job_postings.company_id = company_dim.company_id
WHERE 
    job_location LIKE '%MD' AND
    job_title_short = 'Data Scientist'
GROUP BY company_dim.name
ORDER BY job_count DESC
