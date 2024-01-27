contract c3628{
    // ------------------------------------------------------------------------
    // verifies, calculates and sends tokens to beneficiary
    // ------------------------------------------------------------------------
    function _buyTokens(address _beneficiary) public payable{
        uint256 weiAmount = msg.value;
        // calculate OBL tokens to be delivered
        uint256 tokens = _getTokenAmount(weiAmount);
        _preValidatePurchase(_beneficiary, weiAmount, tokens);
        _processPurchase(_beneficiary, tokens);
        emit TokenPurchase(this, _beneficiary, weiAmount, tokens);
        _forwardFunds();
    }
}