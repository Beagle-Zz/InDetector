contract c3575{
    /**
     * @dev this overridable function returns the current conversion rate for the fundraiser
     */
    function getConversionRate() public view returns (uint256) {
        return conversionRate;
    }
}