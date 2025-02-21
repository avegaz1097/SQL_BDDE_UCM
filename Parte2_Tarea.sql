DROP DATABASE IF EXISTS EMPRESA;
CREATE DATABASE EMPRESA;
USE EMPRESA;

CREATE TABLE departamento (
    codDepto VARCHAR(4) PRIMARY KEY,
    nombreDpto VARCHAR(20) NOT NULL,
    Ciudad VARCHAR(15),
    codDirector VARCHAR(12)
);

CREATE TABLE empleado (
    nDIEmp VARCHAR(12) PRIMARY KEY,
    nomEmp VARCHAR(30),
    sexEmp CHAR(1),
    fecNac DATE,
    fecIncorporacion DATE,
    salEmp FLOAT,
    comisionE FLOAT,
    cargoE VARCHAR(15),
    jefeID VARCHAR(12),
    codDepto VARCHAR(4) NOT NULL,
    FOREIGN KEY (codDepto) REFERENCES departamento(codDepto),
    FOREIGN KEY (jefeID) REFERENCES empleado(nDIEmp) 
);

-- Poblamos departamento
INSERT INTO departamento (codDepto, nombreDpto, Ciudad, codDirector)
VALUES
    ('1000', 'VENTAS', 'MADRID', 1),
    ('1500', 'INVESTIGACIÓN','MADRID',2),
    ('2000', 'MANTENIMIENTO', 'MADRID',3),
    ('2500', 'PRODUCCIÓN', 'MADRID',4),
    ('3000', 'MARKETING', 'VALENCIA',5),
    ('3500', 'CONTABILIDAD', 'VALENCIA',6),
    ('4000', 'RRHH', 'VALENCIA',7),
    ('4500', 'IT', 'VALENCIA',8),
    ('5000', 'LOGÍSTICA', 'BARCELONA',9),
    ('5500', 'FINANZAS', 'BARCELONA',10);

