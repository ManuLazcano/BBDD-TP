CREATE DATABASE SoftGestion;
USE SoftGestion;

CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60),
    presupuesto DOUBLE
);

CREATE TABLE proyectos(
	id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(50) NOT NULL,
    id_cliente INT,
    horas_trabajadas INT,
    CONSTRAINT fk_clientes
    FOREIGN KEY (id_cliente)
		REFERENCES clientes(id_cliente)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

CREATE TABLE roles(
	id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(60)
);

CREATE TABLE legajos(
	id_legajo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    dni INT NOT NULL UNIQUE,
    email VARCHAR(60) NOT NULL UNIQUE,
    fecha_nacimiento DATE NOT NULL
);

CREATE TABLE participantes(
	id_participante INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT,
    id_rol INT,
    id_legajo INT,
    horas_trabajadas INT,
    horas_mensuales_asignadas INT,
    CONSTRAINT fk_proyectos
    FOREIGN KEY (id_proyecto)
		REFERENCES proyectos(id_proyecto)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
	CONSTRAINT fk_roles
    FOREIGN KEY (id_rol)
		REFERENCES roles(id_rol)
		ON UPDATE RESTRICT
        ON DELETE RESTRICT,
	CONSTRAINT fk_legajos
    FOREIGN KEY (id_legajo)
		REFERENCES legajos(id_legajo)
		ON DELETE RESTRICT
        ON UPDATE RESTRICT
);

CREATE TABLE logsHoras(
	id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_participante INT,
    diario INT,
    semanal INT,
    mensual INT,
    ajuste INT,
    CONSTRAINT fk_participantes
    FOREIGN KEY(id_participante)
		REFERENCES participantes(id_participante)
		ON DELETE RESTRICT
        ON UPDATE RESTRICT
);

CREATE TABLE ajustesLiq(
	id_ajuste INT AUTO_INCREMENT PRIMARY KEY,
    id_participante INT,
    ajuste INT,
    CONSTRAINT fk_participantes_ajusteLiq
    FOREIGN KEY(id_participante)
		REFERENCES participantes(id_participante)
		ON DELETE RESTRICT
        ON UPDATE RESTRICT
);

CREATE TABLE liquidaciones(
	id_liquidacion INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT,
    id_ajuste INT,
    nombre_proyecto VARCHAR(60),
    totalHoras INT,
	CONSTRAINT fk_proyectos_liquidaciones
    FOREIGN KEY (id_proyecto)
		REFERENCES proyectos(id_proyecto)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
	CONSTRAINT fk_ajustes
    FOREIGN KEY (id_ajuste)
		REFERENCES ajustesLiq(id_ajuste)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);