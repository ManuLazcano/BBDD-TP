INSERT INTO clientes(nombre, presupuesto)
	VALUES	('IBM', 2000000),
			('Globant', 300000),
			('Google', 1500000);

INSERT INTO proyectos(nombre_proyecto, id_cliente)
	VALUES	('SoftIBM', 1),
			('SoftGlobant', 2),
            ('SoftGoogle', 3);

INSERT INTO roles(nombre_rol)
	VALUES	('Project Manager'),
			('Developer'),
			('Tester'),
            ('Administrador'),
            ('DevOps');

INSERT INTO legajos(nombre, apellido, dni, email, fecha_nacimiento)
	VALUES	('Isaac', 'Sanchez', 32038744, 'isaacSanchez@gmail.com', '1980-05-11'),
			('German', 'Amaya', 3212744, 'germanAmaya@gmail.com', '1980-03-01'),
            ('Flor', 'Vedia', 34022414, 'florVedia@gmail.com', '1990-01-10-06'),
            ('Diego', 'Espinola', 32066744, 'diegoEspinola@gmail.com', '1985-05-11'),
            ('Ricador', 'Fort', 42038744, 'ricardoFort@gmail.com', '1989-03-20'),
            ('Raul', 'Escobar', 40230442, 'raulEscobar@gmail.com', '1987-07-21'),
            ('Facundo', 'Delgado', 37356744, 'facundoDelgado@gmail.com', '1992-01-13'),
            ('Fernando', 'Lopez', 42337114, 'fernandoLopezgmail.com', '1996-04-27'),
            ('Nadia', 'Rojas', 34023142, 'nadiaRojas@gmail.com', '1997-05-17'),
            ('Belen', 'Luz', 35218744, 'belenLuz@gmail.com', '1980-07-15');
    
INSERT INTO participantes(id_proyecto, id_rol, id_legajo, horas_mensuales_asignadas)
	VALUES 	(1, 2, 1, 15), (1, 2, 2, 15), (1, 3, 3, 10),
			(2, 2, 4, 10), (2, 3, 5, 5), (2, 1, 6, 15),
			(3, 2, 7, 10), (3, 3, 8, 10), (3, 1, 9, 15), (3, 3, 10, 5);
            

            