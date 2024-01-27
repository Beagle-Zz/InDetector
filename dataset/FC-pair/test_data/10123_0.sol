contract c10123{
    // Additional accessors
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}