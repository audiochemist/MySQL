-- 1
SELECT apellido1 AS firstSurname, apellido2 AS secondSurname, nombre AS studentName FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
-- 2
SELECT apellido1 AS firstSurname, apellido2 AS secondSurname, nombre AS studentName FROM persona WHERE tipo = 'alumno' AND telefono is null;
-- 3
SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
-- 4
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono is null AND SUBSTRING(nif,9,1) = 'K';
-- 5 
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
-- 6 
SELECT p.apellido1 AS firstSurname, p.apellido2 AS secondSurname, p.nombre AS teacherName, d.nombre AS departmentName FROM persona p JOIN profesor pr ON p.id = pr.id_profesor JOIN departamento d ON pr.id_departamento = d.id WHERE p.tipo = 'profesor' ORDER BY apellido1, apellido2, p.nombre;
-- 7
SELECT a.nombre AS subjectName, c.anyo_inicio AS startingYear,c.anyo_fin AS endingYear FROM asignatura a JOIN alumno_se_matricula_asignatura asm ON a.id = asm.id_asignatura JOIN persona p ON asm.id_alumno = p.id JOIN curso_escolar c ON asm.id_curso_escolar = c.id WHERE p.nif = '26902806M';
-- 8
SELECT d.nombre AS departmentName FROM departamento d JOIN profesor pr ON pr.id_departamento = d.id JOIN asignatura a ON pr.id_profesor = a.id_profesor JOIN grado g ON g.id = a.id_grado WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)' GROUP BY d.id;
-- 9 
SELECT apellido1 AS firstSurname, apellido2 AS secondSurname, p.nombre AS studentName FROM asignatura a JOIN alumno_se_matricula_asignatura asm ON a.id = asm.id_asignatura JOIN persona p ON asm.id_alumno = p.id JOIN curso_escolar c ON asm.id_curso_escolar = c.id WHERE c.anyo_inicio = 2018 GROUP BY p.id;
-- ONLY LEFT/RIGHT JOIN
-- 1
SELECT d.nombre AS departmentName, p.apellido1 AS teacherFirstSurname, p.apellido2 AS teacherSecondSurname, p.nombre AS teacherName FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON d.id = pr.id_profesor WHERE p.tipo = 'profesor' ORDER BY d.nombre, apellido1, apellido2, p.nombre;
-- 2
SELECT d.nombre AS departmentName, p.apellido1 AS teacherFirstSurname, p.apellido2 AS teacherSecondSurname, p.nombre AS teacherName FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON d.id = pr.id_profesor WHERE p.tipo = 'profesor';
-- 3
SELECT d.*  FROM profesor pr  RIGHT JOIN departamento d ON d.id=pr.id_departamento  WHERE pr.id_profesor is null;
-- 4
SELECT a.nombre AS subjectName, p.apellido1 AS teacherFirstSurname, p.apellido2 AS teacherSecondSurname, p.nombre AS teacherName FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor WHERE p.tipo = 'profesor' AND a.id is null;
-- 5
SELECT a.* FROM asignatura a LEFT JOIN profesor pr ON a.id_profesor = pr.id_profesor WHERE pr.id_profesor is null;
-- 6
SELECT d.* FROM asignatura a LEFT JOIN profesor pr ON a.id_profesor = pr.id_profesor RIGHT JOIN departamento d ON d.id = pr.id_departamento WHERE a.id is null;
-- SUMMARY QUERIES
-- 1
SELECT COUNT(id) AS totalNumStudents FROM persona p WHERE p.tipo = 'alumno';
-- 2
SELECT COUNT(id) AS numStudentsBornIn1999 FROM persona p WHERE p.tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
-- 3
SELECT COUNT(pr.id_profesor) AS numTeachers, d.nombre as departmentName FROM departamento d JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.id ORDER BY COUNT(pr.id_profesor) DESC;
-- 4
SELECT COUNT(pr.id_profesor) AS numTeachers, d.nombre as departmentName FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre ORDER BY d.nombre;
-- 5
SELECT g.nombre AS gradoName, COUNT(a.id) as numSubject FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY COUNT(a.id) DESC;
-- 6
 SELECT COUNT(a.id) AS numberSubjects, g.nombre FROM asignatura a JOIN grado g ON a.id_grado = g.id GROUP BY g.nombre  HAVING COUNT(a.id) > 40;
-- 7
SELECT g.nombre AS gradoName, a.tipo AS subjectType, SUM(a.creditos) AS creditsSubject FROM grado g  LEFT JOIN asignatura a on g.id = a.id_grado  GROUP BY g.nombre, a.tipo ORDER BY g.nombre ASC;
-- 8
SELECT ce.anyo_inicio AS startingYear, count(asm.id_alumno) AS numRegisteredStudents FROM alumno_se_matricula_asignatura asm  RIGHT JOIN universidad.curso_escolar ce on asm.id_curso_escolar = ce.id  GROUP BY ce.anyo_inicio;
-- 9
SELECT pr.id_profesor, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS numSubjects FROM asignatura a RIGHT JOIN profesor pr ON a.id_profesor = pr.id_profesor LEFT JOIN persona p ON pr.id_profesor = p.id GROUP BY pr.id_profesor ORDER BY numSubjects DESC;
-- 10
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
-- 11
SELECT p.* FROM persona LEFT JOIN profesor on persona.id = profesor.id_profesor LEFT JOIN asignatura on profesor.id_profesor = asignatura.id_profesor WHERE persona.tipo = 'profesor' and asignatura.id_profesor is null;