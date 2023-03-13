#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"

echo Enter your username:
# Get player's username
read USERNAME

# Check if it exists
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username like '$USERNAME'")
# Create user if non exisitng
if [[ -z $USER_ID ]]
then
  USER_ID=$(echo $($PSQL "INSERT into users(username) values ('$USERNAME') returning user_id") | sed 's/ .*//')
  echo "Welcome, $USERNAME! It looks like this is your first time here."

# If existing
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT number_of_guesses FROM games WHERE user_id = $USER_ID ORDER BY number_of_guesses LIMIT 1")
  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

# Generate random number
RAND_NUMBER=$[ ( $RANDOM % 1000 )  + 1 ]

# Get player's guess
echo Guess the secret number between 1 and 1000:
read USER_GUESS

IS_NUMBER_GUESSED=0
NUMBER_OF_GUESSES=0
until [[ $IS_NUMBER_GUESSED == 1 ]]
do
  ((NUMBER_OF_GUESSES++))
  # If input is not a number
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo That is not an integer, guess again:
    read USER_GUESS
    continue
  # If guess is correct
  elif [[ $USER_GUESS == $RAND_NUMBER ]]
  then
    IS_NUMBER_GUESSED=1
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (user_id, number_of_guesses) VALUES ($USER_ID, $NUMBER_OF_GUESSES)")
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RAND_NUMBER. Nice job!"
    break
  # If less than expected
  elif [[ $USER_GUESS < $RAND_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    read USER_GUESS
    continue
  # If greater than expected
  else
    echo "It's lower than that, guess again:"
    read USER_GUESS
    continue
  fi
done
