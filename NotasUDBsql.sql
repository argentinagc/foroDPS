CREATE DATABASE UDB_Virtual_Notas;

USE UDB_Virtual_Notas;

CREATE TABLE Estudiantes (
    EstudianteID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    FechaNacimiento DATE,
    CorreoElectronico VARCHAR(100)
);

CREATE TABLE Profesores (
    ProfesorID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    CorreoElectronico VARCHAR(100)
);

CREATE TABLE Asignaturas (
    AsignaturaID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100),
    UV INT
);

CREATE TABLE Clases (
    ClaseID INT PRIMARY KEY IDENTITY(1,1),
    ProfesorID INT,
    AsignaturaID INT,
    Horario VARCHAR(50),
    Aula VARCHAR(50),
    FOREIGN KEY (ProfesorID) REFERENCES Profesores(ProfesorID),
    FOREIGN KEY (AsignaturaID) REFERENCES Asignaturas(AsignaturaID)
);

CREATE TABLE Evaluaciones (
    EvaluacionID INT PRIMARY KEY IDENTITY(1,1),
    ClaseID INT,
    Tipo VARCHAR(50),
    Descripcion VARCHAR(200),
    Fecha DATE,
    Maximo_Puntaje DECIMAL(5, 2), 
    FOREIGN KEY (ClaseID) REFERENCES Clases(ClaseID)
);

CREATE TABLE Notas (
    NotaID INT PRIMARY KEY IDENTITY(1,1),
    EstudianteID INT,
    EvaluacionID INT,
    Nota DECIMAL(5, 2), 
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    FOREIGN KEY (EvaluacionID) REFERENCES Evaluaciones(EvaluacionID)
);

CREATE TABLE Clase_Estudiante (
    ClaseEstudianteID INT PRIMARY KEY IDENTITY(1,1),
    ClaseID INT,
    EstudianteID INT,
    FOREIGN KEY (ClaseID) REFERENCES Clases(ClaseID),
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID)
);


INSERT INTO Estudiantes (Nombre, Apellido, FechaNacimiento, CorreoElectronico) VALUES
('Juan', 'Perez', '2000-02-15', 'juan.perez@example.com'),
('Maria', 'Gomez', '1999-11-22', 'maria.gomez@example.com'),
('Carlos', 'Lopez', '2001-07-30', 'carlos.lopez@example.com'),
('Ana', 'Martinez', '2000-04-18', 'ana.martinez@example.com'),
('Luis', 'Rodriguez', '2001-12-05', 'luis.rodriguez@example.com');

INSERT INTO Profesores (Nombre, Apellido, CorreoElectronico) VALUES
('Jose', 'Garcia', 'jose.garcia@example.com'),
('Elena', 'Diaz', 'elena.diaz@example.com'),
('Pedro', 'Morales', 'pedro.morales@example.com');

INSERT INTO Asignaturas (Nombre, UV) VALUES
('Matemáticas', 3),
('Historia', 2),
('Programación', 4);

INSERT INTO Clases (ProfesorID, AsignaturaID, Horario, Aula) VALUES
(1, 1, 'Lunes 8:00 AM', 'Aula 101'),
(2, 2, 'Martes 10:00 AM', 'Aula 102'),
(3, 3, 'Miércoles 1:00 PM', 'Aula 103');

INSERT INTO Clase_Estudiante (ClaseID, EstudianteID) VALUES
(1, 1), 
(2, 2), 
(3, 3),  
(1, 4),  
(2, 5); 

INSERT INTO Evaluaciones (ClaseID, Tipo, Descripcion, Fecha, Maximo_Puntaje) VALUES
(1, 'Examen', 'Examen Parcial 1', '2024-05-10', 100),
(2, 'Proyecto', 'Proyecto Final', '2024-06-15', 100),
(3, 'Examen', 'Examen Parcial 2', '2024-05-20', 100);

INSERT INTO Notas (EstudianteID, EvaluacionID, Nota) VALUES
(1, 1, 85.5),  
(2, 2, 92.0),  
(3, 3, 78.0), 
(4, 1, 88.0), 
(5, 2, 90.0);  

