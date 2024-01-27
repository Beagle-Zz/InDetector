contract c16547{
    /**
    * @notice Set timestamp of Stage2 start
    **/
    function setStage2Start(uint256 _startStage2Time) public onlyCreator {
        require(_startStage2Time > now && _startStage2Time > startTime && _startStage2Time < deadline);
        startStage2Time = _startStage2Time;
    }
}