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

