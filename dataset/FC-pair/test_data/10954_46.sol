contract c10954{
    /**
        @dev returns the expected return for selling one of the connector tokens for another connector token
        @param _fromConnectorToken  contract address of the connector token to convert from
        @param _toConnectorToken    contract address of the connector token to convert to
        @param _sellAmount          amount to sell (in the from connector token)
        @return expected sale return amount (in the to connector token)
    */
    function getCrossConnectorReturn(IERC20Token _fromConnectorToken, IERC20Token _toConnectorToken, uint256 _sellAmount)
        public
        view
        active
        validConnector(_fromConnectorToken)
        validConnector(_toConnectorToken)
        returns (uint256)
    {
        Connector storage fromConnector = connectors[_fromConnectorToken];
        Connector storage toConnector = connectors[_toConnectorToken];
        require(toConnector.isPurchaseEnabled); // validate input
        uint256 fromConnectorBalance = getConnectorBalance(_fromConnectorToken);
        uint256 toConnectorBalance = getConnectorBalance(_toConnectorToken);
        IBancorFormula formula = IBancorFormula(registry.getAddress(ContractIds.BANCOR_FORMULA));
        uint256 amount = formula.calculateCrossConnectorReturn(fromConnectorBalance, fromConnector.weight, toConnectorBalance, toConnector.weight, _sellAmount);
        // return the amount minus the conversion fee
        // the fee is higher (magnitude = 2) since cross connector conversion equals 2 conversions (from / to the smart token)
        return getFinalAmount(amount, 2);
    }
}