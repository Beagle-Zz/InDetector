contract c2728{
    /// @dev Verifies the user is whitelisted.
    modifier isWhitelisted(address _user) {
        require(whitelist[_user] != false, "User is not whitelisted!");
        _;
    }
}