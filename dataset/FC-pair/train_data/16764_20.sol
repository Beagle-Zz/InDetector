contract c16764{
    /*
     * Check if token sale address is not set
     */
    modifier onlyWhenTokenSaleAddrNotSet() {
        require(tokenSaleAddr == address(0x0));
        _;
    }
}