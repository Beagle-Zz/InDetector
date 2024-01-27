contract c10084{
    // Make a prediction for a game. An example would be makePrediction(1, "DRAW")
    //   if you anticipate a draw in the game between Russia and Saudi Arabia,
    //   or makePrediction(2, "UY") if you expect Uruguay to beat Egypt.
    // The "DRAW" option becomes invalid after the group stage games have been played.
    function makePrediction(int8 _gameID, string _prediction)
        public {
        address _customerAddress             = msg.sender;
        uint    predictionTime               = now;
        require(playerRegistered[_customerAddress]
                && !gameFinished[_gameID]
                && predictionTime < gameLocked[_gameID]);
        // No draws allowed after the qualification stage.
        if (_gameID > 48 && equalStrings(_prediction, "DRAW")) {
            revert();
        } else {
            playerPredictions[_customerAddress][_gameID]    = _prediction;
            playerMadePrediction[_customerAddress][_gameID] = true;
            emit PlayerLoggedPrediction(_customerAddress, _gameID, _prediction);
        }
    }
}