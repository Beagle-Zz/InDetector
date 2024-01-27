contract c2728{
    /// @dev Verifies the msg.sender is a member of the admins mapping. Owner is by default an admin.
    modifier onlyAdmin() {
        require(admins[msg.sender] || msg.sender == owner, "msg.sender is not an admin!");
        _;
    }
}