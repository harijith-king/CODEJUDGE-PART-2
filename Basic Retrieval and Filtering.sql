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

