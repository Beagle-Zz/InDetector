contract c11074{
    /// @notice Returns holder id for the specified address.
    ///
    /// @param _holder holder address.
    ///
    /// @return holder id.
    function getHolderId(address _holder) public view returns (uint) {
        return holderIndex[_holder];
    }
}