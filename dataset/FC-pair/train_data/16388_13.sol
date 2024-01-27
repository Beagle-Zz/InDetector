contract c16388{
    /// @dev Keeping track of addresses in an array is useful as mappings are not iterable
    /// @return Number of addresses holding this token
    function numberAccounts() public view ifAuthorized(msg.sender, APHRODITE) returns (uint256) {
        return accounts.length;
    }
}