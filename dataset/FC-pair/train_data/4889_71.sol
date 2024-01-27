contract c4889{
    /// @notice Updates limit per day for holder.
    ///
    /// Can be accessed by contract owner only.
    ///
    /// @param _externalHolderId external holder identifier.
    /// @param _limit limit value.
    ///
    /// @return result code.
    function updateLimitPerDay(
        bytes32 _externalHolderId, 
        uint _limit
    ) 
    onlyOracleOrOwner 
    external 
    returns (uint) 
    {
        uint _holderIndex = holderIndex[_externalHolderId];
        require(_holderIndex != 0);
        uint _currentLimit = holders[_holderIndex].sendLimPerDay;
        holders[_holderIndex].sendLimPerDay = _limit;
        _emitDayLimitChanged(_externalHolderId, _currentLimit, _limit);
        return OK;
    }
}