contract c2290{
    /**
      * @notice low level token purchase ***DO NOT OVERRIDE***
      * @param _beneficiary Address performing the token purchase
      */
    function buyTokens(address _beneficiary) public payable nonReentrant {
        require(!paused);
        require(fundraiseType == FundraiseType.ETH, "ETH should be the mode of investment");
        uint256 weiAmount = msg.value;
        _processTx(_beneficiary, weiAmount);
        _forwardFunds();
        _postValidatePurchase(_beneficiary, weiAmount);
    }
}