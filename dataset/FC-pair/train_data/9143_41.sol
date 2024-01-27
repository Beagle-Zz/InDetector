contract c9143{
    /// @dev Execution is allowed only by authorized contract
    modifier onlyAuthorized {
        if (authorized[msg.sender] || address(this) == msg.sender) {
            _;
        }
    }
}