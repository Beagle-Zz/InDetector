contract c10953{
    /**
        @dev creates a new converter with same basic data as the original old converter
        the newly created converter will have no connectors at this step.
        @param _oldConverter    old converter contract address
        @return the new converter  new converter contract address
    */
    function createConverter(IBancorConverterExtended _oldConverter) private returns(IBancorConverterExtended) {
        IWhitelist whitelist;
        ISmartToken token = _oldConverter.token();
        uint32 maxConversionFee = _oldConverter.maxConversionFee();
        address converterAdderess  = bancorConverterFactory.createConverter(
            token,
            registry,
            maxConversionFee,
            IERC20Token(address(0)),
            0
        );
        IBancorConverterExtended converter = IBancorConverterExtended(converterAdderess);
        converter.acceptOwnership();
        converter.acceptManagement();
        // get the contract features address from the registry
        IContractFeatures features = IContractFeatures(registry.getAddress(ContractIds.CONTRACT_FEATURES));
        if (features.isSupported(_oldConverter, FeatureIds.CONVERTER_CONVERSION_WHITELIST)) {
            whitelist = _oldConverter.conversionWhitelist();
            if (whitelist != address(0))
                converter.setConversionWhitelist(whitelist);
        }
        return converter;
    }
}