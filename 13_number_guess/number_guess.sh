#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MENU() {
    if [[ $1 ]]; 
    then
        echo -e "$1\n"
    fi
    echo "Enter your username:"
    read U_NAME
}

GUESS() {
    if [[ $1 ]]; 
    then
        echo -e "$1"
    else
        echo -e "Guess the secret number between 1 and 1000:"
    fi
    read U_NUM
}

MENU


while [[ -z $U_NAME ]]; 
do
    MENU "The username filed is required."
done

USER=$($PSQL "SELECT username,game_played,best_game FROM users WHERE username='$U_NAME'")
if [[ -z $USER ]]; 
then
    INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$U_NAME')")
    echo "Welcome, $U_NAME! It looks like this is your first time here."
else
    IFS='|' read -r -a USER_ARRAY <<<"$USER"
    for ((i = 0; i <= ${#USER_ARRAY[@]} - 1; i++)); 
    do
        USER_ARRAY[$i]=$(echo ${USER_ARRAY[$i]} | sed -e 's/^+ | +$//')
    done
    echo "Welcome back, ${USER_ARRAY[0]}! You have played ${USER_ARRAY[1]} games, and your best game took ${USER_ARRAY[2]} guesses."
fi


C_NUM=$((RANDOM % 1000 + 1))
GUESS_COUNT=1

GUESS

while [[ $U_NUM -ne $C_NUM ]]; 
do
    if ! [[ $U_NUM =~ ^[0-9]+$ ]]; 
    then
        GUESS "That is not an integer, guess again:"
    elif [[ $U_NUM -lt $C_NUM ]]; 
    then
        GUESS "It's higher than that, guess again:"
    elif [[ $U_NUM -gt $C_NUM ]]; 
    then
        GUESS "It's lower than that, guess again:"
    fi
    ((GUESS_COUNT++))
done

if [[ -z "${USER_ARRAY}" ]]; 
then
    UPDATE_USER=$($PSQL "UPDATE users SET game_played=1,best_game=$GUESS_COUNT WHERE username='$U_NAME'")
else
    GAMES_PLAYED=$((${USER_ARRAY[1]} + 1))
    if [[ $GUESS_COUNT -lt ${USER_ARRAY[2]} ]]; 
    then
        UPDATE_USER=$($PSQL "UPDATE users SET game_played=$GAMES_PLAYED,best_game=$GUESS_COUNT WHERE username='$U_NAME'")
    else
        UPDATE_USER=$($PSQL "UPDATE users SET game_played=$GAMES_PLAYED WHERE username='$U_NAME'")
    fi
fi
echo "You guessed it in $GUESS_COUNT tries. The secret number was $C_NUM. Nice job!"