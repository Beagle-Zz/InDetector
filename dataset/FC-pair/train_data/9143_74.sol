contract c9143{
    /// @notice Changes text for holder.
    /// Can be accessed by contract owner or oracle only.
    ///
    /// @param _externalHolderId external holder identifier.
    /// @param _text changing text.
    ///
    /// @return result code.
    function updateTextForHolder(bytes32 _externalHolderId, bytes _text) onlyOracleOrOwner external returns (uint) {
        uint _holderIndex = holderIndex[_externalHolderId];
        require(_holderIndex != 0);
        holders[_holderIndex].text = _text;
        return OK;
    }
}