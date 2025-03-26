#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# on calcule un nombre aléatoire
random_number=$((RANDOM % 1000 + 1))


# on enregistre le username
echo -e "\nEnter your username:"
read username
while [[ ${#username} -gt 22 ]]; do
  echo -e "\nThe username is too long! Please enter a username with 22 characters or less:"
  read username
done



echo $random_number

# on vérifie si le username existe dans la base de donnés
USER_database=$($PSQL "SELECT username FROM players WHERE username='$username'")

# si il existe : 
if [[ $USER_database ]]
then 
echo -e "\nWelcome back, $username! You have played $($PSQL "SELECT games_played FROM players WHERE username='$username'") games, and your best game took $($PSQL "SELECT best_game FROM players WHERE username='$username'") guesses. "

# si il n'existe pas
elif [[ -z $USER_database ]]
then
echo -e "\nWelcome, $username! It looks like this is your first time here."
New_user=$($PSQL "INSERT INTO players (username) VALUES ('$username')")
fi

# on enregistre le guess de l'utilisateur et on enregistre sa participation
echo -e "\nGuess the secret number between 1 and 1000:"
read Number

while ! [[ "$Number" =~ ^-?[0-9]+$ ]]; 
do
echo -e "\nThat is not an integer, guess again:"
read Number
done

# on récupère la valeur de games_played
Games_played=$($PSQL "SELECT games_played FROM players WHERE username='$username'")
$PSQL "UPDATE players SET games_played = $Games_played + 1 WHERE username='$username'" >/dev/null
$PSQL "UPDATE players SET tries_number = 1 WHERE username='$username'" >/dev/null

# on vérifie si c'est le bon chiffre
while [[ $Number -ne $random_number ]]
do 
if [[ $Number -lt $random_number ]] 
then echo -e "\nIt's higher than that, guess again:"
elif [[ $Number -gt $random_number ]]
then echo -e "\nIt's lower than that, guess again:"
fi 
# on augmente de 1 à chaque fois la variable tries_number
tries_number=$($PSQL "SELECT tries_number FROM players WHERE username='$username'")
$PSQL "UPDATE players SET tries_number = $tries_number + 1 WHERE username='$username'" >/dev/null
read Number
while ! [[ "$Number" =~ ^-?[0-9]+$ ]]; 
do
echo -e "\nThat is not an integer, guess again:"
read Number
done
done


# on récupère le meilleur score du joueur
best_game=$($PSQL "SELECT best_game FROM players WHERE username='$username'")
# et on compare ce score au score de la dernière partie


number_guess2=$($PSQL "SELECT tries_number FROM players WHERE username='$username'")
if [[ -z $best_game ]]
then
$PSQL "UPDATE players SET best_game=$number_guess2 WHERE username='$username'" >/dev/null
elif [[ $number_guess2 -lt $best_game ]]
then 
$PSQL "UPDATE players SET best_game=$number_guess2" >/dev/null
fi

echo -e "\nYou guessed it in $($PSQL "SELECT tries_number FROM players WHERE username='$username'") tries. The secret number was $random_number. Nice job!"



