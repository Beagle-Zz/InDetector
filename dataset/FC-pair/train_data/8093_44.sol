contract c8093{
    /**
     * @dev Extend parent behavior to confirm purchase amount and whitelist.
     * @param _beneficiary Token purchaser
     * @param _weiAmount Amount of wei contributed
     */
    function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) internal onlyWhileOpen whenNotPaused {
        uint256 limitWeiAmount = limitEther.mul(1 ether);
        require( whitelist.isWhitelisted(_beneficiary) ||
                    whitelist.getTotalIndividualWeiAmount(_beneficiary).add(_weiAmount) < limitWeiAmount);
        super._preValidatePurchase(_beneficiary, _weiAmount);
    }
}