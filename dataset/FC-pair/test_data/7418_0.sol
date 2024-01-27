contract c7418{
    // Setting the ownership function of this contract
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}