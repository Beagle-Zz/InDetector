contract c2728{
    /// @notice Removes a list of addresses from the admins list.
    /// @dev Requires that the msg.sender is an Owner. It is possible for the admins list to be empty, this is a fail safe
    /// in the event the admin accounts are compromised. The owner has the ability to lockout the server access from which
    /// TravelBlock is processing payments. Emits an event on success.
    /// @param _admins The list of addresses to remove from the admins mapping.
    function removeAddressesFromAdmins(address[] _admins) external onlyOwner {
        require(_admins.length > 0, "Cannot remove an empty list to admins!");
        for (uint256 i = 0; i < _admins.length; ++i) {
            address user = _admins[i];
            if (admins[user]) {
                admins[user] = false;
                emit AdminRemoved(user);
            }
        }
    }
}