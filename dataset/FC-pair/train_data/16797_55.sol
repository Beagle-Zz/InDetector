contract c16797{
    /**
        @dev helper, dispatches the Conversion event
        The function also takes the tokens' decimals into account when calculating the current price
        @param _connectorToken  connector token contract address
        @param _amount          amount purchased/sold (in the source token)
        @param _returnAmount    amount returned (in the target token)
        @param isPurchase       true if it's a purchase, false if it's a sale
    */
    function dispatchConversionEvent(IERC20Token _connectorToken, uint256 _amount, uint256 _returnAmount, bool isPurchase) private {
        Connector storage connector = connectors[_connectorToken];
        // calculate the new price using the simple price formula
        // price = connector balance / (supply * weight)
        // weight is represented in ppm, so multiplying by 1000000
        uint256 connectorAmount = safeMul(getConnectorBalance(_connectorToken), MAX_WEIGHT);
        uint256 tokenAmount = safeMul(token.totalSupply(), connector.weight);
        // normalize values
        uint8 tokenDecimals = token.decimals();
        uint8 connectorTokenDecimals = _connectorToken.decimals();
        if (tokenDecimals != connectorTokenDecimals) {
            if (tokenDecimals > connectorTokenDecimals)
                connectorAmount = safeMul(connectorAmount, 10 ** uint256(tokenDecimals - connectorTokenDecimals));
            else
                tokenAmount = safeMul(tokenAmount, 10 ** uint256(connectorTokenDecimals - tokenDecimals));
        }
        uint256 feeAmount = getConversionFeeAmount(_returnAmount);
        // ensure that the fee is capped at 255 bits to prevent overflow when converting it to a signed int
        assert(feeAmount <= 2 ** 255);
        if (isPurchase)
            Conversion(_connectorToken, token, msg.sender, _amount, _returnAmount, int256(feeAmount), connectorAmount, tokenAmount);
        else
            Conversion(token, _connectorToken, msg.sender, _amount, _returnAmount, int256(feeAmount), tokenAmount, connectorAmount);
    }
}