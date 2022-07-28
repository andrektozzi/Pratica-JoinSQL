-- Exercício 1

SELECT COUNT ("endDate") AS "currentExperiences" FROM experiences;

-- Exercício 2

SELECT "userId" AS id, COUNT("userId") AS educations FROM educations
GROUP BY "userId"
ORDER BY "educations" DESC;

-- Exercício 3

SELECT users.name AS writer, COUNT(testimonials.message) AS "testimonialCount" FROM testimonials 
JOIN users ON testimonials."writerId" = users.id 
WHERE testimonials."writerId" = 435 
GROUP BY users.name;

-- Exercício 4

SELECT MAX(salary) as "maximumSalary", roles.name AS role FROM jobs
JOIN roles ON jobs."roleId" = roles.id
WHERE jobs.active = true
GROUP BY role
ORDER BY "maximumSalary" ASC;