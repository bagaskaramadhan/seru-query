-- 4. buat query yang sama tapi menggunakan store_procedure

DELIMITER //

CREATE PROCEDURE student_class_teacher_proc()
BEGIN
    SELECT s.name AS student_name, c.name AS class_name, t.name AS teacher_name
    FROM students s
    JOIN classes c ON s.class_id = c.id
    JOIN teachers t ON c.teacher_id = t.id;
END

DELIMITER ;