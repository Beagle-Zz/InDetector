contract c10257{
    // Only the owner will be allowed to excute the function.
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}