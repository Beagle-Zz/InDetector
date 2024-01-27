contract c8451{
    /**
     * @dev Change Crowdsale Stage.
     * Options: PreICO, ICO
     */
    function setCrowdsaleStage(uint value) public onlyOwner {
        CrowdsaleStage _stage;
        if (uint256(CrowdsaleStage.PreICO) == value) {
            _stage = CrowdsaleStage.PreICO;
        } else if (uint256(CrowdsaleStage.ICO) == value) {
            _stage = CrowdsaleStage.ICO;
        }
        stage = _stage;
    }
}