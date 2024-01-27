contract c18930{
    // -----------------------------------------
    // Internal interface (extensible)
    // -----------------------------------------
    /**
    * @dev Validation of an incoming purchase.
    * @param _beneficiary Address performing the token purchase
    * @param _weiAmount Value in wei involved in the purchase
    */
    function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) internal view {
        require(hasClosed() == false);
        require(paused == false);
        require(_beneficiary != address(0));
        require(_weiAmount >= minimumWei);
    }
}