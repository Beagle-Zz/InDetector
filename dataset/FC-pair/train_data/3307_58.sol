contract c3307{
     /**
      * @dev allows for minting from owner account
      */
    function mintForPrivateFiat(address _beneficiary, uint256 _weiAmount) public onlyOwner {
        require(_beneficiary != address(0));
        // require(_weiAmount > 0);
        _preValidatePurchase(_beneficiary, _weiAmount);
        // calculate token amount to be created
        uint256 tokens = _getTokenAmount(_weiAmount);
        // update state
        weiRaised = weiRaised.add(_weiAmount);
        tokensRaised = tokensRaised.add(tokens);
        if(capReached()) {
            // manual process unused eth amount to sender
            emit CapOverflow(_beneficiary, _weiAmount, tokens, now);
            emit IncrementTieredState(getState());
        }
        _processPurchase(_beneficiary, tokens);
        emit TokenPurchase(
            msg.sender,
            _beneficiary,
            _weiAmount,
            tokens
        );
        _updatePurchasingState(_beneficiary, _weiAmount);
        _forwardFunds();
    }
}