-- Poblamos empleado 
INSERT INTO empleado (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporacion, salEmp, comisionE, cargoE, jefeID, codDepto)
VALUES
	('31.840.269', 'Homero Simpson', 'M', '1982-05-17', '2021-03-17', 52345, 12345, 'Jefe', NULL, 1000),
    ('31.840.270', 'Marge Bouvier', 'F', '1985-11-03', '2023-11-09', 68912, 28912, 'Jefe', NULL, 1500),
    ('31.840.271', 'Bart Simpson', 'M', '1992-07-29', '2019-07-25', 57567, 17567, 'Jefe', NULL, 2000),
    ('31.840.272', 'Lisa Simpson', 'F', '1988-02-14', '2022-02-11', 64123, 24123, 'Jefe', NULL, 2500),
    ('31.840.273', 'Maggie Simpson', 'F', '1995-12-25', '2020-12-22', 59876, 19876, 'Jefe', NULL, 3000),
    ('31.840.274', 'Ned Flanders', 'M', '1981-09-21', '2018-09-20', 62098, 22098, 'Jefe', NULL, 3500),
    ('31.840.275', 'Seymour Skinner', 'M', '1998-04-06', '2024-04-04', 55432, 15432, 'Jefe', NULL, 4000),
    ('31.840.276', 'Montgomery Burns', 'M', '1987-03-19', '2021-03-18', 66789, 26789, 'Jefe', NULL, 4500),
    ('31.840.277', 'Waylon Smithers', 'M', '1990-10-12', '2019-10-10', 50123, 18123, 'Jefe', NULL, 5000),
    ('31.840.278', 'Moe Szyslak', 'M', '1989-06-05', '2022-06-03', 69543, 29543, 'Jefe', NULL, 5500),
    ('31.840.279', 'Apu Nahasapeemapetilon', 'M', '1993-01-31', '2020-01-30', 18567, 21789, 'Secretario','31.840.269', 1000),
    ('31.840.280', 'Barney Gumble', 'M', '1984-08-28', '2018-08-26', 23912, 16543, 'Secretario',  '31.840.270', 1500),
    ('31.840.281', 'Krusty el Payaso', 'M', '1997-11-15', '2023-11-13', 19567, 23123, 'Secretario','31.840.271', 2000),
    ('31.840.282', 'Milhouse Van Houten', 'M', '1986-04-10', '2021-04-09', 21123, 19876, 'Secretario', '31.840.272', 2500),
    ('31.840.283', 'Nelson Muntz', 'M', '1999-09-02', '2019-09-01', 20876, 25432, 'Secretario', '31.840.273', 3000),
    ('31.840.284', 'Otto Mann', 'M', '1983-07-04', '2022-07-02', 22098, 20123, 'Secretario', '31.840.274', 3500),
    ('31.840.285', 'Comic Book Guy', 'M', '1996-02-29', '2020-02-28', 17432, 27890, 'Secretario', '31.840.275', 4000),
    ('31.840.286', 'Dr. Hibbert', 'M', '1980-12-31', '2018-12-30', 24789, 13567, 'Secretario', '31.840.276', 4500),
    ('31.840.287', 'Clancy Wiggum', 'M', '1991-05-05', '2023-05-04', 18123, 22456, 'Secretario', '31.840.277', 5000),
    ('31.840.288', 'Abraham Simpson', 'M', '1994-08-18', '2021-08-17', 23543, 18901, 'Secretario','31.840.278', 5500),
    ('31.840.289', 'Mona Simpson', 'F', '1982-11-22', '2019-11-21', 28567, 29345, 'Junior', '31.840.269', 1000),
    ('31.840.290', 'Jacqueline Bouvier', 'F', '1985-03-07', '2022-03-06', 31912, 17654, 'Junior','31.840.270', 1500),
    ('31.840.291', 'Patty Bouvier', 'F', '1992-12-19', '2020-12-18', 29567, 24234, 'Junior', '31.840.271', 2000),
    ('31.840.292', 'Selma Bouvier', 'F', '1988-06-16', '2018-06-15', 30123, 20987, 'Junior', '31.840.272', 2500),
    ('31.840.293', 'Mayor Quimby', 'M', '1995-01-01', '2023-01-01', 30876, 26543, 'Junior','31.840.273', 3000),
    ('31.840.294', 'Kearney Zzyzwicz', 'F', '1981-10-11', '2021-10-10', 32098, 11234, 'Junior', '31.840.274', 3500),
    ('31.840.295', 'Jimbo Jones', 'M', '1998-05-23', '2019-05-22', 27432, 28765, 'Junior','31.840.275', 4000),
    ('31.840.296', 'Dolph Starbeam', 'M', '1987-04-04', '2022-04-03', 31789, 19012, 'Junior','31.840.276', 4500),
    ('31.840.297', 'Duffman', 'M', '1990-11-09', '2020-11-08', 28123, 25345, 'Junior','31.840.277', 5000),
    ('31.840.298', 'Waylon Smithers Jr.', 'M', '1989-07-12', '2018-07-11', 29543, 21678, 'Junior', '31.840.278', 5500),
    ('31.840.299', 'Hans Moleman', 'M', '1993-02-28', '2023-02-27', 38567, 14567, 'Senior','31.840.269', 1000),
    ('31.840.300', 'Groundskeeper Willie', 'M', '1984-09-21', '2021-09-20', 45912, 23456, 'Senior', '31.840.270', 1500),
    ('31.840.301', 'Agnes Skinner', 'F', '1997-12-06', '2019-12-05', 39567, 18901, 'Senior', '31.840.271', 2000),
    ('31.840.302', 'Reverendo Lovejoy', 'M', '1986-05-15', '2022-05-14', 42123, 29345, 'Senior', '31.840.272', 2500),
    ('31.840.303', 'Bumblebee Man', 'M', '1999-10-01', '2020-10-01', 40876, 17654, 'Senior', '31.840.273', 3000),
    ('31.840.304', "Krusty's Sidekick", 'M', '1983-08-03', '2018-08-02', 41098, 24234, 'Senior', '31.840.274', 3500),
    ('31.840.305', 'Disco Stu', 'M', '1996-03-20', '2023-03-19', 37432, 20987, 'Senior', '31.840.275', 4000),
    ('31.840.306', 'Captain McCallister', 'M', '1980-01-01', '2021-01-01', 44789, 26543, 'Senior', '31.840.276', 4500),
    ('31.840.307', 'Sideshow Bob', 'M', '1991-06-10', '2019-06-09', 38123, 11234, 'Senior','31.840.277', 5000),
    ('31.840.308', 'Homero Simpson', 'M', '1994-09-11', '2022-09-10', 43543, 28765, 'Senior', '31.840.278', 5500); 
        
