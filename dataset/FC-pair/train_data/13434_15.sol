contract c13434{
  /**
   * @dev low level token purchase ***DO NOT OVERRIDE***
   * @param _beneficiary Address performing the token purchase
   */
    function buyTokens(address _beneficiary) public payable {
        uint256 weiAmount = msg.value;
        _preValidatePurchase(_beneficiary, weiAmount);
    // calculate token amount to be sent
        uint256 tokens = _getTokenAmount(weiAmount);
        require(tokens <= remainingSupply_);
    // update state
        weiRaised = weiRaised.add(weiAmount);
        _deliverTokens(_beneficiary, tokens);
        emit TokenPurchase(msg.sender, _beneficiary, weiAmount, tokens);
        _forwardFunds();
    }
}