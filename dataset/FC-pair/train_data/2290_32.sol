contract c2290{
    /**
     * @notice Function used to intialize the contract variables
     * @param _startTime Unix timestamp at which offering get started
     * @param _endTime Unix timestamp at which offering get ended
     * @param _cap Maximum No. of tokens for sale
     * @param _rate Token units a buyer gets per wei / base unit of POLY
     * @param _fundRaiseType Type of currency used to collect the funds
     * @param _fundsReceiver Ethereum account address to hold the funds
     */
    function configure(
        uint256 _startTime,
        uint256 _endTime,
        uint256 _cap,
        uint256 _rate,
        uint8 _fundRaiseType,
        address _fundsReceiver
    )
    public
    onlyFactory
    {
        require(_rate > 0, "Rate of token should be greater than 0");
        require(_fundsReceiver != address(0), "Zero address is not permitted");
        require(_startTime >= now && _endTime > _startTime, "Date parameters are not valid");
        require(_cap > 0, "Cap should be greater than 0");
        startTime = _startTime;
        endTime = _endTime;
        cap = _cap;
        rate = _rate;
        wallet = _fundsReceiver;
        _check(_fundRaiseType);
    }
}