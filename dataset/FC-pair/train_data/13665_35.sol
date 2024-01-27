contract c13665{
    /**
    * @notice Checks if the order given offchain coincides with the order of the actual previously calculated points
    * in the smart contract.
    * @dev the token sorting is done offchain so as to save on the huge amount of gas and complications that 
    * could occur from doing all the sorting onchain.
    * @param sortedChunk chunk sorted by points
    */
    function checkOrder(uint32[] sortedChunk) external onlyAdmin checkState(pointsValidationState.LimitCalculated){
        require(sortedChunk.length + sortedWinners.length <= winnerCounter);
        for(uint256 i=0;i < sortedChunk.length-1;i++){
            uint256 id = sortedChunk[i];
            uint256 sigId = sortedChunk[i+1];
            require(tokenToPointsMap[id] > tokenToPointsMap[sigId] ||
                (tokenToPointsMap[id] == tokenToPointsMap[sigId] &&  id < sigId));
        }
        if(sortedWinners.length != 0){
            uint256 id2 = sortedWinners[sortedWinners.length-1];
            uint256 sigId2 = sortedChunk[0];
            require(tokenToPointsMap[id2] > tokenToPointsMap[sigId2] ||
                (tokenToPointsMap[id2] == tokenToPointsMap[sigId2] && id2 < sigId2));
        }
        for(uint256 j=0;j < sortedChunk.length;j++){
            sortedWinners.push(sortedChunk[j]);
        }
        if(sortedWinners.length == winnerCounter){
            require(sortedWinners[sortedWinners.length-1] == pointsLimit);
            pValidationState = pointsValidationState.OrderChecked;
        }
    }
}