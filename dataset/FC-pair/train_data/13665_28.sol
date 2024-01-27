contract c13665{
    /**
    * @notice calculates points for correct predictions of group winners
    * @param brackets token predictions
    * @return amount of points
    */
    function getQualifiersPoints(uint160 brackets) internal view returns(uint16 qualifiersPoints){
        uint8 teamId;
        for (uint256 i = 0; i <= 15; i++){
            teamId = uint8(brackets & RESULT_MASK_BRACKETS);
            if (teamId == bracketsResults.roundOfSixteenTeamsIds[15-i]){
                qualifiersPoints+=30;
            } else if (bracketsResults.teamExists[teamId]){
                qualifiersPoints+=25;
            }
            brackets = brackets >> 5;
        }
    }
}