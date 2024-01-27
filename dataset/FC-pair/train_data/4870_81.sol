contract c4870{
    /// @notice Change country limits.
    /// Can be accessed by contract owner or oracle only.
    ///
    /// @param _countryCode country code.
    /// @param _limit limit value.
    ///
    /// @return result code.
    function changeCountryLimit(
        uint _countryCode, 
        uint _limit
    ) 
    onlyOracleOrOwner 
    external 
    returns (uint) 
    {
        uint _countryIndex = countryIndex[_countryCode];
        require(_countryIndex != 0);
        uint _currentTokenHolderNumber = countryLimitsList[_countryIndex].currentTokenHolderNumber;
        if (_currentTokenHolderNumber > _limit) {
            return _emitError(DATA_CONTROLLER_CURRENT_WRONG_LIMIT);
        }
        countryLimitsList[_countryIndex].maxTokenHolderNumber = _limit;
        _emitCountryCodeChanged(_countryIndex, _countryCode, _limit);
        return OK;
    }
}