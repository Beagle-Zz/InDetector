contract c16764{
    /*
     * Set hard cap for round
     * Total wei raised in round should be smaller than hard cap
     *
     * @param _round: Round to set
     * @param _hardCap: Hard cap in wei
     */
    function setHardCapForRound(
        SaleRounds _round,
        uint256 _hardCap
    )
        public
        onlyOwner
        atStage(Stages.SetUp)
    {
        require(round <= _round);
        roundInfos[uint8(_round)].hardCap =
            (_hardCap == 0) ? BASE_HARD_CAP_PER_ROUND : _hardCap;
    }
}