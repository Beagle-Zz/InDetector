contract c13848{
    /**
     * GrantableToken interface.
     */
    /**
     * @dev Function to mint tokens to partners (grants), including up to reserved tokens.
     * @param to The address that will receive the minted tokens.
     * @param amount The amount of tokens to mint, in fraction units.
     * @return A boolean that indicates if the operation was successful.
     */
    function grant(address to, uint256 amount) onlyOwner canGrant public returns (bool success) {
        require(!freezed[to] && !blacklisted[to] && partners[to]);
        require(amount <= reservedSupply);
        totalSupply_ = totalSupply_.add(amount);
        reservedSupply = reservedSupply.sub(amount);
        balances[to] = balances[to].add(amount);
        Grant(to, amount);
        Transfer(address(0), to, amount);
        return true;
    }
}