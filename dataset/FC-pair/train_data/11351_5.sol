contract c11351{
    // modifiers for restricting access to methods
    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }
}