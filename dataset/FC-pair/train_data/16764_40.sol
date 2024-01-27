contract c16764{
    /*
     * Set max contribution for round
     * User can't send more ether than the max contributions in round
     *
     * @param _round: Round to set
     * @param _maxContribution: Max contribution in wei
     */
    function setMaxContributionForRound(
        SaleRounds _round,
        uint256 _maxContribution
    )
        public
        onlyOwner
        atStage(Stages.SetUp)
    {
        require(round <= _round);
        roundInfos[uint8(_round)].maxContribution =
            (_maxContribution == 0) ? UINT256_MAX : _maxContribution;
    }
}