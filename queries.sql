-- 1. List all active students with student ID, name, email, batch, and admission date.
SELECT
    s.student_id,
    s.full_name,
    s.email,
    b.batch_code,
    s.admission_date
FROM students s
JOIN batches b
ON s.batch_id = b.batch_id;

-- 2.Find students whose email is missing or appears invalid.
SELECT
    student_id,
    full_name,
    email
FROM students
WHERE email IS NULL
   OR email NOT LIKE '%@%.%';

-- 3. List all problems with difficulty level Easy or Medium.
SELECT problem_id,title,difficulty,max_score
FROM problems
WHERE difficulty IN ('Easy', 'Medium');

-- 4. Display the latest 20 submissions based on submission timestamp.
SELECT submission_id, student_id, problem_id, submitted_at, status, score 
FROM submissions 
ORDER BY submitted_at DESC LIMIT 20;

-- 5. Find submissions where the status is not successful.
SELECT submission_id, student_id, problem_id, status, score 
FROM submissions 
WHERE status != 'Accepted';

-- 6. Display each submission with student name, problem title, language, status, score and submitted time.
SELECT DISTINCT s.submission_id,st.full_name,p.title,s.language,s.status,s.score,s.submitted_at
FROM submissions s
JOIN students st
ON s.student_id = st.student_id
JOIN problems p
ON s.problem_id = p.problem_id;

-- 7. Display all students and their enrollments,including students who are not enrolled in any course.
SELECT DISTINCT st.student_id, st.full_name, c.course_title, e.enrollment_status 
FROM students st 
LEFT JOIN enrollments e 
ON st.student_id = e.student_id 
LEFT JOIN courses c 
ON e.course_id = c.course_id;

-- 8. Display all courses with the number of enrolled students.
SELECT c.course_id, c.course_title, COUNT(e.student_id) AS total_students 
FROM courses c 
LEFT JOIN enrollments e 
ON c.course_id = e.course_id 
GROUP BY c.course_id, c.course_title;

-- 9. Display test-case results for each submission,including problem title and student name.

SELECT DISTINCT tr.result_id,st.full_name,p.title,tr.result_status,tr.runtime_ms
FROM test_results tr
JOIN submissions s
ON tr.submission_id = s.submission_id
JOIN students st
ON s.student_id = st.student_id
JOIN problems p
ON s.problem_id = p.problem_id;

-- 10. Find students who are enrolled in a course but have not submitted any solution for that course.
SELECT DISTINCT st.student_id, st.full_name, c.course_title 
FROM enrollments e 
JOIN students st 
ON e.student_id = st.student_id 
JOIN courses c 
ON e.course_id = c.course_id 
LEFT JOIN submissions s 
ON st.student_id = s.student_id 
LEFT JOIN problems p 
ON s.problem_id = p.problem_id 
AND p.course_id = c.course_id 
WHERE p.problem_id IS NULL;

-- 11. count submissions by status
SELECT status, COUNT(*) as total
FROM submissions
GROUP BY status;

-- 12. calculate average score per problem
SELECT p.title, AVG(s.score) as avg_score
FROM submissions s
JOIN problems p ON s.problem_id = p.problem_id
GROUP BY s.problem_id;

-- 13. find students with more than 10 submissions
SELECT st.full_name, COUNT(s.submission_id) as total_submissions
FROM submissions s
JOIN students st ON s.student_id = st.student_id
GROUP BY s.student_id
HAVING COUNT(s.submission_id) > 10;

-- 14. find problems where success rate is below 40 percent
SELECT p.title,
COUNT(s.submission_id) as total,
SUM(CASE WHEN s.status = 'Accepted' THEN 1 ELSE 0 END) as accepted,
ROUND(SUM(CASE WHEN s.status = 'Accepted' THEN 1.0 ELSE 0 END) / COUNT(*) * 100, 2) as success_rate
FROM submissions s
JOIN problems p ON s.problem_id = p.problem_id
GROUP BY s.problem_id
HAVING success_rate < 40;

-- 15. find top 10 most attempted problems
SELECT p.title, COUNT(s.submission_id) as attempts
FROM submissions s
JOIN problems p ON s.problem_id = p.problem_id
GROUP BY s.problem_id
ORDER BY attempts DESC
LIMIT 10;

-- 16. find students whose average score is greater than overall average score
SELECT st.full_name, AVG(s.score) as avg_score
FROM submissions s
JOIN students st ON s.student_id = st.student_id
GROUP BY s.student_id
HAVING AVG(s.score) > (SELECT AVG(score) FROM submissions);

-- 17. find problems that have never been attempted
SELECT DISTINCT problem_id, title
FROM problems
WHERE problem_id NOT IN (
    SELECT DISTINCT problem_id FROM submissions
);

-- 18. find students who enrolled but never submitted any solution
SELECT DISTINCT st.student_id
FROM students st
JOIN enrollments e
ON st.student_id = e.student_id
LEFT JOIN submissions s
ON st.student_id = s.student_id
WHERE s.submission_id IS NULL;

-- 19. find students who submitted in both Python and Java
SELECT st.student_id, st.full_name 
FROM students st 
JOIN submissions s 
ON st.student_id = s.student_id 
WHERE s.language IN ('Python', 'Java') 
GROUP BY st.student_id, st.full_name 
HAVING COUNT(DISTINCT s.language) = 2;

-- 20. find second highest score for a selected problem
SELECT MAX(score) as second_highest_score
FROM submissions
WHERE score < (SELECT MAX(score) FROM submissions)
AND problem_id = (SELECT problem_id FROM problems LIMIT 1);
