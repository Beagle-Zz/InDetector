contract c13665{
    /**
    * @notice Sets the 10th percentile of the sorted array of points
    * @param amount tokens in a chunk
    */
    function calculateWinners(uint32 amount) external onlyAdmin checkState(pointsValidationState.LimitSet){
        require(amount + lastCheckedToken <= tokens.length);
        uint256 points = tokenToPointsMap[pointsLimit];
        for(uint256 i = lastCheckedToken; i < lastCheckedToken + amount; i++){
            if(tokenToPointsMap[i] > points ||
                (tokenToPointsMap[i] == points && i <= pointsLimit)){
                winnerCounter++;
            }
        }
        lastCheckedToken += amount;
        if(lastCheckedToken == tokens.length){
            require(superiorQuota == winnerCounter);
            pValidationState = pointsValidationState.LimitCalculated;
        }
    }
}