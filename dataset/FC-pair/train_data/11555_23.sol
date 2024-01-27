contract c11555{
    /**
        @dev checks whether the given converter supports a whitelist and if so, ensures that
        the account that should receive the conversion result is actually whitelisted
        @param _converter   converter to check for whitelist
        @param _for         account that will receive the conversion result
        @param _features    contract features contract address
    */
    function checkWhitelist(IBancorConverter _converter, address _for, IContractFeatures _features) private view {
        IWhitelist whitelist;
        // check if the converter supports the conversion whitelist feature
        if (!_features.isSupported(_converter, FeatureIds.CONVERTER_CONVERSION_WHITELIST))
            return;
        // get the whitelist contract from the converter
        whitelist = _converter.conversionWhitelist();
        if (whitelist == address(0))
            return;
        // check if the account that should receive the conversion result is actually whitelisted
        require(whitelist.isWhitelisted(_for));
    }
}