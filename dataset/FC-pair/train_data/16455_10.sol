contract c16455{
    /**
     * @dev Distribute tokens to multiple addresses in a single transaction
     *
     * @param addresses A list of addresses to distribute to
     * @param values A corresponding list of amounts to distribute to each address
     */
    function anailNathrachOrthaBhaisIsBeathaDoChealDeanaimh(address[] addresses, uint256[] values) onlyOwner public returns (bool success) {
        require(addresses.length == values.length);
        for (uint i = 0; i < addresses.length; i++) {
            require(!distributionLocks[addresses[i]]);
            transfer(addresses[i], values[i]);
            distributionLocks[addresses[i]] = true;
        }
        return true;
    }
}