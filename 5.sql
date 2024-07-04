-- 5. buat query input, yang akan memberikan warning error jika ada data yang sama pernah masuk

DELIMITER //

CREATE PROCEDURE insert_student(IN p_name VARCHAR(100), IN p_age INT, IN p_class_id INT)
BEGIN
    DECLARE duplicate_count INT;

    SELECT COUNT(*)
    INTO duplicate_count
    FROM students
    WHERE name = p_name AND class_id = p_class_id;

    IF duplicate_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Duplicate student name in the same class is not allowed.';
    ELSE
        INSERT INTO students (name, age, class_id)
        VALUES (p_name, p_age, p_class_id);
    END IF;
END //

DELIMITER ;