contract c7168{
    // ------------------------------------------------------------------------
    // Owner can mint new tokens
    // ------------------------------------------------------------------------
    function mint(address to, uint tokens) public onlyOwner canMint returns (bool) {        
        _totalSupply = safeAdd(_totalSupply, tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Mint(to, tokens);
        emit Transfer(address(0), to, tokens);
        return true;
    }
}