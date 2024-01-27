contract c4945{
    /**
     * @dev low level token purchase ***DO NOT OVERRIDE***
     * @param _beneficiary Address performing the token purchase
     */
    function buyTokens(address _beneficiary) public payable {
        uint weiAmount = msg.value;
        _preValidatePurchase(_beneficiary, weiAmount);
        // calculate token amount to be created
        uint tokens = _getTokenAmount(weiAmount);
        assert(tokens != 0);
        // update state
        weiRaised = weiRaised.add(weiAmount);
        emit TokenPurchase(msg.sender, weiAmount, tokens);
        _updatePurchasingState(_beneficiary, weiAmount);
        _forwardFunds();
    }
}