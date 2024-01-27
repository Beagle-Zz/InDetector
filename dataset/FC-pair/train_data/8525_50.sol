contract c8525{
    /**
        @dev sells the token by withdrawing from one of its connector tokens
        @param _connectorToken  connector token contract address
        @param _sellAmount      amount to sell (in the smart token)
        @param _minReturn       if the conversion results in an amount smaller the minimum return - it is cancelled, must be nonzero
        @return sell return amount
    */
    function sell(IERC20Token _connectorToken, uint256 _sellAmount, uint256 _minReturn) internal returns (uint256) {
        require(_sellAmount <= token.balanceOf(msg.sender)); // validate input
        uint256 amount = getSaleReturn(_connectorToken, _sellAmount);
        // ensure the trade gives something in return and meets the minimum requested amount
        require(amount != 0 && amount >= _minReturn);
        // ensure that the trade will only deplete the connector balance if the total supply is depleted as well
        uint256 tokenSupply = token.totalSupply();
        uint256 connectorBalance = getConnectorBalance(_connectorToken);
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
        // calculate conversion fee and dispatch the conversion event
        uint256 feeAmount = safeSub(amount, getFinalAmount(amount, 1));
        dispatchConversionEvent(token, _connectorToken, _sellAmount, amount, feeAmount);
        // dispatch price data update for the smart token/connector
        emit PriceDataUpdate(_connectorToken, token.totalSupply(), getConnectorBalance(_connectorToken), connector.weight);
        return amount;
    }
}