#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -A -c"

MAIN_MENU(){
  if [[ $1 ]]
  then 
    echo -e "\n$1"  # Display the error message if passed
  fi

  # Displaying the numbered list of services
  echo -e "\nChoisissez le service que vous souhaitez :"
  echo -e "\n1) Clean_The_Dog"
  echo -e "\n2) Walk_The_Dog"
  echo -e "\n3) Pension_For_Your_Dog"
  
  
  # Prompt for user input
  read SERVICE_ID_SELECTED

  # Case statement to handle the user's selection
  case $SERVICE_ID_SELECTED in
    1) Clean_The_Dog;;           # Calls the function for cleaning the dog
    2) Walk_The_Dog;;            # Calls the function for walking the dog
    3) Pension_For_Your_Dog;;    # Calls the function for the dog pension
    *) MAIN_MENU "Merci d'écrire une valeur valable" ;;  # Recursion if input is invalid
  esac
}


Clean_The_Dog(){
  
  echo -e "Merci d'entrer votre numéro de téléphone"
  read CUSTOMER_PHONE
  PHONE_EXISTS=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE' LIMIT 1")
 
# Si le numéro n'est pas dans la base de données
  if [[ -z $PHONE_EXISTS ]]
  then
  echo -e "Merci d'entrer votre nom"
  read CUSTOMER_NAME
  echo -e "Merci d'indiquer quelle heure ou jour vous désirez"
  read SERVICE_TIME
  # On récupère le nom et le numéro pour la base de données
  INSERT_CUSTOMER_TABLE=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  # On récupère le customer_id propre à chaque client
  CUSTOMER_ID_VALUE=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")
  INSERT_CUSTOMER_SERVICE_TIME=$($PSQL "INSERT INTO appointments (time, customer_id, service_id) VALUES('$SERVICE_TIME', '$CUSTOMER_ID_VALUE', '$SERVICE_ID_SELECTED')")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
  echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

  else 
  echo -e "Merci d'indiquer quelle heure ou jour vous désirez"
  read SERVICE_TIME
  # on récupère le customer_id avec le numéro de téléphone
  CUSTOMER_ID_VALUE=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  INSERT_CUSTOMER_SERVICE_TIME=$($PSQL "INSERT INTO appointments (time, customer_id, service_id) VALUES('$SERVICE_TIME', '$CUSTOMER_ID_VALUE', '$SERVICE_ID_SELECTED')")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi

}

Walk_The_Dog(){
  echo -e "Merci d'entrer votre numéro de téléphone"
  read CUSTOMER_PHONE
  PHONE_EXISTS=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE' LIMIT 1")
 
# Si le numéro n'est pas dans la base de données
  if [[ -z $PHONE_EXISTS ]]
  then
  echo -e "Merci d'entrer votre nom"
  read CUSTOMER_NAME
  echo -e "Merci d'indiquer quelle heure ou jour vous désirez"
  read SERVICE_TIME
  # On récupère le nom et le numéro pour la base de données
  INSERT_CUSTOMER_TABLE=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  # On récupère le customer_id propre à chaque client
  CUSTOMER_ID_VALUE=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")
  INSERT_CUSTOMER_SERVICE_TIME=$($PSQL "INSERT INTO appointments (time, customer_id, service_id) VALUES('$SERVICE_TIME', '$CUSTOMER_ID_VALUE', '$SERVICE_ID_SELECTED')")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
  echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

  else 
  echo -e "Merci d'indiquer quelle heure ou jour vous désirez"
  read SERVICE_TIME
  # on récupère le customer_id avec le numéro de téléphone
  CUSTOMER_ID_VALUE=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  INSERT_CUSTOMER_SERVICE_TIME=$($PSQL "INSERT INTO appointments (time, customer_id, service_id) VALUES('$SERVICE_TIME', '$CUSTOMER_ID_VALUE', '$SERVICE_ID_SELECTED')")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

Pension_For_Your_Dog(){
echo -e "Merci d'entrer votre numéro de téléphone"
  read CUSTOMER_PHONE
  PHONE_EXISTS=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE' LIMIT 1")
 
# Si le numéro n'est pas dans la base de données
  if [[ -z $PHONE_EXISTS ]]
  then
  echo -e "Merci d'entrer votre nom"
  read CUSTOMER_NAME
  echo -e "Merci d'indiquer quelle heure ou jour vous désirez"
  read SERVICE_TIME
  # On récupère le nom et le numéro pour la base de données
  INSERT_CUSTOMER_TABLE=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  # On récupère le customer_id propre à chaque client
  CUSTOMER_ID_VALUE=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")
  INSERT_CUSTOMER_SERVICE_TIME=$($PSQL "INSERT INTO appointments (time, customer_id, service_id) VALUES('$SERVICE_TIME', '$CUSTOMER_ID_VALUE', '$SERVICE_ID_SELECTED')")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
  echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

  else 
  echo -e "Merci d'indiquer quelle heure ou jour vous désirez"
  read SERVICE_TIME
  # on récupère le customer_id avec le numéro de téléphone
  CUSTOMER_ID_VALUE=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  INSERT_CUSTOMER_SERVICE_TIME=$($PSQL "INSERT INTO appointments (time, customer_id, service_id) VALUES('$SERVICE_TIME', '$CUSTOMER_ID_VALUE', '$SERVICE_ID_SELECTED')")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}


MAIN_MENU









