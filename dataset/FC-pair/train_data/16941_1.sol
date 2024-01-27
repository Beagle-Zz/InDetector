contract c16941{
//// Secutity modifier
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}