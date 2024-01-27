contract c1481{
    /**
     * @dev Transfer ownership of token contract to _addr
     * @param _addr address
     */
    function transferTokenOwnership(address _addr) onlyOwner public {
        token.transferOwnership(_addr);
    }
}