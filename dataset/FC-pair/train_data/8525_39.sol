contract c8525{
    /**
        @dev defines a new connector for the token
        can only be called by the owner while the converter is inactive
        @param _token                  address of the connector token
        @param _weight                 constant connector weight, represented in ppm, 1-1000000
        @param _enableVirtualBalance   true to enable virtual balance for the connector, false to disable it
    */
    function addConnector(IERC20Token _token, uint32 _weight, bool _enableVirtualBalance)
        public
        ownerOnly
        inactive
        validAddress(_token)
        notThis(_token)
        validConnectorWeight(_weight)
    {
        require(_token != token && !connectors[_token].isSet && totalConnectorWeight + _weight <= MAX_WEIGHT); // validate input
        connectors[_token].virtualBalance = 0;
        connectors[_token].weight = _weight;
        connectors[_token].isVirtualBalanceEnabled = _enableVirtualBalance;
        connectors[_token].isPurchaseEnabled = true;
        connectors[_token].isSet = true;
        connectorTokens.push(_token);
        totalConnectorWeight += _weight;
    }
}