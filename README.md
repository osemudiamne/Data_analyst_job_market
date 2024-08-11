# Introduction 
This project delves into the data job market with enphasis on data analyst job positions. It explores the top-paying jobs, top-paying skills in data analytics, most demand-skills in-demand as well as the optima skills for the top-paying jobs. For the respective SQL query, check here [SQL Project folder](/SQL%20Project/)

# Background
Skills, streamlining workflow to find optimal jobs. Data used for this project was exported from [sqliteviz](/https://sqliteviz.com/app/#/workspace?hide_schema=1).

### Research question
- What are the top-paying data analyst jobs in Georgia     where I'm currently schooling
- What are the skills required for these top-paying jobs
- What are the most in-demand skills for data analysts
- Which skills are associated with higher salaries
- What are the most optimal skills to learn

### Tools used in this project
For this project, I harness the power of seveal tools including
- **SQL:** Structured Query Language is a standardized language used to manage and manipulate relational databases by querying, updating, and organizing data.
- **PostgresSQL:** PostgreSQL is an advanced, open-source relational database management system (RDBMS) known for its robustness, extensibility, and support for complex queries. 
- **VS code:** Visual Studio Code is a lightweight, open-source IDE developed by Microsoft. It offers extensive features like debugging, syntax highlighting, and extensions for various programming languages.
- **Git and Github:** Git is a distributed version control system for tracking changes in code, while GitHub is a cloud-based platform that hosts Git repositories, enabling collaboration and code sharing among developers.

### The analysis
- Each query for this project aimed at investigating specific aspects of the data analyst job market. 
#### 1. Top-paying data analyst jobs in Georgia
To identify the highest-paying job roles in Georgia, I filtered the data analyst position by average yearly salary and location, focusing on Georgia. This query highlights the top-50 most paying job titles, average year salary, company name and, of course, the state (Georgia)

```sql
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
```


