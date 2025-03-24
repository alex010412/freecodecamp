PSQL="psql --username=freecodecamp --dbname=periodic_table -t -A --no-align -c"

if [[ -z $1 ]]
then
echo "Please provide an element as an argument."
else Element=$1




if [[ $Element =~ ^[0-9]+$ ]] 
then echo "The element with atomic number $Element is $($PSQL "SELECT name FROM elements_properties WHERE atomic_number='$Element'") ($($PSQL "SELECT symbol FROM elements_properties WHERE atomic_number='$Element'")). It's a $($PSQL "SELECT type FROM elements_properties WHERE elements_atomic_number='$Element'"), with a mass of $($PSQL "SELECT atomic_mass FROM elements_properties WHERE elements_atomic_number='$Element'") amu. $($PSQL "SELECT name FROM elements_properties WHERE atomic_number='$Element'") has a melting point of $($PSQL "SELECT melting_point_celsius FROM elements_properties WHERE elements_atomic_number='$Element'") celsius and a boiling point of $($PSQL "SELECT boiling_point_celsius FROM elements_properties WHERE elements_atomic_number='$Element'") celsius." 


else 
ElementFromDB=$($PSQL "SELECT name FROM elements_properties WHERE name='$Element'")

if [[ $ElementFromDB ]]
then echo "The element with atomic number $($PSQL "SELECT elements_atomic_number FROM elements_properties WHERE name='$Element'") is $($PSQL "SELECT name FROM elements_properties WHERE name='$Element'") ($($PSQL "SELECT symbol FROM elements_properties WHERE name='$Element'")). It's a $($PSQL "SELECT type FROM elements_properties WHERE name='$Element'"), with a mass of $($PSQL "SELECT atomic_mass FROM elements_properties WHERE name='$Element'") amu. $($PSQL "SELECT name FROM elements_properties WHERE name='$Element'") has a melting point of $($PSQL "SELECT melting_point_celsius FROM elements_properties WHERE name='$Element'") celsius and a boiling point of $($PSQL "SELECT boiling_point_celsius FROM elements_properties WHERE name='$Element'") celsius." 


else 
ElementFromS=$($PSQL "SELECT symbol FROM elements_properties WHERE symbol='$Element'")

if [[ $ElementFromS ]] #on teste si la variable est non vide
then echo "The element with atomic number $($PSQL "SELECT elements_atomic_number FROM elements_properties WHERE symbol='$Element'") is $($PSQL "SELECT name FROM elements_properties WHERE symbol='$Element'") ($($PSQL "SELECT symbol FROM elements_properties WHERE symbol='$Element'")). It's a $($PSQL "SELECT type FROM elements_properties WHERE symbol='$Element'"), with a mass of $($PSQL "SELECT atomic_mass FROM elements_properties WHERE symbol='$Element'") amu. $($PSQL "SELECT name FROM elements_properties WHERE symbol='$Element'") has a melting point of $($PSQL "SELECT melting_point_celsius FROM elements_properties WHERE symbol='$Element'") celsius and a boiling point of $($PSQL "SELECT boiling_point_celsius FROM elements_properties WHERE symbol='$Element'") celsius." 


else 
echo "I could not find that element in the database."

fi
fi
fi
fi



