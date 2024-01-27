contract c10103{
    // What is the current score of a given tournament participant?
    function showPlayerScores(address _participant)
        view
        public
        returns (int8[64])
    {
        return playerPointArray[_participant];
    }
}