/*
Question 2: What skills are required for the top paying data analyst jobs?
    -Use the top highest-paying data analyst job from the top paying job query
    -Add the specific skills required for these jobs
    -Why? It provides a detailsed look at which high paying jobs deman certain skills,
    helping job seekers understand which skills to develop that align with the top salaries
    */


WITH top_paying_jobs AS (
    SELECT  
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND job_location LIKE '%GA' 
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC

/*
Frequency of skills:

SQL: Mentioned 5 times
Python: Mentioned 4 times
R: Mentioned 2 times
SAS: Mentioned 4 times
AWS: Mentioned 2 times
Snowflake: Mentioned 2 times
Spark: Mentioned 2 times
Hadoop: Mentioned 2 times
Kafka: Mentioned 2 times
JavaScript: Mentioned 2 times


-Most in-demand skills:

SQL and Python appear to be the most frequently mentioned skills, followed by SAS. 
This suggests that proficiency in these technologies is highly valued in the data analysis field.

Variety of skills:
The list includes a mix of programming languages (SQL, Python, R, JavaScript), big data technologies 
(Hadoop, Spark, Kafka), cloud platforms (AWS), data warehousing solutions (Snowflake), and 
statistical software (SAS).

Data visualization:
Interestingly, only one position (AT&T's Principal-Data Analysis) explicitly mentions a data visualization 
tool (Tableau). This could indicate that visualization skills are either assumed or not as prioritized in 
job postings.

Emerging technologies:
The presence of skills like Snowflake, Spark, and Kafka suggests a trend towards cloud-based, big data, 
and real-time data processing technologies.

Statistical programming:
Both R and SAS are mentioned, indicating that statistical programming skills are still valuable in the 
field of data analysis.

-Skill sets by role:

Actuarial roles seem to require a combination of SQL, R, and SAS.
Data analyst roles at tech companies (like AT&T and Citi) require a broader range of skills, 
including Python, AWS, and big data technologies.


-Specialized skills:
Some roles mention specialized libraries or tools like pandas, Jupyter, and matplotlib, which are 
particularly useful for data manipulation and exploration in Python.
Cloud skills:
The mention of AWS in some roles suggests that cloud computing skills are becoming increasingly 
important in data analysis.

Salary correlation:
The highest-paying role (Analytics and R&D Actuary) requires a somewhat different skill set (SQL, R, SAS) 
compared to other roles, suggesting that domain expertise (in this case, actuarial science) combined with 
data skills can command high salaries.

These insights suggest that aspiring data analysts should focus on developing a strong foundation in SQL 
and Python, while also gaining exposure to big data technologies and cloud platforms. 
Statistical programming skills and knowledge of specialized data analysis libraries can also be 
valuable assets in the job market.