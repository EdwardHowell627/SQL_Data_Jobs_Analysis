SELECT 
    job_title_short AS job_title,
    COUNT(job_id) AS job_count,
    ROUND(AVG(salary_year_avg)) AS salary_average,
    COUNT(salary_year_avg) AS salary_datapoints
FROM job_postings_fact
WHERE 
    job_location LIKE '%MD'
GROUP BY job_title_short
ORDER BY job_count DESC;