-- Consultas 

-- 3. Datos completos de los empleados 
SELECT * FROM empleado;

-- 4. Datos completos de los departamentos 
SELECT * FROM departamento;

-- 5. Datos de los empleados con cargo 'Secretario'
SELECT * FROM empleado WHERE cargoE like 'Secretari_';

-- 6. Nombre y salario de los empleados
SELECT nomEmp, salEmp FROM empleado;

-- 7. Datos de los vendedores, ordenados por nombre
SELECT * FROM empleado WHERE 
	(codDepto = (SELECT codDepto FROM departamento WHERE nombreDpto = 'VENTAS')) 
	AND (cargoE = 'Junior' OR  cargoE= 'Senior') 
ORDER BY nomEmp;

-- 8. Departamentos ordenados por nombre y ciudad en orden ascendente, descendente
SELECT nombreDpto, Ciudad FROM departamento ORDER BY nombreDpto ASC, Ciudad DESC;

-- 9. Nombre y cargo de empleados, ordenado por cargo y salario
SELECT nomEmp, cargoE FROM empleado ORDER BY cargoE, SalEmp;

-- 10. Listar el nombre del departamento cuya suma de salarios sea la más alta
 SELECT d.nombreDpto, SUM(e.salEmp) AS total_salario 
 FROM departamento d INNER JOIN empleado e ON d.codDepto = e.codDepto
 GROUP BY d.nombreDpto
 ORDER BY total_salario DESC LIMIT 1;
 
 -- 11. Salarios y comisiones de los empleados del departamento 2000, ordenado por comisión
 SELECT nomEmp, salEmp, comisionE FROM empleado WHERE codDepto = 2000 ORDER BY comisionE;
 
 -- 12. Listar todas las comisiones que sean diferentes, ordenada por valor.
 SELECT DISTINCT comisionE FROM empleado ORDER BY comisionE;

-- 13. Listar los diferentes salarios
SELECT DISTINCT salEmp FROM empleado;

-- 14. Valor total de suma de salario + 5000 euros a empleados de departamento 3000 ordenado por nombre
SELECT nomEmp, (salEmp + 5000) AS Salario_bonificado FROM empleado WHERE codDepto = 3000 ORDER BY nomEmP;

-- 15. Empleados que ganan una comisión superior a su sueldo.
SELECT nomEmp, salEmp, comisionE FROM empleado WHERE comisionE > salEmp;

-- 16. Empleados cuya comisión es menor o igual que el 30% de su sueldo.
SELECT nomEmp, salEmp, comisionE FROM empleado WHERE comisionE <= salEmp*0.3;

-- 17. Empleados cuyo salario es menor o igual que el 40% de su comisión.
SELECT nomEmp, salEmp, comisionE FROM empleado WHERE comisionE*0.4 >= salEmp;


-- 18.Salario, comisión, el salario total, id y nombre, de empleados con comisión superior a 10.000 €, ordenar por id.
SELECT nomEmp, nDIEmp, salEmp, comisionE, (salEmp + comisionE) as Salario_total FROM empleado WHERE comisionE > 10000 ORDER BY nDIEmp;

