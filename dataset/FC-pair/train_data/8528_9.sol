contract c8528{
    /**
        @dev copies the connectors from the old converter to the new one.
        note that this will not work for an unlimited number of connectors due to block gas limit constraints.
        @param _oldConverter    old converter contract address
        @param _newConverter    new converter contract address
        @param _isLegacyVersion true if the converter version is under 0.5
    */
    function copyConnectors(IBancorConverterExtended _oldConverter, IBancorConverterExtended _newConverter, bool _isLegacyVersion)
        private
    {
        uint256 virtualBalance;
        uint32 weight;
        bool isVirtualBalanceEnabled;
        bool isPurchaseEnabled;
        bool isSet;
        uint16 connectorTokenCount = _isLegacyVersion ? _oldConverter.reserveTokenCount() : _oldConverter.connectorTokenCount();
        for (uint16 i = 0; i < connectorTokenCount; i++) {
            address connectorAddress = _isLegacyVersion ? _oldConverter.reserveTokens(i) : _oldConverter.connectorTokens(i);
            (virtualBalance, weight, isVirtualBalanceEnabled, isPurchaseEnabled, isSet) = readConnector(
                _oldConverter,
                connectorAddress,
                _isLegacyVersion
            );
            IERC20Token connectorToken = IERC20Token(connectorAddress);
            _newConverter.addConnector(connectorToken, weight, isVirtualBalanceEnabled);
            if (isVirtualBalanceEnabled)
                _newConverter.updateConnector(connectorToken, weight, isVirtualBalanceEnabled, virtualBalance);
        }
    }
}