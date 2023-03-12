#! /bin/bash

echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?\n"

IFS=$'\n' SERVICES=($(psql --username=freecodecamp --dbname=salon -tA -c "select name from services"))
IFS=$'\n' SERVICE_IDS=($(psql --username=freecodecamp --dbname=salon -tA -c "select service_id from services"))

# Print all services offered

for ((i=0; i<${#SERVICES[@]}; i++))
do
  echo "${SERVICE_IDS[$i]}) ${SERVICES[$i]}"
done

read SERVICE_ID_SELECTED
IS_SERVICE_PRESENT=0

for I in "${SERVICE_IDS[@]}"
do
    if [ "$I" -eq "$SERVICE_ID_SELECTED" ]
    then
        INDEX=$I
        IS_SERVICE_PRESENT=1
    fi
done


# Check if response does not fit in the presented options
if [[ $IS_SERVICE_PRESENT != 1 ]]
then
  until [[ $IS_SERVICE_PRESENT = 1 ]]
  do 
    echo -e "\nI could not find that service. What would you like today?"
    
    for ((i=0; i<${#SERVICES[@]}; i++))
    do
      echo "${SERVICE_IDS[$i]}) ${SERVICES[$i]}"
    done
    read SERVICE_ID_SELECTED

    for I in "${SERVICE_IDS[@]}"
    do
      if [ "$I" -eq "$SERVICE_ID_SELECTED" ]
      then
          IS_SERVICE_PRESENT=1
      fi
    done

  done
fi

echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

# Check if a cusotmer with that phone number exists
PHONE_RESULT=$(psql --username=freecodecamp --dbname=salon -tA -c "select customer_id from customers where phone='$CUSTOMER_PHONE'")

# Add to DB if not existing
if [[ -z $PHONE_RESULT ]]
then
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  INSERT_CUSTOMER_RESULT=($(psql --username=freecodecamp --dbname=salon -tA -c "insert into customers(name, phone) values('$CUSTOMER_NAME','$CUSTOMER_PHONE')"))
fi

CUSTOMER_NAME=$(psql --username=freecodecamp --dbname=salon -tA -c "select name from customers where phone='$CUSTOMER_PHONE'")

echo -e "\nWhat time would you like your ${SERVICES[$INDEX-1]}, $CUSTOMER_NAME?"
read SERVICE_TIME

INSERT_APPOINTMENT_RESULT=$(psql --username=freecodecamp --dbname=salon -tA -c "insert into appointments(customer_id, service_id, time) values((select customer_id from customers where phone='$CUSTOMER_PHONE'), '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")

echo -e "\nI have put you down for a ${SERVICES[$INDEX-1]} at $SERVICE_TIME, $CUSTOMER_NAME."