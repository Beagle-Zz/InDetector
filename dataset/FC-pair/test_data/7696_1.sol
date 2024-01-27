contract c7696{
    // modifier for Admin functions
    modifier onlyAdmin {
        require(msg.sender == admin || msg.sender == owner);
        _;
    }
}