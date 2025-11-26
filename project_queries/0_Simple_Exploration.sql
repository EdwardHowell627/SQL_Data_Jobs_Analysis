
-- Date Posted
SELECT
    EXTRACT(MONTH FROM job_posted_date) AS month_posted,
    EXTRACT(YEAR FROM job_posted_date) AS year_posted,
    COUNT(job_posted_date)
FROM job_postings_fact
GROUP BY year_posted, month_posted
ORDER BY year_posted, month_posted;


-- Work From Home
SELECT
    CASE
        WHEN job_work_from_home THEN 'Work From Home'
        ELSE 'In Person'
    END,
    COUNT(*)
FROM job_postings_fact
GROUP BY job_work_from_home;
