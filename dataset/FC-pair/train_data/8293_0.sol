contract c8293{
    // modifier for Owner functions
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}