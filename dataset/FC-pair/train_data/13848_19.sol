contract c13848{
    /**
     * BurnableToken interface.
     */
    /**
     * @dev Burns a specific amount of tokens.
     * @param amount The amount of token to be burned, in fraction units.
     * @return A boolean that indicates if the operation was successful.
     */
    function burn(uint256 amount) public returns (bool success) {
        require(!freezed[msg.sender]);
        require((!partners[msg.sender] && now >= publicRelease) || now >= partnersRelease);
        require(amount > 0 && amount <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(amount);
        totalSupply_ = totalSupply_.sub(amount);
        Burn(msg.sender, amount);
        Transfer(msg.sender, address(0), amount);
        return true;
    }
}