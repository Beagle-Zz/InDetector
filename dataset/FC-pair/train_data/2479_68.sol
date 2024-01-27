contract c2479{
    //////////////////////////////
    ///////// Get Functions
    //////////////////////////////
    /**
     * @notice Get security token address by ticker name
     * @param _symbol Symbol of the Scurity token
     * @return address
     */
    function getSecurityTokenAddress(string _symbol) public view returns (address) {
        string memory __symbol = upper(_symbol);
        return symbols[__symbol];
    }
}