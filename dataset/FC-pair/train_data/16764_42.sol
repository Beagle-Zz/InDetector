contract c16764{
    /*
     * Set AMO to Ether rate for round
     *
     * @param _round: Round to set
     * @param _rate: AMO to Ether _rate
     */
    function setRateForRound(
        SaleRounds _round,
        uint256 _rate
    )
        public
        onlyOwner
        atStage(Stages.SetUp)
    {
        require(round <= _round);
        roundInfos[uint8(_round)].rate =
            (_rate == 0) ? BASE_AMO_TO_ETH_RATE : _rate;
    }
}