contract c2432{
    // ------------------------------------------------------------------------
    // Mint tokens
    // ------------------------------------------------------------------------
    function mint(address tokenOwner, uint tokens) public onlyOwner returns (bool success) {
        require(mintable);
        require( balances[tokenOwner]+tokens >=  balances[tokenOwner]);
        balances[tokenOwner] += tokens;
        require(_totalSupply+tokens>=_totalSupply);
        _totalSupply += tokens;
        emit Transfer(address(0), tokenOwner, tokens);
        return true;
    }
}