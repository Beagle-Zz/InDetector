contract c10981{
    // Sum up the individual scores throughout the tournament and produce a final result.
    function calculateScore(address _participant)
        view
        public
        returns (int16)
    {
        int16 finalScore = 0;
        for (int8 i = 0; i < latestGameFinished; i++) {
            uint j = uint(i);
            int16 gameScore = playerPointArray[_participant][j];
            finalScore = SafeMath.addint16(finalScore, gameScore);
        }
        return finalScore;
    }
}