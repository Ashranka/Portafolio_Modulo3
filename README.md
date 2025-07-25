# 🎓 Plataforma de Cursos en Línea - Base de Datos

Este proyecto implementa una base de datos relacional en MySQL para gestionar una plataforma de cursos online. El sistema permite registrar estudiantes, profesores, cursos e inscripciones, cumpliendo con los principios de modelado relacional y consultas SQL.

## 📁 Estructura del Proyecto

- `modelo/`: Diagrama entidad-relación (ER)
- `ddl/`: Script SQL para creación de tablas y relaciones
- `dml/`: Operaciones CRUD: inserciones, actualizaciones y eliminaciones
- `consultas/`: Consultas SELECT, JOIN y agrupaciones
- `triggers/`: Trigger de validación para evitar inscripciones duplicadas

## 🚀 Instrucciones de Uso

1. Abre tu cliente MySQL o Workbench.
2. Ejecuta el script de creación de base de datos y tablas desde `ddl/crear_tablas.sql`.
3. Inserta datos con los scripts en `dml/inserts.sql`.
4. Explora la base de datos utilizando los scripts de `consultas/`.
5. Revisa el trigger en `triggers/inscripcion_validation.sql` para ver lógica de automatización.

## 🧠 Funcionalidades Destacadas

- Gestión de estudiantes, profesores, cursos e inscripciones.
- Relaciones uno a muchos con claves foráneas.
- Prevención automática de inscripciones duplicadas mediante `TRIGGER`.
- Consultas con `JOIN`, `GROUP BY`, y filtros personalizados.



