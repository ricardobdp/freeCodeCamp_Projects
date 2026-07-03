#!/bin/bash

# Usamos --tuples-only para que psql no imprima los encabezados de las tablas (columnas) y sea más fácil leer los datos.
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "\nWelcome to My Salon, how can I help you?\n"

MAIN_MENU(){
  
  # Si la función recibe un argumento ($1), lo imprime
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # Obtener los servicios de la base de datos
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

  # Lista de servicios con el formato "#) <service>"
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done


  read SERVICE_ID_SELECTED

  # Buscar el nombre del servicio elegido
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  # Si el servicio no existe
  if [[ -z $SERVICE_NAME ]]
  then

    # Volvemos a llamar a la función con el mensaje de error
    MAIN_MENU "I could not find that service. What would you like today?"
    else
    
    # Pedir teléfono
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    # Buscar el nombre del cliente por su teléfono
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # Si el cliente no existe
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      # Insertar el nuevo cliente en la base de datos
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    fi

    # Limpiar espacios en blanco de las variables
    FORMATTED_SERVICE_NAME=$(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')
    FORMATTED_CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')

    # Pedir la hora usando las variables limpias
    echo -e "\nWhat time would you like your $FORMATTED_SERVICE_NAME, $FORMATTED_CUSTOMER_NAME?"
    read SERVICE_TIME

    # Obtener el ID del cliente
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # Insertar la cita en la tabla appointments
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    # Mostrar mensaje final
    echo -e "\nI have put you down for a $FORMATTED_SERVICE_NAME at $SERVICE_TIME, $FORMATTED_CUSTOMER_NAME."
  fi
}

MAIN_MENU
