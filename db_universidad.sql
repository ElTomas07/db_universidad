create database db_universidad;
use db_universidad;
create table departamento(
id_departamento int (10) primary key not null,
nombre varchar(50) not null
);
create table profesor(
id_profesor int (10) primary key not null,
nit varchar (9) not null,
nombre varchar(25) not null,
apellido1 varchar(50) not null,
apellido2 varchar(50) not null,
ciudad varchar (2) not null,
direccion varchar (50) not null,
telefono varchar(9) not null,
fecha_nacimiento date not null,
sexo enum ('H', 'M'),
id_departamento int(10) not null,
foreign key (id_departamento) references departamento(id_departamento)
);
create table grado(
id_grado int(10) primary key not null,
nombre varchar(100) not null
);
create table asignatura(
id_asignatura int(10) primary key not null,
nombre varchar(100),
creditos float not null,
tipo enum('básica', 'obligatoria', 'optativa') not null,
curso tinyint(3),
cuatrimestre tinyint(3),
id_profesor int(10) not null,
id_grado int(10) not null,
foreign key (id_profesor) references profesor(id_profesor),
foreign key (id_grado) references grado(id_grado)
);
create table alumno(
id_alumno int(10) primary key not null,
nit varchar(9) not null,
nombre varchar(25) not null,
apellido1 varchar(50) not null,
apellido2 varchar(50) not null,
ciudad varchar (2) not null,
direccion varchar (50) not null,
telefono varchar(9) not null,
fecha_nacimiento date not null,
sexo enum ('H', 'M')
);
create table curso_escolar(
id_curso_escolar int(10) primary key not null,
anyo_inicio YEAR (4),
anyo_fin YEAR (4)
);
create table alumno_se_matricula_asignatura(
id_alumno int (10) not null,
id_asignatura int (10) not null,
id_curso_escolar int(10) not null,
primary key (id_alumno, id_asignatura, id_curso_escolar),
foreign key (id_alumno) references alumno (id_alumno),
foreign key (id_asignatura) references asignatura (id_asignatura),
foreign key (id_curso_escolar) references curso_escolar (id_curso_escolar)
);

insert into departamento (id_departamento, nombre) values 
(1, 'Quindio'),
(2, 'Quindio'),
(3, 'Risaralda'),
(4, 'Huila'),
(5, 'Tolima');

select * from departamento;

insert into profesor (id_profesor, nit, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento,sexo, id_departamento) values 
(01, '12345678A', 'Juan', 'Duque', 'Botero', 'Armenia', 'Calle 30', '7433333', '2005-06-01', 'H', 1),
(02, '11345678A', 'Nicolas', 'Peña', 'Guevara', 'Calarca', 'Calle 41', '7421331', '2000-12-22', 'H', 2),
(03, '11145678A', 'Sara', 'Marin', 'Sanchez', 'Manizales', 'Calle 11', '7431331', '1995-03-20', 'M', 3),
(04, '11115678A', 'Santiago', 'Ramirez', 'Nuñez', 'Neiva', 'Calle 20', '7436666', '1981-08-08', 'H', 4),
(05, '11111678A', 'Maria', 'Castaño', 'Gil', 'Honda', 'Calle 15', '7424562', '1997-02-27', 'M', 5);

select * from profesor; 

insert into grado (id_grado, nombre) values 
(1, 'Lenguas Modernas'),
(2, 'Biologia'),
(3, 'Fisica'),
(4, 'Derecho'),
(5, 'Topografia');

select * from grado;

insert into asignatura (id_asignatura, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) values 
(1, 'Fonetica', 4.0, 'obligatoria', 1, 1, 01, 1),
(2, 'Bioestadistica', 4.2, 'basica', 2, 2, 02, 2),
(3, 'Propiedades y Transformacion de la Materia', 4.5, 'optativa', 3, 1, 03, 3),
(4, 'Economia', 3.9, 'obligatoria', 1, 2, 04, 4),
(5, 'Geologia', 4.1, 'basica', 2, 1, 05, 5);

select * from asignatura;

insert into alumno (id_alumno, nit, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo) values 
(01, '98765432A', 'Carlos', 'Duque', 'Saenz', 'Armenia', 'Calle 34', '7458333', '2005-03-01', 'H'),
(02, '99876543A', 'Janner', 'Peña', 'Marquez', 'Calarca', 'Calle 61', '7146331', '2000-04-22', 'H'),
(03, '99976543A', 'Mariana', 'Peña', 'Marquez', 'Manizales', 'Calle 18', '7498731', '1995-11-20', 'M'),
(04, '99996543A', 'Brayer', 'Serna', 'Campos', 'Neiva', 'Calle 43', '7436123', '1981-10-08', 'H'),
(05, '99999543A', 'Tatiana', 'Gil', 'Muñoz', 'Honda', 'Calle 22', '7424569', '1997-02-14', 'M');

select * from alumno; 

insert into curso_escolar (id_curso_escolar, anyo_inicio, anyo_fin) values 
    (1, 2023, 2024),
    (2, 2024, 2025),
    (3, 2025, 2026),
    (4, 2022, 2023),
    (5, 2026, 2027);
    
select * from curso_escolar;

insert into alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) values 
(01, 1, 1),
(02, 2, 2),
(03, 3, 3),
(04, 4, 4),
(05, 5, 5);

select * from alumno_se_matricula_asignatura;