CREATE TABLE Lugar (
	id_lugar INT PRIMARY KEY,
	Nombre VARCHAR(255),
	pais VARCHAR(255),
	region VARCHAR(255)
);

CREATE TABLE Beneficiarios (
	ed_beneficiario INT PRIMARY KEY,
	nombre VARCHAR(255)
);

CREATE TABLE Estado (
	id_estado INT PRIMARY KEY,
	nombre VARCHAR(255)
);

CREATE TABLE Fecha (
	id_fecha INT PRIMARY KEY,
	apertura TIMESTAMP,
	cierre TIMESTAMP,
	prorroga TIMESTAMP,
	inscripcion TIMESTAMP,
	vencimiento TIMESTAMP,
	duracion TIMESTAMP,
	aprobacion TIMESTAMP,
	ultima_actualizacion TIMESTAMP
);

CREATE TABLE Modalidad (
	id_modalidad INT PRIMARY KEY,
	nombre VARCHAR(255)
);

CREATE TABLE Idioma (
	id_idioma INT PRIMARY KEY,
	nombre VARCHAR(255)
);

CREATE TABLE Instrumento (
	id_instrumento INT PRIMARY KEY,
	nombre VARCHAR(255)
);

CREATE TABLE Fondo (
	id_fondo INT PRIMARY KEY,
	nombre VARCHAR(255)
);

CREATE TABLE Area_Conocimiento (
	id_area_conocimiento INT PRIMARY KEY,
	nombre VARCHAR(255)
);

CREATE TABLE Nivel (
	id_nivel INT PRIMARY KEY,
	nombre VARCHAR(255)
);

CREATE TABLE Tipo_Linea (
	id_tipo_linea INT PRIMARY KEY,
	nombre VARCHAR(255)
);

CREATE TABLE Tipo_Fuente (
	id_tipo INT PRIMARY KEY,
	nombre VARCHAR(255)
);

CREATE TABLE Sector (
	id_sector INT PRIMARY KEY,
	nombre VARCHAR(255)
);

CREATE TABLE Fuente (
	id_fuente INT PRIMARY KEY,
	nombre VARCHAR(255),
	id_tipo_fuente INT,
	id_sector INT
);

CREATE TABLE Lineas (
	id_linea INT PRIMARY KEY,
	id_tipo_linea INT,
	id_lugar INT,
	id_beneficiario INT,
	id_estado INT,
	id_fecha INT,
	id_modalidad INT,
	id_idioma INT,
	id_instrumento INT,
	id_fuente INT,
	id_fondo INT,
	id_area_conocimiento INT,
	id_nivel INT,
	titulo VARCHAR(255),
	descripcion VARCHAR(1000),
	objetivos VARCHAR(255),
	categoria VARCHAR(255),
	subcategoria VARCHAR(255),
	precio INT, 
	palabras_clave VARCHAR(255),
	topico VARCHAR(255),
	institucion_socia VARCHAR(255),
	vacante VARCHAR(255),
	requisitos VARCHAR(1000),
	documentacion VARCHAR(1000),
	incopatibilidades VARCHAR(1000),
	tipo_evento VARCHAR(255),
	monto_del_compromiso INT,
	servicios_consultoria_requeridos VARCHAR(255),
	categoria_riesgo_ambiental VARCHAR(255),
	categoria_riesgo_social VARCHAR(255),
	posicion_empleo VARCHAR(255),
	temas VARCHAR(255),
	subtemas VARCHAR(255),
	monto_premio INT,
	premios VARCHAR(255),
	criterio_valoracion VARCHAR(255),
	socios VARCHAR(255),
	id_publicacion INT,
	id_proyecto INT,
	id_capacitacion INT,
	id_concurso INT,
	id_noticia INT,
	id_webinar INT
);


CREATE TABLE Tipo_Estudio (
	id_tipo_estudio INT PRIMARY KEY,
	nombre VARCHAR (255)
);

CREATE TABLE Publicacion (
	id_publicacion INT PRIMARY KEY,
	id_tipo_estudio INT,
	autor_a INT
);

CREATE TABLE Proyecto (
	id_proyecto INT PRIMARY KEY,
	etapa VARCHAR (255),
	investigador_a INT
);

CREATE TABLE Capacitacion (
	id_capacitacion INT PRIMARY KEY,
	curso VARCHAR (255),
	expositor_a INT
);

CREATE TABLE Concurso (
	id_concurso INT PRIMARY KEY,
	bases VARCHAR (1000),
	resultados VARCHAR (255),
	reglamento VARCHAR (1000),
	cronograma VARCHAR (255),
	proceso_seleccion VARCHAR (1000),
	confidencialidad VARCHAR (1000),
	difusion VARCHAR (1000),
	jurado INT
);

CREATE TABLE Noticia_Nov (
	id_noticia INT PRIMARY KEY,
	cant_palabras INT
);

CREATE TABLE Webinar (
	id_webinar INT PRIMARY KEY,
	posiciones_ocupadas INT
);

