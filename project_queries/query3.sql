WITH jobs_per_skill AS(
    SELECT
        skills_job.skill_id,
        COUNT(*) AS skill_count,
        ROUND(AVG(salary_year_avg)) AS average_salary,
        COUNT(salary_year_avg) AS data_points
    FROM skills_job_dim AS skills_job
    INNER JOIN job_postings_fact AS job_postings
        ON skills_job.job_id = job_postings.job_id
    WHERE 
        job_location LIKE '%MD' AND
        job_title_short = 'Data Scientist'
    GROUP BY skills_job.skill_id
)

  
SELECT
    skill_count,
    skills AS skill_name,
    skills_dim.type AS skill_type,
    average_salary,
    data_points AS salary_datapoints
FROM jobs_per_skill
INNER JOIN skills_dim
    ON jobs_per_skill.skill_id = skills_dim.skill_id
ORDER BY
    skill_count DESC