contract c16666{
    // Allows execution by the owner only     
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}