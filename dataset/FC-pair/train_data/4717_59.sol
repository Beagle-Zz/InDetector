contract c4717{
    /**
    * @dev Validate min and max amounts and other purchase conditions
    * @param _beneficiary address token purchaser
    * @param _weiAmount uint256 amount of wei contributed
    */
    function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) internal {
        super._preValidatePurchase(_beneficiary, _weiAmount);
        require(_weiAmount >= minInvestmentInWei);
        require(invested[_beneficiary].add(_weiAmount) <= maxInvestmentInWei);
        require(!paused);
    }
}