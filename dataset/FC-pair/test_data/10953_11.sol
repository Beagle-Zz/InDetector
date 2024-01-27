contract c10953{
    /**
        @dev copies the conversion fee from the old converter to the new one
        @param _oldConverter    old converter contract address
        @param _newConverter    new converter contract address
    */
    function copyConversionFee(IBancorConverterExtended _oldConverter, IBancorConverterExtended _newConverter) private {
        uint32 conversionFee = _oldConverter.conversionFee();
        _newConverter.setConversionFee(conversionFee);
    }
}