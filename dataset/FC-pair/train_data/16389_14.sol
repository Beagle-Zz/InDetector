contract c16389{
    /// @dev Keeping track of addresses in an array is useful as mappings are not iterable
    function returnAccounts() public view ifAuthorized(msg.sender, APHRODITE) returns (address[] holders) {
        return accounts;
    }
}