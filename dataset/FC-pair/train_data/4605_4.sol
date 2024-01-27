contract c4605{
    //authorized parts start
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}