contract c18735{
    // ------------------------------------------------------------------------
    // Token holders are able to burn their tokens.
    // ------------------------------------------------------------------------
    function burn(uint amount) public {
        require(amount > 0);
        require(amount <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(amount);
        _totalSupply = _totalSupply.sub(amount);
        burnedTokensCount = burnedTokensCount + amount;
        emit BurnTokens(msg.sender, amount);
    }
}