-- 19. Empleados que tienen un salario superior a 50.000 €, y tienen como jefe al empleado con documento de identidad '31.840.269’.
SELECT nomEmp, salEmp, jefeID FROM empleado WHERE (salEmp > 50000 AND jefeID = '31.940.269');

-- 20. Nombres de los departamentos que no sean 'VENTAS', 'INVESTIGACIÓN', ni 'MANTENIMIENTO', ordenados por ciudad.
SELECT nombreDpto, Ciudad FROM departamento WHERE nombreDpto NOT IN ('VENTAS', 'INVESTIGACIÓN', 'MANTENIMIENTO') ORDER BY Ciudad;

-- 21. Datos de los empleados cuyo nombre inicia por la letra 'M', su salario es mayor a 40.000 o reciben comisión y trabajan en 'VENTAS’.
SELECT * FROM empleado WHERE (nomEmp LIKE 'M%' AND (salEmp > 40000 OR comisionE > 0) AND codDepto = (SELECT codDepto FROM departamento WHERE nombreDpto = 'VENTAS'));

-- 22. Nombre, salario y comisión de los empleados que reciben un salario entre la mitad de la comisión la propia comisión.
SELECT nomEmp, salEmp, comisionE FROM empleado WHERE salEmp BETWEEN comisionE/2 AND comisionE; 

-- 23. Entregar el salario más alto de la empresa.
SELECT MAX(salEmp) FROM empleado;

-- 24. Entregar el total a pagar por comisiones, y el número de empleados que las reciben.
SELECT SUM(comisionE) AS Total_comisiones, count(*) AS Empleados_con_comision FROM empleado WHERE comisionE > 0;

-- 25. Hallar el salario más alto, el más bajo y la diferencia entre ellos.
SELECT MAX(salEmp) AS Salario_mas_alto, MIN(salEmp) AS Salario_mas_bajo, (MAX(salEmp) - MIN(salEmp)) AS Diferencia FROM empleado;

-- 26. Número de empleados de sexo femenino y de sexo masculino, por departamento
SELECT 
    d.nombreDpto AS Departamento,
    COUNT(CASE WHEN e.sexEmp = 'F' THEN 1 ELSE NULL END) AS Femenino,
    COUNT(CASE WHEN e.sexEmp = 'M' THEN 1 ELSE NULL END) AS Masculino
FROM 
    empleado e
	INNER JOIN departamento d ON e.codDepto = d.codDepto
GROUP BY d.nombreDpto;

-- 27. Hallar el salario promedio por departamento.
SELECT AVG(e.salEmp) AS Salario_Promedio, d.nombreDpto AS Departamento
FROM
	empleado e
	INNER JOIN departamento d ON e.codDepto = d.codDepto
GROUP BY d.nombreDpto;

-- 28. Número de cargos en cada departamento y cual es el promedio de salario de cada uno. Indicar el nombre del departamento en el resultado.

SELECT AVG(e.salEmp) AS Salario_Promedio, d.nombreDpto AS Departamento, COUNT(*) AS Cargos_por_departamento
FROM
	empleado e
	INNER JOIN departamento d ON e.codDepto = d.codDepto
GROUP BY d.nombreDpto;

-- 29. Calcular el total de salarios por departamento.
SELECT d.nombreDpto AS Departamento, SUM(e.salEmp) AS Total_Salarios
FROM
	empleado e
	INNER JOIN departamento d ON e.codDepto = d.codDepto
GROUP BY d.nombreDpto;

-- 30. Hallar la suma de salarios más alta, crear para ello una vista.

CREATE VIEW departamento_mayor_salario AS
SELECT 
    d.nombreDpto, 
    SUM(e.salEmp) AS Total_Salarios
FROM 
    empleado e
	INNER JOIN departamento d ON e.codDepto = d.codDepto
GROUP BY d.nombreDpto
ORDER BY Total_salario DESC
LIMIT 1;
SELECT * FROM departamento_mayor_salario;

