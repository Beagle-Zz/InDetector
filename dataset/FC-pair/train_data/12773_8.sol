contract c12773{
    // ------------------------------------------------------------------------
    // Burn function
    // Owner can burn tokens = send tokens to address(0) 
    // and decrease total supply
    // ------------------------------------------------------------------------
    function burn(uint tokens) public onlyOwner returns (bool success) {
        require(balances[msg.sender] >= tokens);
        balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        _totalSupply = safeSub(_totalSupply, tokens);
        Burn(msg.sender, tokens);
        Transfer(msg.sender, address(0), tokens);
        return true;
    }
}