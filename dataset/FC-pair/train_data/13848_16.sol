contract c13848{
    /**
     * MintableToken interface.
     */
    /**
     * @dev Function to mint tokens to investors.
     * @param to The address that will receive the minted tokens.
     * @param amount The amount of tokens to mint, in fraction units.
     * @return A boolean that indicates if the operation was successful.
     */
    function mint(address to, uint256 amount) onlyOwner canMint public returns (bool success) {
        require(!freezed[to] && !blacklisted[to] && !partners[to]);
        uint256 total = totalSupply_.add(amount);
        require(total <= cap);
        totalSupply_ = total;
        balances[to] = balances[to].add(amount);
        Mint(to, amount);
        Transfer(address(0), to, amount);
        return true;
    }
}