contract c13904{
    // ------------------------------------------------------------------------
    // Function to mint tokens
    // _to The address that will receive the minted tokens.
    // _amount The amount of tokens to mint.
    // A boolean that indicates if the operation was successful.
    // ------------------------------------------------------------------------
    function mint(address _to, uint256 _amount) onlyOwner public returns (bool) {
        require(_to != address(0));
        require(_amount > 0);
        uint newamount = _amount * 10**uint(decimals);
        _totalSupply = _totalSupply.add(newamount);
        balances[_to] = balances[_to].add(newamount);
        emit Mint(_to, newamount);
        emit Transfer(address(0), _to, newamount);
        return true;
    }
}