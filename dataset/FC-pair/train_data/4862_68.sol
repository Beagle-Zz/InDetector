contract c4862{
    /// @notice Remove an address owned by a holder.
    /// @param _externalHolderId external holder identifier.
    /// @param _address removing address.
    /// @return error code.
    function removeHolderAddress(
        bytes32 _externalHolderId, 
        address _address
    ) 
    onlyOracleOrOwner 
    external 
    returns (uint) 
    {
        uint _holderIndex = holderIndex[_externalHolderId];
        require(_holderIndex != 0);
        HoldersData storage _holderData = holders[_holderIndex];
        uint _tempIndex = _holderData.address2Index[_address];
        require(_tempIndex != 0);
        address _lastAddress = _holderData.index2Address[_holderData.holderAddressCount];
        _holderData.address2Index[_lastAddress] = _tempIndex;
        _holderData.index2Address[_tempIndex] = _lastAddress;
        delete _holderData.address2Index[_address];
        _holderData.holderAddressCount = _holderData.holderAddressCount.sub(1);
        delete holderAddress2Id[_address];
        _emitHolderAddressRemoved(_externalHolderId, _address, _holderIndex);
        return OK;
    }
}