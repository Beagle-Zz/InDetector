contract c16797{
    /**
        @dev buys the token by depositing one of its connector tokens
        @param _connectorToken  connector token contract address
        @param _depositAmount   amount to deposit (in the connector token)
        @param _minReturn       if the conversion results in an amount smaller than the minimum return - it is cancelled, must be nonzero
        @return buy return amount
    */
    function buy(IERC20Token _connectorToken, uint256 _depositAmount, uint256 _minReturn)
        internal
        conversionsAllowed
        greaterThanZero(_minReturn)
        returns (uint256)
    {
        uint256 amount = getPurchaseReturn(_connectorToken, _depositAmount);
        require(amount != 0 && amount >= _minReturn); // ensure the trade gives something in return and meets the minimum requested amount
        // update virtual balance if relevant
        Connector storage connector = connectors[_connectorToken];
        if (connector.isVirtualBalanceEnabled)
            connector.virtualBalance = safeAdd(connector.virtualBalance, _depositAmount);
        // transfer _depositAmount funds from the caller in the connector token
        assert(_connectorToken.transferFrom(msg.sender, this, _depositAmount));
        // issue new funds to the caller in the smart token
        token.issue(msg.sender, amount);
        dispatchConversionEvent(_connectorToken, _depositAmount, amount, true);
        return amount;
    }
}