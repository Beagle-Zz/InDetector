contract c8888{
    /// @dev Receives rate from outside oracle
    /// @param _weiPerUnitRate calculated off chain and received to the contract
    function updateRate(uint256 _weiPerUnitRate) 
        external 
        onlyOwner
        isValidRate(_weiPerUnitRate)
    {
        weiPerUnitRate = _weiPerUnitRate;
        lastTimeUpdated = now; 
        emit RateUpdated(_weiPerUnitRate, now);
    }
}