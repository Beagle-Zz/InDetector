contract c11549{
    /**
        @dev returns the expected return for selling the token for one of its connector tokens
        @param _connectorToken  connector token contract address
        @param _sellAmount      amount to sell (in the smart token)
        @return expected sale return amount
    */
    function getSaleReturn(IERC20Token _connectorToken, uint256 _sellAmount)
        public
        view
        active
        validConnector(_connectorToken)
        returns (uint256)
    {
        Connector storage connector = connectors[_connectorToken];
        uint256 tokenSupply = token.totalSupply();
        uint256 connectorBalance = getConnectorBalance(_connectorToken);
        IBancorFormula formula = IBancorFormula(registry.getAddress(ContractIds.BANCOR_FORMULA));
        uint256 amount = formula.calculateSaleReturn(tokenSupply, connectorBalance, connector.weight, _sellAmount);
        // return the amount minus the conversion fee
        return getFinalAmount(amount, 1);
    }
}