contract c4721{
    /**
    * @dev Validate min investment amount
    * @param _beneficiary address token purchaser
    * @param _weiAmount uint256 amount of wei contributed
    */
    function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) internal {
        super._preValidatePurchase(_beneficiary, _weiAmount);
        require(_weiAmount >= minInvestmentInWei);
    }
}