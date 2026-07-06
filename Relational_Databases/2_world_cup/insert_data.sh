#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.


#Purga las tablas para evitar duplicidad
echo $($PSQL "TRUNCATE TABLE teams, games")

#El "Internal Field Separator" identifica las columnas, en este caso, por una ",".
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  #Ignora la primera lìnea (cabecera del csv)
  if [[ $YEAR != "year" ]]
  
  then

    #INSERCION TABLA TEAMS
    
    #WINNER

    #Preguntar a la base si existe el ID
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER' ")

    #Si el ID no existe, se inserta
    if [[ -z $WINNER_ID ]]
    then

      #Inserción del equipo en la tabla
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")

      #Confirmación de carga exitosa
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        echo "Nuevo equipo registrado: $WINNER"
      fi

      #Volvemos a consultar el ID ya creado para actualizar la "libreta de notas" de Bash y la posterior carga de datos en la table "games"
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")


    #OPPONENT
    
    #Preguntar a la base si existe el ID
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT' ")

     #Si el ID no existe, se inserta
    if [[ -z $OPPONENT_ID ]]
    
    then
    
      #Inserción del equipo en la tabla
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

       #Confirmación de carga exitosa
       if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
       then
         echo "Nuevo equipo registrado: $OPPONENT"
       fi

        #Volvemos a consultar el ID ya creado
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    fi


    #INSERCIÓN TABLA GAMES

    # 1. Ensamblar todas las variables en un solo comando INSERT
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games( year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")

    #Comprobar la carga e imprimir el resultado
      #Busqueda no exacta (==) sino flexible (=~) en el caso existan espacios ocultos
    if [[ -z $INSERT_GAME_RESULT =~ "INSERT INTO 0 1" ]]
    then
      echo "Partido registrado: $YEAR - $ROUND ($WINNER vs $OPPONENT)"
    fi
  fi
done
