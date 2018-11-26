-- Country and state names
CREATE TABLE ctry_state (
 oas_code char(2) PRIMARY KEY,
 cs_name  varchar(100) NOT NULL UNIQUE
);

-- Obstruction verification status
CREATE TABLE verif_stat (
 vs_code char(1) PRIMARY KEY,
 vs_desc varchar(10) NOT NULL UNIQUE
);

-- Type of lighting
CREATE TABLE lighting (
 light_code char(1) PRIMARY KEY,
 light_desc varchar(50) NOT NULL UNIQUE
);

-- Type of marking
CREATE TABLE marking (
 mark_code char(1) PRIMARY KEY,
 mark_desc varchar(50) NOT NULL UNIQUE
);

-- Vertical accuracy
CREATE TABLE vacc (
 vacc_code char(1) PRIMARY KEY,
 vacc_tol  varchar(10) NOT NULL,
 vacc_uom  varchar(10) NOT NULL
);

-- Horizontal accuracy
CREATE TABLE hacc (
 hacc_code char(1) PRIMARY KEY,
 hacc_tol  float NOT NULL,
 hacc_uom  varchar(10) NOT NULL
);

-- Obstruction data, points WGS84
CREATE TABLE obstruction (
 rec_id serial PRIMARY KEY,
 oas_code char(2) NOT NULL REFERENCES ctry_state,
 obs_number char(11) NOT NULL,
 vs_code char(1) NOT NULL REFERENCES verif_stat,
 city_name varchar(20) NULL,
 lat_dms char(12) NOT NULL,
 lon_dms char(13) NOT NULL,
 obs_type varchar(20) NOT NULL,
 agl_height float NULL CONSTRAINT check_agl_height_valid_range CHECK (agl_height >= 0 AND agl_height <= 30000),
 amsl_height float NOT NULL CONSTRAINT check_amsl_height_valid_range CHECK (amsl_height >= -10000 AND amsl_height <= 50000),
 lighting_code char(1) NOT NULL REFERENCES lighting,
 h_acc_code char(1) NOT NULL REFERENCES hacc,
 v_acc_code char(1) NOT NULL REFERENCES vacc,
 marking_code char(1) NOT NULL REFERENCES marking,
 last_update timestamp NOT NULL DEFAULT CLOCK_TIMESTAMP(),
 geo_location geography(POINT, 4326)
);