contract c16764{
    /*
     * Set up several information for next round
     * Only owner can call this method
     */
    function setUpSale(
        SaleRounds _round,
        uint256 _minContribution,
        uint256 _maxContribution,
        uint256 _hardCap,
        uint256 _rate
    )
        external
        onlyOwner
        atStage(Stages.Ended)
    {
        require(round <= _round);
        stage = Stages.SetUp;
        round = _round;
        setMinContributionForRound(_round, _minContribution);
        setMaxContributionForRound(_round, _maxContribution);
        setHardCapForRound(_round, _hardCap);
        setRateForRound(_round, _rate);
    }
}