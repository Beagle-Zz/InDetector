contract c144{
    /**
     * Check if token offering address is set or not
     */
    modifier onlyTokenOfferingAddrNotSet() {
        require(tokenOfferingAddr == address(0x0));
        _;
    }
}