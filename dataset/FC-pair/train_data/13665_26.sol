contract c13665{
    /**
    * @notice calculates points from the last two matches
    * @param brackets token predictions
    * @return amount of points gained from the last two matches
    */
    function getFinalRoundPoints (uint160 brackets) internal view returns(uint16 finalRoundPoints) {
        uint8[3] memory teamsIds;
        for (uint i = 0; i <= 2; i++){
            brackets = brackets >> 5; //discard 4th place
            teamsIds[2-i] = uint8(brackets & RESULT_MASK_BRACKETS);
        }
        if (teamsIds[0] == bracketsResults.finalsTeamsIds[0]){
            finalRoundPoints += 100;
        }
        if (teamsIds[2] == bracketsResults.finalsTeamsIds[2]){
            finalRoundPoints += 25;
        }
        if (teamsIds[0] == bracketsResults.finalsTeamsIds[1]){
            finalRoundPoints += 50;
        }
        if (teamsIds[1] == bracketsResults.finalsTeamsIds[0] || teamsIds[1] == bracketsResults.finalsTeamsIds[1]){
            finalRoundPoints += 50;
        }
    }
}