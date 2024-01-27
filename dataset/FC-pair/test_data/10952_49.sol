contract c10952{
    /**
        @dev buys the token by depositing one of its connector tokens
        @param _connectorToken  connector token contract address
        @param _depositAmount   amount to deposit (in the connector token)
        @param _minReturn       if the conversion results in an amount smaller than the minimum return - it is cancelled, must be nonzero
        @return buy return amount
    */
    function buy(IERC20Token _connectorToken, uint256 _depositAmount, uint256 _minReturn) internal returns (uint256) {
        uint256 amount = getPurchaseReturn(_connectorToken, _depositAmount);
        // ensure the trade gives something in return and meets the minimum requested amount
        require(amount != 0 && amount >= _minReturn);
        // update virtual balance if relevant
        Connector storage connector = connectors[_connectorToken];
        if (connector.isVirtualBalanceEnabled)
            connector.virtualBalance = safeAdd(connector.virtualBalance, _depositAmount);
        // transfer funds from the caller in the connector token
        assert(_connectorToken.transferFrom(msg.sender, this, _depositAmount));
        // issue new funds to the caller in the smart token
        token.issue(msg.sender, amount);
        // calculate conversion fee and dispatch the conversion event
        uint256 feeAmount = safeSub(amount, getFinalAmount(amount, 1));
        dispatchConversionEvent(_connectorToken, token, _depositAmount, amount, feeAmount);
        // dispatch price data update for the smart token/connector
        emit PriceDataUpdate(_connectorToken, token.totalSupply(), getConnectorBalance(_connectorToken), connector.weight);
        return amount;
    }
}