CREATE TABLE Persona (
	id_persona INT PRIMARY KEY,
	nombre VARCHAR (255),
	apellido VARCHAR (255),
	especializacion VARCHAR (255)
);

CREATE TABLE Publicacion_Persona (
	id_publicacion_persona INT PRIMARY KEY
);

CREATE TABLE Proyecto_Persona (
	id_proyecto_persona INT PRIMARY KEY
);

CREATE TABLE Capacitacion_Persona (
	id_capacitacion_persona INT PRIMARY KEY
);

CREATE TABLE Concurso_Persona (
	id_concurso_persona INT PRIMARY KEY
);


-- AGREGO FK:
	--FUENTE:
ALTER TABLE Fuente
ADD CONSTRAINT fk_tipo_fuente FOREIGN KEY (id_tipo_fuente) REFERENCES Tipo_Fuente(id_tipo);

ALTER TABLE Fuente
ADD CONSTRAINT fk_sector FOREIGN KEY (id_sector) REFERENCES Sector(id_sector);

	--LINEA:
ALTER TABLE Lineas
ADD CONSTRAINT fk_beneficiario FOREIGN KEY (id_beneficiario) REFERENCES Beneficiarios(ed_beneficiario);

ALTER TABLE Lineas
ADD CONSTRAINT fk_estado FOREIGN KEY (id_estado) REFERENCES Estado(id_estado);

ALTER TABLE Lineas
ADD CONSTRAINT fk_fecha FOREIGN KEY (id_fecha) REFERENCES Fecha(id_fecha);

ALTER TABLE Lineas
ADD CONSTRAINT fk_modalidad FOREIGN KEY (id_modalidad) REFERENCES Modalidad(id_modalidad);

ALTER TABLE Lineas
ADD CONSTRAINT fk_idioma FOREIGN KEY (id_idioma) REFERENCES Idioma(id_idioma);

ALTER TABLE Lineas
ADD CONSTRAINT fk_instrumento FOREIGN KEY (id_instrumento) REFERENCES Instrumento(id_instrumento);

ALTER TABLE Lineas
ADD CONSTRAINT fk_fuente FOREIGN KEY (id_fuente) REFERENCES Fuente(id_fuente);

ALTER TABLE Lineas
ADD CONSTRAINT fk_area_conocimiento FOREIGN KEY (id_area_conocimiento) REFERENCES Area_Conocimiento(id_area_conocimiento);

ALTER TABLE Lineas
ADD CONSTRAINT fk_nivel FOREIGN KEY (id_nivel) REFERENCES Nivel(id_nivel);

ALTER TABLE Lineas
ADD CONSTRAINT fk_publicacion FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id_publicacion);

ALTER TABLE Lineas
ADD CONSTRAINT fk_proyecto FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto);

ALTER TABLE Lineas
ADD CONSTRAINT fk_capacitacion FOREIGN KEY (id_capacitacion) REFERENCES Capacitacion(id_capacitacion);

ALTER TABLE Lineas
ADD CONSTRAINT fk_concurso FOREIGN KEY (id_concurso) REFERENCES Concurso(id_concurso);

ALTER TABLE Lineas
ADD CONSTRAINT fk_noticia FOREIGN KEY (id_noticia) REFERENCES Noticia_Nov(id_noticia);

ALTER TABLE Lineas
ADD CONSTRAINT fk_webinar FOREIGN KEY (id_webinar) REFERENCES Webinar(id_webinar);

	-- PUBLICACION:
ALTER TABLE Publicacion
ADD FOREIGN KEY (id_tipo_estudio) REFERENCES Tipo_Estudio(id_tipo_estudio);

	-- PROYECTO:
ALTER TABLE Proyecto
ADD FOREIGN KEY (investigador_a) REFERENCES Persona(id_persona);

	-- PUBLICACION-PERSONA:
ALTER TABLE Publicacion_Persona
ADD FOREIGN KEY (id_publicacion_persona) REFERENCES Publicacion(id_publicacion);

ALTER TABLE Publicacion_Persona
ADD FOREIGN KEY (id_publicacion_persona) REFERENCES Persona(id_persona);

	-- PROYECTO-PERSONA:
ALTER TABLE Proyecto_Persona
ADD FOREIGN KEY (id_proyecto_persona) REFERENCES Proyecto(id_proyecto);

ALTER TABLE Proyecto_Persona
ADD FOREIGN KEY (id_proyecto_persona) REFERENCES Persona(id_persona);

	-- CAPACITACION-PERSONA:
ALTER TABLE Capacitacion_Persona
ADD FOREIGN KEY (id_capacitacion_persona) REFERENCES Capacitacion(id_capacitacion);

ALTER TABLE Capacitacion_Persona
ADD FOREIGN KEY (id_capacitacion_persona) REFERENCES Persona(id_persona);

	-- CONCURSO-PERSONA:
ALTER TABLE Concurso_Persona
ADD FOREIGN KEY (id_concurso_persona) REFERENCES Concurso(id_concurso);

ALTER TABLE Concurso_Persona
ADD FOREIGN KEY (id_concurso_persona) REFERENCES Persona(id_persona);
