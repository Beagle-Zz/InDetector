contract c13665{
    /**
    * @notice Sets the points of all the tokens between the last chunk set and the amount given.
    * @dev This function uses all the data collected earlier by oraclize to calculate points.
    * @param amount The amount of tokens that should be analyzed.
    */
	function calculatePointsBlock(uint32 amount) external{
        require (gameFinishedTime == 0);
        require(amount + lastCheckedToken <= tokens.length);
        for (uint256 i = lastCalculatedToken; i < (lastCalculatedToken + amount); i++) {
            uint16 points = calculateTokenPoints(tokens[i]);
            tokenToPointsMap[i] = points;
            if(worstTokens.length == 0 || points <= auxWorstPoints){
                if(worstTokens.length != 0 && points < auxWorstPoints){
                  worstTokens.length = 0;
                }
                if(worstTokens.length < 100){
                    auxWorstPoints = points;
                    worstTokens.push(i);
                }
            }
        }
        lastCalculatedToken += amount;
  	}
}