contract c23{
    /*
     * Check if token transfer destination is valid
     */
    modifier onlyValidDestination(address to) {
        require(to != address(0x0)
            && to != address(this)
            && to != owner
            && to != adminAddr
            && to != tokenSaleAddr);
        _;
    }
}