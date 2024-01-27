contract c4717{
    /**
    * @dev Update invested amount
    * @param _beneficiary address receiving the tokens
    * @param _weiAmount uint256 value in wei involved in the purchase
    */
    function _updatePurchasingState(address _beneficiary, uint256 _weiAmount) internal {
        super._updatePurchasingState(_beneficiary, _weiAmount);
        invested[_beneficiary] = invested[_beneficiary].add(_weiAmount);
    }
}