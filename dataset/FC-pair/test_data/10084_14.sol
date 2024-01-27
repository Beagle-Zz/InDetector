contract c10084{
    // As new fixtures become known through progression or elimination, they're added here.
    function addNewGame(string _opponents, int8 _gameID)
        isAdministrator
        public {
            worldCupGameID[_opponents] = _gameID;
    }
}