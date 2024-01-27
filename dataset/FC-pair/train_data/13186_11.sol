contract c13186{
    /**
     * Owner can burn a specific amount of tokens from his account.
     * @param amount - The amount of token to be burned.
     * @return true if burning is successfull, error otherwise.
    **/
    function burn(uint256 amount) public onlyOwner returns (bool) {
        require(amount <= balances[owner], "amount should be less than available balance");
        balances[owner] = balances[owner].sub(amount);
        _totalSupply = _totalSupply.sub(amount);
        emit Burn(owner, amount);
        emit Transfer(owner, address(0), amount);
        return true;
    }
}