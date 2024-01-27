contract c16764{
    /*
     * End sale in crrent round
     */
    function endSale() external onlyOwner atStage(Stages.Started) {
        endTime = now;
        stage = Stages.Ended;
        SaleEnded(endTime, totalWeiRaised, round);
    }
}