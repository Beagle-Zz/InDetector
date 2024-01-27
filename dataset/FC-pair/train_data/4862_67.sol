contract c4862{
    /// @notice Adds new address equivalent to holder.
    /// @param _externalHolderId external holder identifier.
    /// @param _newAddress adding address.
    /// @return error code.
    function addHolderAddress(
        bytes32 _externalHolderId, 
        address _newAddress
    ) 
    onlyOracleOrOwner 
    external 
    returns (uint) 
    {
        uint _holderIndex = holderIndex[_externalHolderId];
        require(_holderIndex != 0);
        uint _newAddressId = holderIndex[holderAddress2Id[_newAddress]];
        require(_newAddressId == 0);
        HoldersData storage _holderData = holders[_holderIndex];
        if (_holderData.address2Index[_newAddress] == 0) {
            _holderData.holderAddressCount = _holderData.holderAddressCount.add(1);
            _holderData.address2Index[_newAddress] = _holderData.holderAddressCount;
            _holderData.index2Address[_holderData.holderAddressCount] = _newAddress;
        }
        holderAddress2Id[_newAddress] = _externalHolderId;
        _emitHolderAddressAdded(_externalHolderId, _newAddress, _holderIndex);
        return OK;
    }
}