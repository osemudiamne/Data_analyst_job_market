/*
Qestion 3: What are the most in-demand skills for data analyst?
    -Join job postings to inner table similar to the top paying skills query.
    -Identify the top 5 in-demand skills for data analyst
    -Focus on all job postings
    -Why? Retrieves the top 5 skills wit the highest demand in the job market, providing insight into
    skills for job seekers.
    */


SELECT 
    skills_job_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND job_location LIKE '%GA'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 10