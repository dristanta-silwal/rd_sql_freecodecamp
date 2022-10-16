#! /bin/bash

if [[ $1 == "test" ]]
then
    PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
    PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")
cat games.csv | while IFS="," read YEAR ROUND WINNER LOSER WG OG
do
    if [[ $YEAR != "year" ]]
    then
        # get team_id for winner
        WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
        # if not found
        if [[ -z $WINNER_TEAM_ID ]]
        then
            INSERT_W_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
        fi
        # get team_id for loser
        LOSER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$LOSER'")
        # if not found
        if [[ -z $LOSER_TEAM_ID ]]
        then
            INSERT_L_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$LOSER')")
        fi
    fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER LOSER WG OG
do
    if [[ $YEAR != "year" ]]
    then
        # get team_id for winner
        WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
        
        # get team_id for loser
        LOSER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$LOSER'")

        # insert to games table
        INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_TEAM_ID, $LOSER_TEAM_ID, $WG, $OG)")
        if [[ $INSERT_GAMES == "INSERT 0 1" ]]
        then
            echo Inserted into games, $YEAR : $ROUND : $WINNER_TEAM_ID : $LOSER_TEAM_ID : $WG : $OG
        fi
    fi
done
