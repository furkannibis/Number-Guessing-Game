#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

echo -e "\nEnter your username:"
read USERNAME_ENTERED

USERNAME=$(echo "$($PSQL "SELECT username FROM users WHERE username='$USERNAME_ENTERED'")" | sed 's/ //g')

# user not exists
if [[ -z $USERNAME ]]
then
  echo -e "\nWelcome, $USERNAME_ENTERED! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME_ENTERED')")
  USERNAME=$USERNAME_ENTERED
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'" | sed 's/ //g')

else
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'" | sed 's/ //g')
  USER_GAME_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID" | sed 's/ //g')
  USER_BEST_GAME=$($PSQL "SELECT MIN(guess_count) FROM games WHERE user_id=$USER_ID" | sed 's/ //g')
  echo -e "\nWelcome back, $USERNAME! You have played $USER_GAME_PLAYED games, and your best game took $USER_BEST_GAME guesses. with $USERNAME"
fi

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
GUESS_COUNT=0
echo -e "\nGuess the secret number between 1 and 1000:"
read USER_GUESS

until [[ $SECRET_NUMBER == $USER_GUESS ]]
do
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    read USER_GUESS
  else
    if [[ $USER_GUESS < $SECRET_NUMBER ]]
    then
      echo -e "\nIt's higher than that, guess again:"
      read USER_GUESS
      ((GUESS_COUNT++))
    else
      echo -e "\nIt's lower than that, guess again:"
      read USER_GUESS
      ((GUESS_COUNT++))
    fi
  fi
done

((GUESS_COUNT++))

INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, secret, guess_count) VALUES ($USER_ID, $SECRET_NUMBER, $GUESS_COUNT)")
echo You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job\!