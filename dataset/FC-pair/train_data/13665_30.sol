contract c13665{
    /**
    * @notice calculates total amount of points for a token
    * @param t token to calculate points for
    * @return total amount of points
    */
    function calculateTokenPoints (Token memory t) internal view returns(uint16 points){
        //Groups phase 1
        uint192 g1 = t.groups1;
        for (uint256 i = 0; i <= 23; i++){
            points+=getMatchPointsGroups(23-i, g1);
            g1 = g1 >> 8;
        }
        //Groups phase 2
        uint192 g2 = t.groups2;
        for (i = 0; i <= 23; i++){
            points+=getMatchPointsGroups(47-i, g2);
            g2 = g2 >> 8;
        }
        uint160 bracketsLocal = t.brackets;
        //Brackets phase 1
        points+=getFinalRoundPoints(bracketsLocal);
        bracketsLocal = bracketsLocal >> 20;
        //Brackets phase 2 
        points+=getMiddleRoundPoints(4, teamState.QUARTERS, bracketsLocal);
        bracketsLocal = bracketsLocal >> 20;
        //Brackets phase 3 
        points+=getMiddleRoundPoints(8, teamState.ROS, bracketsLocal);
        bracketsLocal = bracketsLocal >> 40;
        //Brackets phase 4
        points+=getQualifiersPoints(bracketsLocal);
        //Extras
        points+=getExtraPoints(t.extra);
    }
}