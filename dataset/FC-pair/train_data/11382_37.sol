contract c11382{
    /**
        @dev updates the current conversion fee
        can only be called by the manager
        @param _conversionFee new conversion fee, represented in ppm
    */
    function setConversionFee(uint32 _conversionFee)
        public
        ownerOrManagerOnly
        validConversionFee(_conversionFee)
    {
        emit ConversionFeeUpdate(conversionFee, _conversionFee);
        conversionFee = _conversionFee;
    }
}