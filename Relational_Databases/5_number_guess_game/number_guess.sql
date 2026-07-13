-- Base de Datos

psql --username=freecodecamp --dbname=postgres

-- Crear la base de datos y conectarse a ella
CREATE DATABASE number_guess;
\c number_guess

-- Crear la tabla users
CREATE TABLE users(
  user_id SERIAL PRIMARY KEY NOT NULL,
  username VARCHAR(22) UNIQUE NOT NULL
);

-- Crear tabla games ligada a users
CREATE table games(
  game_id SERIAL PRIMARY KEY NOT NULL,
  user_id INT REFERENCES users(user_id),
  guesses INT NOT NULL
);
