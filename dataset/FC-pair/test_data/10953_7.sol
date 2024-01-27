contract c10953{
    /**
        @dev upgrade an old converter to the latest version
        will throw if ownership wasn't transferred to the upgrader before calling this function.
        ownership of the new converter will be transferred back to the original owner.
        fires the ConverterUpgrade event upon success.
        @param _oldConverter   old converter contract address
        @param _version        old converter version
    */
    function upgrade(IBancorConverterExtended _oldConverter, bytes32 _version) public {
        bool formerVersions = false;
        if (_version == "0.4")
            formerVersions = true;
        acceptConverterOwnership(_oldConverter);
        IBancorConverterExtended newConverter = createConverter(_oldConverter);
        copyConnectors(_oldConverter, newConverter, formerVersions);
        copyConversionFee(_oldConverter, newConverter);
        copyQuickBuyPath(_oldConverter, newConverter);
        transferConnectorsBalances(_oldConverter, newConverter, formerVersions);                
        ISmartToken token = _oldConverter.token();
        if (token.owner() == address(_oldConverter)) {
            _oldConverter.transferTokenOwnership(newConverter);
            newConverter.acceptTokenOwnership();
        }
        _oldConverter.transferOwnership(msg.sender);
        newConverter.transferOwnership(msg.sender);
        newConverter.transferManagement(msg.sender);
        emit ConverterUpgrade(address(_oldConverter), address(newConverter));
    }
}