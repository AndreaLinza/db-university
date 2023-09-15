-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT
    `students`.`name` as "Nome",
    `surname` as "Cognome",
    `degrees`.`name` as "Laurea"
FROM
    `students`
    INNER JOIN `degrees` 
        ON `degrees`.`id` = `students`.`degree_id`
WHERE
    `degree_id` = 53;

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT
    `degrees`.`name` AS "Laurea Magistrale",
    `departments`.`name` AS "Dipartimento"
FROM
    `degrees`
    INNER JOIN `departments` 
        ON `degrees`.`department_id` = `departments`.`id`
WHERE
    `departments`.`id` = 7
    AND `degrees`.`level` = "magistrale";

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT
    `teachers`.`name`,
    `teachers`.`surname`,
    `course_id`
FROM
    `course_teacher`
    INNER JOIN `teachers` 
        ON `teachers`.`id` = `teacher_id`
WHERE
    `teacher_id` = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
-- sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT
    `students`.`surname` AS "Cognome",
    `students`.`name` AS "Nome",
    `degrees`.`name` AS "Corso_di_Laurea",
    `departments`.`name` AS "Dipartamento"
FROM
    `students`
    INNER JOIN `degrees` 
        ON `degrees`.`id` = `students`.`degree_id`
    INNER JOIN `departments` 
        ON `departments`.`id` = `degrees`.`department_id`
ORDER BY
    `students`.`surname` ASC,
    `students`.`name`;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT
    `degrees`.`name` AS "Corso_di_Laurea",
    `courses`.`name` AS "Corso",
    `teachers`.`name` AS "Nome",
    `teachers`.`surname` AS "Cognome"
FROM
    `course_teacher`
    INNER JOIN `teachers` 
        ON `teachers`.`id` = `course_teacher`.`teacher_id`
    INNER JOIN `courses` 
        ON `courses`.`id` = `course_teacher`.`course_id`
    INNER JOIN `degrees` 
        ON `degrees`.`id` = `courses`.`degree_id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT
    `teachers`.`name` AS "Nome",
    `teachers`.`surname` AS "Cognome",
    `departments`.`name` AS "Dipartimento"
FROM
    `course_teacher`
    INNER JOIN `teachers` 
        ON `teachers`.`id` = `course_teacher`.`teacher_id`
    INNER JOIN `courses` 
        ON `courses`.`id` = `course_teacher`.`course_id`
    INNER JOIN `degrees` 
        ON `degrees`.`id` = `courses`.`degree_id`
    INNER JOIN `departments` 
        ON `departments`.`id` = `degrees`.`department_id`
WHERE
    `departments`.`id` = 5;

-- 7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo. 
--Successivamente, filtrare i tentativi con voto minimo 18.