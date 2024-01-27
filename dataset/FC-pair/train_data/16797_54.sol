contract c16797{
    /**
        @dev utility, returns the expected return for selling the token for one of its connector tokens, given a total supply override
        @param _connectorToken  connector token contract address
        @param _sellAmount      amount to sell (in the smart token)
        @param _totalSupply     total token supply, overrides the actual token total supply when calculating the return
        @return sale return amount
    */
    function getSaleReturn(IERC20Token _connectorToken, uint256 _sellAmount, uint256 _totalSupply)
        private
        view
        active
        validConnector(_connectorToken)
        greaterThanZero(_totalSupply)
        returns (uint256)
    {
        Connector storage connector = connectors[_connectorToken];
        uint256 connectorBalance = getConnectorBalance(_connectorToken);
        uint256 amount = extensions.formula().calculateSaleReturn(_totalSupply, connectorBalance, connector.weight, _sellAmount);
        // deduct the fee from the return amount
        uint256 feeAmount = getConversionFeeAmount(amount);
        return safeSub(amount, feeAmount);
    }
}