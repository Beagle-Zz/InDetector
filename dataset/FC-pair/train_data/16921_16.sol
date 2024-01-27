contract c16921{
    /// @notice Returns the nth Cutie assigned to an address, with n specified by the
    ///  _index argument.
    /// @param _owner The owner of the Cuties we are interested in.
    /// @param _index The zero-based index of the cutie within the owner's list of cuties.
    ///  Must be less than balanceOf(_owner).
    /// @dev This method must not be called by smart contract code. It will almost
    ///  certainly blow past the block gas limit once there are a large number of
    ///  Cuties in existence. Exists only to allow off-chain queries of ownership.
    ///  Optional method for ERC-721.
    function tokenOfOwnerByIndex(address _owner, uint256 _index)
        external
        view
        returns (uint256 cutieId)
    {
        uint40 count = 0;
        for (uint40 i = 1; i <= _totalSupply(); ++i) {
            if (cutieIndexToOwner[i] == _owner) {
                if (count == _index) {
                    return i;
                } else {
                    count++;
                }
            }
        }
        revert();
    }
}