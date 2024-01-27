contract c4890{
    /// @notice Change operational status for holder.
    /// Can be accessed by contract owner or oracle only.
    ///
    /// @param _externalHolderId external holder identifier.
    /// @param _operational operational status.
    ///
    /// @return result code.
    function changeOperational(
        bytes32 _externalHolderId, 
        bool _operational
    ) 
    onlyOracleOrOwner 
    external 
    returns (uint) 
    {
        uint _holderIndex = holderIndex[_externalHolderId];
        require(_holderIndex != 0);
        holders[_holderIndex].operational = _operational;
        _emitHolderOperationalChanged(_externalHolderId, _operational);
        return OK;
    }
}