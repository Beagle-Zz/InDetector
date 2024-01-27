contract c7696{
    // modifier for Owner functions
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}