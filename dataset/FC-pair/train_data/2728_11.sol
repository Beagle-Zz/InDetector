contract c2728{
    /// @notice Adds a list of addresses to the whitelist.
    /// @dev Requires that the msg.sender is the Admin. Emits an event on success.
    /// @param _users The list of addresses to add to the whitelist.
    function addAddressesToWhitelist(address[] _users) external onlyAdmin {
        require(_users.length > 0, "Cannot add an empty list to whitelist!");
        for (uint256 i = 0; i < _users.length; ++i) {
            address user = _users[i];
            require(user != address(0), "Cannot add the zero address to whitelist!");
            if (!whitelist[user]) {
                whitelist[user] = true;
                emit WhitelistAdded(user);
            }
        }
    }
}