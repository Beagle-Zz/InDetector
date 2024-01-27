contract c13848{
    /**
     * @dev Transfer tokens from one address to another.
     * @param from The address which you want to send tokens from.
     * @param to The address which you want to transfer to.
     * @param amount The amount of tokens to be transferred.
     * @return A boolean that indicates if the operation was successful.
     */
    function transferFrom(address from, address to, uint256 amount) public returns (bool success) {
        require(!blacklisted[msg.sender]);
        require(to != address(0) && !freezed[to] && !blacklisted[to]);
        require(from != address(0) && !freezed[from] && !blacklisted[from]);
        require((!partners[from] && now >= publicRelease) || now >= partnersRelease);
        require(0 < amount && amount <= balances[from]);
        require(amount <= allowed[from][msg.sender]);
        balances[from] = balances[from].sub(amount);
        balances[to] = balances[to].add(amount);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(amount);
        Transfer(from, to, amount);
        return true;
    }
}