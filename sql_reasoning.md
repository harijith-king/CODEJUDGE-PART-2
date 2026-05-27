# SQL Reasoning and Explanation
## 1. Explain one query where using LEFT JOIN is more appropriate than INNER JOIN.

The query:
“Display all students and their enrollments, including students who are not enrolled in any course”
used LEFT JOIN because the requirement was to display every student, even if no enrollment record exists.

Example query:

    SELECT
      st.student_id,
      st.full_name,
      c.course_title,
      e.enrollment_status
    FROM students st
    LEFT JOIN enrollments e
    ON st.student_id = e.student_id
    LEFT JOIN courses c
    ON e.course_id = c.course_id;

Using INNER JOIN would remove students who are not enrolled in any course because INNER JOIN only returns matching records from both tables.
LEFT JOIN was therefore more suitable for this requirement.

---

## 2. Explain one query where HAVING is required instead of WHERE.

HAVING was required in the query:
“Find students who submitted in both Python and Java”

Example query:

      SELECT
      st.student_id,
      st.full_name
      FROM students st
      JOIN submissions s
      ON st.student_id = s.student_id
      WHERE s.language IN ('Python', 'Java')
      GROUP BY st.student_id, st.full_name
      HAVING COUNT(DISTINCT s.language) = 2;

The COUNT() function is an aggregate function and is evaluated after grouping.
WHERE cannot filter aggregated results, so HAVING was necessary to filter students based on grouped submission counts.

---

## 3. Explain one query where a subquery helped solve the problem.

A subquery was helpful in the query:
“Find the second highest score for a selected problem”

Example query:

    SELECT DISTINCT score
    FROM submissions
    WHERE problem_id = 'P101'
    ORDER BY score DESC
    LIMIT 1 OFFSET 1;

The query isolates scores for a specific problem and then sorts them in descending order to identify the second highest score.
Subquery-based approaches are useful when ranking or comparing grouped results.

---

## 4. Explain one situation where your query output could be misleading if duplicate records exist.

The query:
“Display all courses with the number of enrolled students”
could produce incorrect results if duplicate enrollment records exist.

Example query:

    SELECT
      c.course_id,
      c.course_title,
      COUNT(e.student_id) AS total_students
    FROM courses c
    LEFT JOIN enrollments e
    ON c.course_id = e.course_id
    GROUP BY c.course_id, c.course_title;

If the same student is enrolled multiple times in the same course, the COUNT() function would increase the total student count incorrectly.
This could make the course appear to have more enrolled students than it actually does.
Using DISTINCT or enforcing proper constraints can help avoid this issue.

---

## 5. Explain one edge case you considered while writing any query.

“Find students who enrolled but never submitted any solution”
an important edge case was handling students who have no matching submission records.

Example query:

    SELECT DISTINCT
        st.student_id,
        st.full_name
    FROM students st
    JOIN enrollments e
    ON st.student_id = e.student_id
    LEFT JOIN submissions s
    ON st.student_id = s.student_id
    WHERE s.submission_id IS NULL;

If INNER JOIN had been used instead of LEFT JOIN, students without submissions would not appear in the result at all.
Using LEFT JOIN and checking for NULL values ensured that such students were correctly identified.
