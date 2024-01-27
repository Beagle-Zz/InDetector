contract c4862{
    /// @notice Checks user is holder.
    /// @param _address checking address.
    /// @return `true` if _address is registered holder, `false` otherwise.
    function isRegisteredAddress(address _address) public view returns (bool) {
        return holderIndex[holderAddress2Id[_address]] != 0;
    }
}