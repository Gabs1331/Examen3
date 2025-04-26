CREATE DATABASE ControlVacunas;
GO

USE ControlVacunas;
GO

-- Tabla de Tipos de Vacunas
CREATE TABLE TiposVacuna (
    TipoId INT PRIMARY KEY IDENTITY(1,1),
    NombreTipo NVARCHAR(100) NOT NULL
);

-- Tabla de Vacunas Aplicadas
CREATE TABLE Vacunas (
    Id INT PRIMARY KEY IDENTITY(1,1),
    NumeroVacuna NVARCHAR(50),
    TipoId INT,
    FechaAplicacion DATE,
    Paciente NVARCHAR(150),
    Dosis NVARCHAR(50),
    FOREIGN KEY (TipoId) REFERENCES TiposVacuna(TipoId)
);
GO

--CRUD

-- Insertar una vacuna
CREATE PROCEDURE sp_InsertarVacuna
    @NumeroVacuna NVARCHAR(50),
    @TipoId INT,
    @FechaAplicacion DATE,
    @Paciente NVARCHAR(150),
    @Dosis NVARCHAR(50)
AS
BEGIN
    INSERT INTO Vacunas (NumeroVacuna, TipoId, FechaAplicacion, Paciente, Dosis)
    VALUES (@NumeroVacuna, @TipoId, @FechaAplicacion, @Paciente, @Dosis)
END
GO

-- Actualizar una vacuna
CREATE PROCEDURE sp_ModificarVacuna
    @Id INT,
    @NumeroVacuna NVARCHAR(50),
    @TipoId INT,
    @FechaAplicacion DATE,
    @Paciente NVARCHAR(150),
    @Dosis NVARCHAR(50)
AS
BEGIN
    UPDATE Vacunas
    SET NumeroVacuna = @NumeroVacuna,
        TipoId = @TipoId,
        FechaAplicacion = @FechaAplicacion,
        Paciente = @Paciente,
        Dosis = @Dosis
    WHERE Id = @Id
END
GO

-- Eliminar vacuna
CREATE PROCEDURE sp_EliminarVacuna
    @Id INT
AS
BEGIN
    DELETE FROM Vacunas WHERE Id = @Id
END
GO
CREATE PROCEDURE sp_ConsultarVacunasPorTipo
    @TipoId INT
AS
BEGIN
    SELECT * FROM Vacunas WHERE TipoId = @TipoId;
END;
GO

CREATE PROCEDURE sp_ReporteVacunasPorTipo
AS
BEGIN
    SELECT t.NombreTipo, COUNT(v.Id) AS CantidadVacunas
    FROM TiposVacuna t
    LEFT JOIN Vacunas v ON t.Id = v.TipoId
    GROUP BY t.NombreTipo;
END;
