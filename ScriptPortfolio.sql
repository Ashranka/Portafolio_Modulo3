-- ===============================================================
-- BASE DE DATOS: plataforma_cursos
-- ===============================================================
CREATE DATABASE IF NOT EXISTS plataforma_cursos;
USE plataforma_cursos;

-- ===============================================================
-- TABLAS PRINCIPALES
-- ===============================================================

CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    fecha_registro DATE
);

CREATE TABLE profesores (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(100)
);

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    id_profesor INT,
    FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor)
);

CREATE TABLE inscripciones (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    fecha_inscripcion DATE,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

-- ===============================================================
-- INSERT DE DATOS INICIALES
-- ===============================================================

INSERT INTO estudiantes (nombre, correo, fecha_registro) VALUES
('Carlos Ruiz', 'carlos@example.com', CURDATE()),
('María Soto', 'maria@example.com', CURDATE());

INSERT INTO profesores (nombre, especialidad) VALUES
('Luis Fernández', 'Matemáticas'),
('Ana Rojas', 'Programación');

INSERT INTO cursos (nombre, descripcion, id_profesor) VALUES
('Álgebra Básica', 'Curso introductorio a álgebra.', 1),
('Introducción a Python', 'Curso básico de programación en Python.', 2);

INSERT INTO inscripciones (id_estudiante, id_curso, fecha_inscripcion) VALUES
(1, 1, CURDATE()),
(2, 2, CURDATE()),
(1, 2, CURDATE());

-- ===============================================================
-- CONSULTAS SELECT BÁSICAS
-- ===============================================================

-- Estudiantes registrados
SELECT * FROM estudiantes;

-- Cursos disponibles
SELECT * FROM cursos;

-- ===============================================================
-- CONSULTAS CON JOIN
-- ===============================================================

-- Ver inscripciones con nombres de estudiantes y cursos
SELECT e.nombre AS estudiante, c.nombre AS curso, i.fecha_inscripcion
FROM inscripciones i
JOIN estudiantes e ON i.id_estudiante = e.id_estudiante
JOIN cursos c ON i.id_curso = c.id_curso;

-- Ver cursos con nombres de sus profesores
SELECT c.nombre AS curso, p.nombre AS profesor
FROM cursos c
JOIN profesores p ON c.id_profesor = p.id_profesor;

-- ===============================================================
-- CONSULTAS CON GROUP BY
-- ===============================================================

-- Cantidad de estudiantes inscritos por curso
SELECT c.nombre AS curso, COUNT(i.id_estudiante) AS cantidad_estudiantes
FROM cursos c
JOIN inscripciones i ON c.id_curso = i.id_curso
GROUP BY c.id_curso;

-- ===============================================================
-- OPERACIONES DML: UPDATE Y DELETE
-- ===============================================================

-- Actualizar especialidad de un profesor
UPDATE profesores
SET especialidad = 'Ciencias Exactas'
WHERE id_profesor = 1;

-- Eliminar una inscripción específica
DELETE FROM inscripciones
WHERE id_inscripcion = 1;

-- ===============================================================
-- FIN DEL SCRIPT
-- ===============================================================
