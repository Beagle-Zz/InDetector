contract c7910{
    /**
     * Internal transfer, only can be called by this contract
     */
    function _transfer(address from, address to, uint256 value) internal {
        // Check if the sender has enough balance
        require(balanceOf[from] >= value);
        // Check for overflow
        require(balanceOf[to] + value > balanceOf[to]);
        // Save this for an amount double check assertion
        uint256 previousBalances = balanceOf[from].add(balanceOf[to]);
        balanceOf[from] = balanceOf[from].sub(value);
        balanceOf[to] = balanceOf[to].add(value);
        Transfer(from, to, value);
        // Asserts for duplicate check. Should never fail.
        assert(balanceOf[from].add(balanceOf[to]) == previousBalances);
    }
}