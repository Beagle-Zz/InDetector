contract c8293{
    // modifier for Admin functions
    modifier onlyAdmin {
        require(msg.sender == admin || msg.sender == owner);
        _;
    }
}