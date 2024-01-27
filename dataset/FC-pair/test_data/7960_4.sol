contract c7960{
    /**
     * @dev The basic fundraiser initialization method.
     *
     * @param _startTime The start time of the fundraiser - Unix timestamp.
     * @param _endTime The end time of the fundraiser - Unix timestamp.
     * @param _conversionRate The number of tokens create for 1 ETH funded.
     * @param _beneficiary The address which will receive the funds gathered by the fundraiser.
     */
    function initializeBasicFundraiser(
        uint256 _startTime,
        uint256 _endTime,
        uint256 _conversionRate,
        address _beneficiary
    )
        internal
    {
        require(_endTime >= _startTime);
        require(_conversionRate > 0);
        require(_beneficiary != address(0));
        startTime = _startTime;
        endTime = _endTime;
        conversionRate = _conversionRate;
        beneficiary = _beneficiary;
    }
}