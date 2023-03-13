  #!/bin/bash

  PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

  GET_ELEMET_DETAILS(){
  if [[ -z $1 ]]
  # If not
  then
    EXIT "Please provide an element as an argument."

  # Check if element is found when number is provided
  elif [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
    # Exit if element not found
    if [[ -z $ELEMENT_ID ]]
    then
      EXIT "I could not find that element in the database."
    fi
    ELEMENT_DETAILS=$($PSQL "select atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type from elements join properties using (atomic_number) join types using (type_id) where atomic_number=$ELEMENT_ID;")
    
    echo "$ELEMENT_DETAILS" | while read NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELT_POINT BAR BOIL_POINT BAR TYPE
      do
        echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."
      done

      EXIT
  # Check if element is found when name or symbol are provided
  elif [[ ! $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE symbol like '$1' OR name like '$1'")
    if [[ -z $ELEMENT_ID ]]
    then
      EXIT "I could not find that element in the database."
    fi
    ELEMENT_DETAILS=$($PSQL "select atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type from elements join properties using (atomic_number) join types using (type_id) where atomic_number=$ELEMENT_ID;")
    
    echo "$ELEMENT_DETAILS" | while read NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELT_POINT BAR BOIL_POINT BAR TYPE
      do
        echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."
      done

      EXIT
  fi

  }
  EXIT(){
    if [[ $1 ]]
    then
      echo "$1"
    else
      :
    fi
    exit
  }

  GET_ELEMET_DETAILS $1