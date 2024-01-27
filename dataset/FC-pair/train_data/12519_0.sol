contract c12519{
    // Throw if called by any account other than the current owner
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}