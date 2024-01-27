contract c13665{
    /**
    * @notice Sets prizes for last tokens and sets prize pool amount
    */
    function setLastPositions() external onlyAdmin checkState(pointsValidationState.WinnersAssigned){
        for(uint256 j = 0;j < worstTokens.length;j++){
            uint256 tokenId = worstTokens[j];
            tokenToPayoutMap[tokenId] += lastPosition.div(worstTokens.length);
        }
        uint256 balance = address(this).balance;
        adminPool = balance.mul(25).div(100);
        prizePool = balance.mul(75).div(100);
        pValidationState = pointsValidationState.Finished;
        gameFinishedTime = now;
    }
}