-- Exercício 1

SELECT users.id, users.name, cities.name AS city FROM users
JOIN cities ON "cityId" = cities.id
WHERE cities.name = 'Rio de Janeiro';

-- Exercício 2

SELECT testimonials.id, u1.name AS writer, u2.name AS recipient, testimonials.message FROM testimonials
JOIN users u1 ON u1.id=testimonials."writerId"
JOIN users u2 ON u2.id=testimonials."recipientId";

-- Exercício 3

SELECT users.name, courses.name, schools.name, educations."endDate" FROM educations
JOIN users ON "userId" = users.id
JOIN courses ON "courseId" = courses.id
JOIN schools ON "schoolId" = schools.id
WHERE users.id = 30 AND educations.status = 'finished';

-- Exercício 4

SELECT users.id, users.name, roles.name, companies.name, experiences."startDate" FROM experiences
JOIN users ON "userId" = users.id
JOIN roles ON "roleId" = roles.id
JOIN companies ON "companyId" = companies.id
WHERE users.id = 50 AND experiences."endDate" IS NULL;