-- Difficulty: Easy

Q1. SELECT u.unique_id, e.name
FROM Employees e LEFT JOIN EmployeeUNI u
ON e.id = u.id;

--------------------------------------------------------------------------------------

Q2. SELECT p.product_name, s.year, s.price
FROM Sales s LEFT JOIN Product p
ON s.product_id = p.product_id
ORDER BY s.sale_id;

--------------------------------------------------------------------------------------

Q3. SELECT 
    v.customer_id, 
    COUNT(v.visit_id) AS count_no_trans
FROM 
    Visits v
LEFT JOIN 
    Transactions t
ON 
    v.visit_id = t.visit_id
WHERE 
    t.visit_id IS NULL
GROUP BY 
    v.customer_id;

--------------------------------------------------------------------------------------

Q4. SELECT 
    w1.id
FROM 
    Weather w1
JOIN
    Weather w2
ON
    w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE
    w1.temperature > w2.temperature;

--------------------------------------------------------------------------------------

-- 1661. Average Time of Process per Machine

SELECT
    machine_id,
    ROUND(AVG(process_time), 3) AS processing_time
FROM
    (
        SELECT
            a1.machine_id,
            a2.timestamp - a1.timestamp AS process_time
        FROM
            Activity a1
        JOIN
            Activity a2
        ON
            a1.machine_id = a2.machine_id AND
            a1.process_id = a2.process_id AND
            a1.activity_type = 'start' AND
            a2.activity_type = 'end'
    ) process_time
GROUP BY
    machine_id;

--------------------------------------------------------------------------------------

-- 577. Employee Bonus
SELECT 
    e.name, b.bonus
FROM
    Employee e 
LEFT JOIN
    Bonus b
ON
    b.empId = e.empId
WHERE
    b.bonus < 1000 OR b.bonus IS NULL;

--------------------------------------------------------------------------------------

-- 1280. Students and Examinations

SELECT
    s.student_id,
    s.student_name,
    su.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM 
    Students s
CROSS JOIN
    Subjects su
LEFT JOIN
    Examinations e
ON
    s.student_id = e.student_id AND su.subject_name = e.subject_name
GROUP BY
-- s.student_id, s.student_name, su.subject_name
    1, 2, 3
ORDER BY 
    1, 2;
-- s.student_id, s.student_name

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

-- Difficulty: Medium
