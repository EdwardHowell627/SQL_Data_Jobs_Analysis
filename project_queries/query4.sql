WITH company_jobs AS (
    SELECT
        company_id,
        ROUND(AVG(salary_year_avg)) AS average_salary,
        COUNT(job_postings.company_id) AS job_count
    FROM job_postings_fact AS job_postings
    WHERE 
        job_location LIKE '%MD' AND
        job_title_short = 'Data Scientist' AND
        job_id IN (
            SELECT
                DISTINCT job_id
            FROM skills_job_dim AS skills_job
            INNER JOIN skills_dim
                ON skills_job.skill_id = skills_dim.skill_id
            WHERE
                skills IN ('python', 'r', 'sql', 'sas', 'excel', 'power bi', 'matlab')
        )
    GROUP BY company_id
    ORDER BY job_count DESC
)

SELECT 
    company_dim.name AS company_name,
    average_salary,
    job_count,
    link_google
FROM company_jobs
INNER JOIN company_dim
    ON company_jobs.company_id = company_dim.company_id