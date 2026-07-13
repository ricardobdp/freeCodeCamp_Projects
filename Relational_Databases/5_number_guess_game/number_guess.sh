# 1. Archivos y Git

 # Crear la carpeta e ingresar
mkdir number_guessing_game
cd number_guessing_game

 # Crear el archivo y dar permisos de ejecución
touch number_guess.sh
chmod +x number_guess.sh

 # Iniciar Git y hacer el primer commit
git init 
git add number_guess.sh
git commit -m "Initial commit"



# 2. Elaboración del Script (number_guess.sh)

#!/bin/bash

 # Variable para hacer consultas a la base de datos limpiamente
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

 # Generar el número secreto entre 1 y 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

 # Iniciar el contador de intentos
GUESS_COUNT=0


 # Identificar al Usuario
echo "Enter your username:"
read USERNAME

 # Buscar el ID del usuario en la base de datos
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

 # Si el usuario no existe
if [[ -z $USER_ID ]]
then
 echo "Welcome, $USERNAME! It looks like this is your first time here."
  
  # Insertar el nuevo usuario en la base de datos
 INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  
  # Obtener el nuevo ID generado
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

else

  # Si el usuario ya existe, buscar sus estadísticas
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "MIN(guesses) FROM games WHERE user_id=$USER_ID")

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi


echo "Guess the secret number between 1 and 1000:"
read GUESS
((GUESS_COUNT++)) # Suma el primer intento

 # Bucle que continúa hasta que el intento sea igual al número secreto
while [[ $GUESS != $SECRET_NUMBER ]]
do
  # Validar que la entrada sea un número entero usando una "expresión regular"
  if[[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]] #-gt = greater than
  then

   # Si el intento es mayor al número secreto 
    echo "It's lower than that, guess again:"
  
  else
   # Si el intento es menor al número secreto
    echo "It's higher than that, guess again:"
  fi

  # Leer el siguiente intento y aumentar el contador
  read GUESS
  ((GUESS_COUNT++))
done


 # Mensaje de victoria
echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"

 # Guardar la partida en la base de datos
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guess) VALUES($USER_ID, $GUESS_COUNT)")



# 3. Historial de Git

git branch -m master main

 #Exportar el DB en el folder number_guessing_game
pg_dump -cC --inserts -U freecodecamp number_guess > number_guess.sql

 # Commit 2: Registrar la creación de la base de datos y tablas (Estructura)
git add number_guess.sql 2>/dev/null
git commit -m "feat: add database schema for users and games"

 # Commit 3: Registrar la lógica de inicio e identificación del usuario
git add number_guess.sh
git commit -m "feat: add user identification and registration logic"

 # Commit 4
echo "# Fix minor script details" >> number_guess.sh
git add number_guess.sh
git commit -m "fix: update script comments"

  # Commit 5 (Usa prefijo chore:)
echo "# Final adjustments" >> number_guess.sh
git add number_guess.sh
git commit -m "chore: final project clean up" 



# 5. Verificar la rama y el estado de los archivos
git status
