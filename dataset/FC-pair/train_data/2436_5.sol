contract c2436{
    /// @dev Operation modifiers for limiting access
    modifier onlyManager() {
        require(msg.sender == managerPrimary || msg.sender == managerSecondary);
        _;
    }
}