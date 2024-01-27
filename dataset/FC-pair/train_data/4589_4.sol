contract c4589{
    //authorized parts start
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}