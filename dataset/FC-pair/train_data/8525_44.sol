contract c8525{
    /**
        @dev returns the expected return for buying the token for a connector token
        @param _connectorToken  connector token contract address
        @param _depositAmount   amount to deposit (in the connector token)
        @return expected purchase return amount
    */
    function getPurchaseReturn(IERC20Token _connectorToken, uint256 _depositAmount)
        public
        view
        active
        validConnector(_connectorToken)
        returns (uint256)
    {
        Connector storage connector = connectors[_connectorToken];
        require(connector.isPurchaseEnabled); // validate input
        uint256 tokenSupply = token.totalSupply();
        uint256 connectorBalance = getConnectorBalance(_connectorToken);
        IBancorFormula formula = IBancorFormula(registry.addressOf(ContractIds.BANCOR_FORMULA));
        uint256 amount = formula.calculatePurchaseReturn(tokenSupply, connectorBalance, connector.weight, _depositAmount);
        // return the amount minus the conversion fee
        return getFinalAmount(amount, 1);
    }
}