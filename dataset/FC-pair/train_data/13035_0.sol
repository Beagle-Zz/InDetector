contract c13035{
    // Allows execution by the owner only
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}