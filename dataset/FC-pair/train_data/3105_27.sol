contract c3105{
    /**
     * @dev Reveal a sealed purchase order and commit to a purchase.
     * @param _sealedPurchaseOrder The sealed purchase order.
     * @param _period Period of purchase order.
     * @param _value Purchase funds, in wei.
     * @param _period Period for which to reveal purchase order.
     * @param _salt Random value to keep purchase secret.
     * @param _alias Address to withdraw tokens and excess funds to.
     */
    function revealPurchaseOrder(bytes32 _sealedPurchaseOrder, uint _period, uint _value, bytes32 _salt, address _alias) public {
        // Sanity check to make sure user enters an alias
        require(_alias != address(0));
        // Can only reveal sealed orders in the next period
        require(currentPeriodIndex() == _period.add(1));
        Period storage period = periods[_period];
        // Each address can only make a single purchase per period
        require(period.aliases[msg.sender] == address(0));
        // Note: don't *need* to advance period here
        bytes32 h = createPurchaseOrder(msg.sender, _period, _value, _salt);
        require(h == _sealedPurchaseOrder);
        // The value revealed must not be greater than the value previously sent
        require(_value <= period.receivedBalances[msg.sender]);
        period.totalReceived = period.totalReceived.add(_value);
        uint remainder = period.receivedBalances[msg.sender].sub(_value);
        period.receivedBalances[msg.sender] = _value;
        period.aliases[msg.sender] = _alias;
        emit SealedOrderRevealed(msg.sender, _period, _alias, _value);
        // Return any extra balance to the alias
        _alias.transfer(remainder);
    }
}