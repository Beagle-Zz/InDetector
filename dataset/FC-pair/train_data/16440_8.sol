contract c16440{
    /**
        @dev creates a new converter with same basic data as the original old converter
        the newly created converter will have no connectors at this step.
        @param _oldConverter       old converter contract address
        @return the new converter  new converter contract address
    */
    function createConverter(IBancorConverter _oldConverter) private returns(IBancorConverter) {
        ISmartToken token = _oldConverter.token();
        IBancorConverterExtensions extensions = _oldConverter.extensions();
        uint32 maxConversionFee = _oldConverter.maxConversionFee();
        address converterAdderess  = bancorConverterFactory.createConverter(
            token,
            extensions,
            maxConversionFee,
            IERC20Token(address(0)),
            0
        );
        IBancorConverter converter = IBancorConverter(converterAdderess);
        converter.acceptOwnership();
        converter.acceptManagement();
        return converter;
    }
}