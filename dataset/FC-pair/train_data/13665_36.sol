contract c13665{
    /**
    * @notice If anything during the point calculation and sorting part should fail, this function can reset 
    * data structures to their initial position, so as to  
    */
    function resetWinners(uint256 newLength) external onlyAdmin checkState(pointsValidationState.LimitCalculated){
        sortedWinners.length = newLength;
    }
}