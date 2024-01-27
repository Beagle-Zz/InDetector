contract c2755{
    /**
     * @dev Sets the new conversion rate
     *
     * @param _conversionRate New conversion rate
     */
    function setConversionRate(uint256 _conversionRate) public onlyOwner {
        require(_conversionRate > 0);
        conversionRate = _conversionRate;
        emit ConversionRateChanged(_conversionRate);
    }
}