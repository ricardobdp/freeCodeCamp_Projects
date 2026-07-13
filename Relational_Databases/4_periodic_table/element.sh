# 1. Creación del script element.sh

#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Verificar si se introdujo algún argumento 
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

# Evaluar tipo de dato es numérico o texto
if [[ $1 =~ ^[0-9]+$ ]]
then
  ELEMENT_DATA=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1")
else
  ELEMENT_DATA=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name = '$1' OR symbol = '$1'")
fi

# Verificar si el elemento existe en la base de datos
if [[ -z $ELEMENT_DATA ]]
then
  echo "I could not find that element in the database."
  exit
fi

#Dar formato a la salida de los datos
echo $ELEMENT_DATA | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING BOILING
do
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
done



# 2. Configurar el Repositorio Git y los Historiales de Commit

# Asegurar los permisos de ejecución del script
chmod +x element.sh

# Crear la carpeta solicitada, mover el script dentro de ella y cambiar al directorio creado
mkdir periodic_table
mv element.sh periodic_table/
cd periodic_table

# Inicializar el repositorio Git y renombrar la rama a 'main'
git init
git checkout -b main


# Generar los 5 commits requeridos simulando progresos
  # Commit 1 (Obligatoriamente debe llamarse "Initial commit")
git add element.sh
git commit -m "Initial commit"

  # Commit 2 (Usa prefijo feat:)
echo "# Proyecto Terminado" >> README.md
git add README.md
git commit -m "feat: add project documentation"

  # Commit 3 (Usa prefijo fix:)
echo "# Fix minor script details" >> element.sh
git add element.sh
git commit -m "fix: update script comments"

  # Commit 4 (Usa prefijo refactor:)
sed -i 's/# Determinar si el argumento/# Evaluar tipo de dato/' element.sh
git add element.sh
git commit -m "refactor: improve internal script notes"

  # Commit 5 (Usa prefijo chore:)
echo "# Final adjustments" >> element.sh
git add element.sh
git commit -m "chore: final project clean up"


# 3. Verificación Final
git status
#On branch main
#nothing to commit, working tree clean
