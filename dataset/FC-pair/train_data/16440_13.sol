contract c16440{
    /**
        @dev returns the connector settings
        @param _converter       old converter contract address
        @param _address         connector's address to read from
        @param _isLegacyVersion true if the converter version is under 0.5
        @return connector's settings
    */
    function readConnector(IBancorConverter _converter, address _address, bool _isLegacyVersion) 
        private
        view
        returns(uint256 virtualBalance, uint32 weight, bool isVirtualBalanceEnabled, bool isPurchaseEnabled, bool isSet)
    {
        return _isLegacyVersion ? _converter.reserves(_address) : _converter.connectors(_address);
    }
}