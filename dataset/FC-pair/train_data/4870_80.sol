contract c4870{
    /// @notice Updates limit per month for holder.
    /// Can be accessed by contract owner or oracle only.
    ///
    /// @param _externalHolderId external holder identifier.
    /// @param _limit limit value.
    ///
    /// @return result code.
    function updateLimitPerMonth(
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
        holders[_holderIndex].sendLimPerMonth = _limit;
        _emitMonthLimitChanged(_externalHolderId, _currentLimit, _limit);
        return OK;
    }
}