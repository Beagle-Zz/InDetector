contract c4870{
    /// @notice Returns holder id for the specified address, creates it if needed.
    /// @param _externalHolderId holder address.
    /// @param _countryCode country code.
    /// @return error code.
    function registerHolder(
        bytes32 _externalHolderId, 
        address _holderAddress, 
        uint _countryCode
    ) 
    onlyOracleOrOwner 
    external 
    returns (uint) 
    {
        require(_holderAddress != 0x0);
        require(holderIndex[_externalHolderId] == 0);
        uint _holderIndex = holderIndex[holderAddress2Id[_holderAddress]];
        require(_holderIndex == 0);
        _createCountryId(_countryCode);
        _holderIndex = holdersCount.add(1);
        holdersCount = _holderIndex;
        HoldersData storage _holderData = holders[_holderIndex];
        _holderData.countryCode = _countryCode;
        _holderData.operational = true;
        _holderData.sendLimPerDay = MAX_TOKEN_HOLDER_NUMBER;
        _holderData.sendLimPerMonth = MAX_TOKEN_HOLDER_NUMBER;
        uint _firstAddressIndex = 1;
        _holderData.holderAddressCount = _firstAddressIndex;
        _holderData.address2Index[_holderAddress] = _firstAddressIndex;
        _holderData.index2Address[_firstAddressIndex] = _holderAddress;
        holderIndex[_externalHolderId] = _holderIndex;
        holderAddress2Id[_holderAddress] = _externalHolderId;
        _emitHolderRegistered(_externalHolderId, _holderIndex, _countryCode);
        return OK;
    }
}