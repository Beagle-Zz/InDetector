contract c13665{
    /**
    * @notice calculates points for round of sixteen, quarter-finals and semifinals
    * @param size amount of matches in round
    * @param round ros, qf, sf or f
    * @param brackets predictions
    * @return amount of points
    */
    function getMiddleRoundPoints(uint8 size, teamState round, uint160 brackets) internal view returns(uint16 middleRoundResults){
        uint8 teamId;
        for (uint i = 0; i < size; i++){
            teamId = uint8(brackets & RESULT_MASK_BRACKETS);
            if (uint(bracketsResults.middlePhaseTeamsIds[teamId]) >= uint(round) ) {
                middleRoundResults+=60;
            }
            brackets = brackets >> 5;
        }
    }
}