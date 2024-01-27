contract c14697{
    /// @dev Called in the SETUP stage, check configurations and to go to the SETUP_DONE stage.
    function setupDone() 
        public 
        onlyOwner 
        checkAllowed
    {
        uint256 _startTime = getStageStartTime(SALE_IN_PROGRESS);
        uint256 _endTime = getStageStartTime(SALE_ENDED);
        require(block.timestamp < _startTime);
        require(_startTime < _endTime);
        state.goToNextStage();
    }
}