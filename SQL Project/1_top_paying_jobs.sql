/*
Questions: What are the top paying data analyst jobs?
    - Identify the top 10 paying data analyst roles that are available remotely and the companies.
    -Focuses on the job postings wit specified saalaries (remove nulls)
    -Why? the highlist the to paying opportunities for the data analyst, offering insight into employ
*/

SELECT  
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND job_location LIKE '%GA' 
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 50;

