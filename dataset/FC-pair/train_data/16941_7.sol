contract c16941{
//// Security function modifiers
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}