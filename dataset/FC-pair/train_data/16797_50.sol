contract c16797{
    /**
        @dev sells the token by withdrawing from one of its connector tokens
        @param _connectorToken  connector token contract address
        @param _sellAmount      amount to sell (in the smart token)
        @param _minReturn       if the conversion results in an amount smaller the minimum return - it is cancelled, must be nonzero
        @return sell return amount
    */
    function sell(IERC20Token _connectorToken, uint256 _sellAmount, uint256 _minReturn)
        internal
        conversionsAllowed
        greaterThanZero(_minReturn)
        returns (uint256)
    {
        require(_sellAmount <= token.balanceOf(msg.sender)); // validate input
        uint256 amount = getSaleReturn(_connectorToken, _sellAmount);
        require(amount != 0 && amount >= _minReturn); // ensure the trade gives something in return and meets the minimum requested amount
        uint256 tokenSupply = token.totalSupply();
        uint256 connectorBalance = getConnectorBalance(_connectorToken);
        // ensure that the trade will only deplete the connector if the total supply is depleted as well
        assert(amount < connectorBalance || (amount == connectorBalance && _sellAmount == tokenSupply));
        // update virtual balance if relevant
        Connector storage connector = connectors[_connectorToken];
        if (connector.isVirtualBalanceEnabled)
            connector.virtualBalance = safeSub(connector.virtualBalance, amount);
        // destroy _sellAmount from the caller's balance in the smart token
        token.destroy(msg.sender, _sellAmount);
        // transfer funds to the caller in the connector token
        // the transfer might fail if the actual connector balance is smaller than the virtual balance
        assert(_connectorToken.transfer(msg.sender, amount));
        dispatchConversionEvent(_connectorToken, _sellAmount, amount, false);
        return amount;
    }
}