contract c18930{
    /**
    * @dev low level token purchase ***DO NOT OVERRIDE***
    * @param _beneficiary Address performing the token purchase
    */
    function buyTokens(address _beneficiary) public payable onlyWhileOpen {
        uint256 weiAmount = msg.value;
        _preValidatePurchase(_beneficiary, weiAmount);
        // calculate token amount to be created
        uint256 tokens = _getTokenAmount(weiAmount);
        _verifyAvailability(tokens);
        _processPurchase(_beneficiary, tokens);
        TokenPurchase(msg.sender, _beneficiary, weiAmount, tokens);
        _forwardFunds();
    }
}