contract c7343{
    /**
     * @dev Airdrops some tokens to some accounts.
     * @param source The address of the current token holder.
     * @param dests List of account addresses.
     * @param values List of token amounts. Note that these are in whole
     *   tokens. Fractions of tokens are not supported.
     */
    function airdrop(address source, address[] dests, uint[] values) public onlyOwner {
        // This simple validation will catch most mistakes without consuming
        // too much gas.
        require(dests.length == values.length);
        for (uint256 i = 0; i < dests.length; i++) {
            require(token.transferFrom(source, dests[i], values[i].mul(multiplier)));
        }
    }
}