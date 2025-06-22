-- ===================================
--   Esquema Estrella Data Warehouse
--           (PostgreSQL)
-- ===================================

-- ===================================
--   th01_cat_estado_paciente
-- ===================================
CREATE TABLE th01_cat_estado_paciente
(
    id_estado     SERIAL PRIMARY KEY,
    nombre_estado VARCHAR(100) NOT NULL
);

-- ===================================
--   th02_dim_paciente
-- ===================================
CREATE TABLE th02_dim_paciente
(
    id_paciente      SERIAL PRIMARY KEY,
    nombre_completo  VARCHAR(150),
    fecha_afiliacion DATE,
    id_estado        INT REFERENCES th01_cat_estado_paciente (id_estado)
);

-- ===================================
--   th03_dim_hospital
-- ===================================
CREATE TABLE th03_dim_hospital
(
    id_hospital     SERIAL PRIMARY KEY,
    nombre          VARCHAR(255),
    estado_hospital VARCHAR(100)
);

-- ===================================
--   th04_dim_medico
-- ===================================
CREATE TABLE th04_dim_medico
(
    id_medico       SERIAL PRIMARY KEY,
    nombre_completo VARCHAR(255),
    estado_medico   VARCHAR(100)
);

-- ===================================
--   th05_cat_estado_cita
-- ===================================
CREATE TABLE th05_cat_estado_cita
(
    id_estado     SERIAL PRIMARY KEY,
    nombre_estado VARCHAR(100) NOT NULL
);

-- ===================================
--   th06_dim_fecha
-- ===================================
CREATE TABLE th06_dim_fecha
(
    id_fecha SERIAL PRIMARY KEY,
    fecha    DATE
);

-- ===================================
--   th07_cita
-- ===================================
CREATE TABLE th07_cita
(
    id_cita        SERIAL PRIMARY KEY,
    fk_id_fecha    INT REFERENCES th06_dim_fecha (id_fecha),
    fk_id_hospital INT REFERENCES th03_dim_hospital (id_hospital),
    fk_id_medico   INT REFERENCES th04_dim_medico (id_medico),
    fk_id_paciente INT REFERENCES th02_dim_paciente (id_paciente),
    fk_id_estado   INT REFERENCES th05_cat_estado_cita (id_estado)
);

