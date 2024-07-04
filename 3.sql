-- 3. buat query view untuk siswa, kelas, dan guru yang mengajar

SELECT s.name AS student_name, c.name AS class_name, t.name AS teacher_name
FROM students s
INNER JOIN classes c ON s.class_id = c.id
INNER JOIN teachers t ON c.teacher_id = t.id;