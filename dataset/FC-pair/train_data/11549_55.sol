contract c11549{
    /**
        @dev creates a new converter with the given arguments and transfers
        the ownership and management to the sender.
        @param  _token              smart token governed by the converter
        @param  _registry           address of a contract registry contract
        @param  _maxConversionFee   maximum conversion fee, represented in ppm
        @param  _connectorToken     optional, initial connector, allows defining the first connector at deployment time
        @param  _connectorWeight    optional, weight for the initial connector
        @return a new converter
    */
    function createConverter(
        ISmartToken _token,
        IContractRegistry _registry,
        uint32 _maxConversionFee,
        IERC20Token _connectorToken,
        uint32 _connectorWeight
    ) public returns(address converterAddress) {
        BancorConverter converter = new BancorConverter(
            _token,
            _registry,
            _maxConversionFee,
            _connectorToken,
            _connectorWeight
        );
        converter.transferOwnership(msg.sender);
        converter.transferManagement(msg.sender);
        address _converterAddress = address(converter);
        emit NewConverter(_converterAddress, msg.sender);
        return _converterAddress;
    }
}