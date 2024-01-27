contract c2498{
    // -----------------------------------------
    // Internal interface (extensible)
    // -----------------------------------------
    /**
      * Processing the purchase as well as verify the required validations
      * @param _beneficiary Address performing the token purchase
      * @param _investedAmount Value in wei involved in the purchase
    */
    function _processTx(address _beneficiary, uint256 _investedAmount) internal {
        _preValidatePurchase(_beneficiary, _investedAmount);
        // calculate token amount to be created
        uint256 tokens = _getTokenAmount(_investedAmount);
        // update state
        fundsRaised = fundsRaised.add(_investedAmount);
        tokensSold = tokensSold.add(tokens);
        _processPurchase(_beneficiary, tokens);
        emit TokenPurchase(msg.sender, _beneficiary, _investedAmount, tokens);
        _updatePurchasingState(_beneficiary, _investedAmount);
    }
}