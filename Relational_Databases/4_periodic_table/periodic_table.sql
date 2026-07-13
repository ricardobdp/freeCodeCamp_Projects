psql --username=freecodecamp --dbname=periodic_table

--1. Renombrar columnas y aplicar las restricciones

-- Renombrar columnas en la tabla properties
ALTER TABLE properties RENAME COLUMN weight TO atomic_mass; 
ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius; 
ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius; 

-- Restricciones tabla properties
ALTER TABLE properties ALTER COLUMN melting_point_celcius SET NOT NULL; 
ALTER TABLE properties ALTER COLUMN boiling_point_celcius SET NOT NULL;

-- Restricciones tabla elements
ALTER TABLE elements
  ADD CONSTRAINT symbol_unique UNIQUE (symbol),
  ADD CONSTRAINT name_unique UNIQUE (name),
  ALTER COLUMN symbol SET NOT NULL,
  ALTER COLUMN name SET NOT NULL;

-- Establecer la FK de atomic_number
ALTER TABLE properties
  ADD FOREIGN KEY (atomic_number) REFERENCES elements(atomic_number);

---------------------------------------------------------------------------------------

-- 2.- Crear tabla types y actualizar información

-- Crear tabla types
CREATE TABLE types(
  type_id SERIAL PRIMARY KEY,
  type VARCHAR(25) NOT NULL
);

-- Insertar los diferentes "tipos" únicos que existen en properties
INSERT INTO types(type) SELECT DISTINCT(type) FROM properties;

-- Agregar la columna de fk a properties
ALTER TABLE properties ADD COLUMN type_id INT;

-- Vincular los type_id correctos basándose en el texto de properties.type
UPDATE properties SET type_id = types.type_id FROM types WHERE properties.type = types.type;

-- Hacer que type_id sea obligatorio y añadir la relación de fk
ALTER TABLE properties
  ALTER COLUMN type_id SET NOT NULL,
  ADD FOREIGN KEY (type_id) REFERENCES types(type_id);

-- Eliminar columna obsoleta type.properties
ALTER TABLE properties DROP COLUMN type;

---------------------------------------------------------------------------------------

-- 3. Limpieza de Datos(Formateo)

-- Capitalizar la primera letra de todos los symbol
UPDATE elements SET symbol = INITCAP(symbol);

-- Cambiar el tipo de dato a DECIMAL y remover los ceros a la derecha
ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL;
UPDATE properties SET atomic_mass = atomic_mass::FLOAT;

-- Elminar el elemento falso indicado
DELETE FROM properties WHERE atomic_number = 1000;
DELETE FROM elements WHERE atomic_number = 1000;

---------------------------------------------------------------------------------------

-- 4. Insertar elementos indicados

-- Inserta Fluorine
INSERT INTO elements(atomic_number, symbol, name) VALUES(9, 'F', 'Fluorine');
INSERT INTO properties(atomic_number, atomic_mass, melting_point_celcius, boiling_point_celcius, type_id) VALUES(9, 18.998, -220, -188.1, (SELECT type_id FROM types WHERE type = 'nonmetal'));

-- Insertar Neon
INSERT INTO elements(atomic_number, symbol, name) VALUES(10, 'Ne', 'Neon');
INSERT INTO properties(atomic_number, atomic_mass, melting_point_celcius, boiling_point_celcius, type_id) VALUES(10, 20.18, -248.6, -246.1, (SELECT type_id FROM types WHERE type = 'nonmetal'));
