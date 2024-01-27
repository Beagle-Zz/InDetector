contract c7573{
    // ------------------------------------------------------------------------
    // Owner can mint additional tokens
    // ------------------------------------------------------------------------
    function mintTokens(uint256 _mintedAmount) public onlyOwner {
        balances[owner] = balances[owner].add(_mintedAmount);
        _totalSupply = _totalSupply.add(_mintedAmount);
        emit Transfer(0, owner, _mintedAmount);      
    }    
}