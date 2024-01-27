contract c13293{
    /**
     * @dev Extend parent behavior requiring purchase to respect the contributor's funding cap.
     * @param _beneficiary Address of contributor
     * @param _weiAmount Amount of wei contributed
     */
    function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) internal view {
        super._preValidatePurchase(_beneficiary, _weiAmount);
        require(_weiAmount <= individualCap);
        require(_weiAmount >= miniumInvestment);
    }
}