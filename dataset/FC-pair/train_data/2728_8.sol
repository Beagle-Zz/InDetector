contract c2728{
    /// @notice Adds a list of addresses to the admins list.
    /// @dev Requires that the msg.sender is the Owner. Emits an event on success.
    /// @param _admins The list of addresses to add to the admins mapping.
    function addAddressesToAdmins(address[] _admins) external onlyOwner {
        require(_admins.length > 0, "Cannot add an empty list to admins!");
        for (uint256 i = 0; i < _admins.length; ++i) {
            address user = _admins[i];
            require(user != address(0), "Cannot add the zero address to admins!");
            if (!admins[user]) {
                admins[user] = true;
                emit AdminAdded(user);
            }
        }
    }
}