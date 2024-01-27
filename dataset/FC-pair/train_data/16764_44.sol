contract c16764{
    /*
     * Start sale in current round
     */
    function startSale(uint256 durationInSeconds)
        external
        onlyOwner
        atStage(Stages.SetUp)
    {
        require(roundInfos[uint8(round)].minContribution > 0
            && roundInfos[uint8(round)].hardCap > 0);
        stage = Stages.Started;
        startTime = now;
        endTime = startTime.add(durationInSeconds);
        SaleStarted(startTime, endTime, round);
    }
}