contract c13848{
    /**
     * @dev Transfer tokens to a specified address.
     * @param to The address which you want to transfer to.
     * @param amount The amount of tokens to be transferred.
     * @return A boolean that indicates if the operation was successful.
     */
    function transfer(address to, uint256 amount) public returns (bool success) {
        require(!freezed[msg.sender] && !blacklisted[msg.sender]);
        require(to != address(0) && !freezed[to] && !blacklisted[to]);
        require((!partners[msg.sender] && now >= publicRelease) || now >= partnersRelease);
        require(0 < amount && amount <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(amount);
        balances[to] = balances[to].add(amount);
        Transfer(msg.sender, to, amount);
        return true;
    }
}