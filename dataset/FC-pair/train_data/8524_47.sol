contract c8524{
    /**
        @dev converts a specific amount of _fromToken to _toToken
        @param _fromToken  ERC20 token to convert from
        @param _toToken    ERC20 token to convert to
        @param _amount     amount to convert, in fromToken
        @param _minReturn  if the conversion results in an amount smaller than the minimum return - it is cancelled, must be nonzero
        @return conversion return amount
    */
    function convertInternal(IERC20Token _fromToken, IERC20Token _toToken, uint256 _amount, uint256 _minReturn)
        public
        bancorNetworkOnly
        conversionsAllowed
        greaterThanZero(_minReturn)
        returns (uint256)
    {
        require(_fromToken != _toToken); // validate input
        // conversion between the token and one of its connectors
        if (_toToken == token)
            return buy(_fromToken, _amount, _minReturn);
        else if (_fromToken == token)
            return sell(_toToken, _amount, _minReturn);
        // conversion between 2 connectors
        uint256 amount = getCrossConnectorReturn(_fromToken, _toToken, _amount);
        // ensure the trade gives something in return and meets the minimum requested amount
        require(amount != 0 && amount >= _minReturn);
        // update the source token virtual balance if relevant
        Connector storage fromConnector = connectors[_fromToken];
        if (fromConnector.isVirtualBalanceEnabled)
            fromConnector.virtualBalance = safeAdd(fromConnector.virtualBalance, _amount);
        // update the target token virtual balance if relevant
        Connector storage toConnector = connectors[_toToken];
        if (toConnector.isVirtualBalanceEnabled)
            toConnector.virtualBalance = safeSub(toConnector.virtualBalance, amount);
        // ensure that the trade won't deplete the connector balance
        uint256 toConnectorBalance = getConnectorBalance(_toToken);
        assert(amount < toConnectorBalance);
        // transfer funds from the caller in the from connector token
        assert(_fromToken.transferFrom(msg.sender, this, _amount));
        // transfer funds to the caller in the to connector token
        // the transfer might fail if the actual connector balance is smaller than the virtual balance
        assert(_toToken.transfer(msg.sender, amount));
        // calculate conversion fee and dispatch the conversion event
        // the fee is higher (magnitude = 2) since cross connector conversion equals 2 conversions (from / to the smart token)
        uint256 feeAmount = safeSub(amount, getFinalAmount(amount, 2));
        dispatchConversionEvent(_fromToken, _toToken, _amount, amount, feeAmount);
        // dispatch price data updates for the smart token / both connectors
        emit PriceDataUpdate(_fromToken, token.totalSupply(), getConnectorBalance(_fromToken), fromConnector.weight);
        emit PriceDataUpdate(_toToken, token.totalSupply(), getConnectorBalance(_toToken), toConnector.weight);
        return amount;
    }
}