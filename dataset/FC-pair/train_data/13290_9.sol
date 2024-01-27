contract c13290{
    // ------------------------------------------------------------------------
    // Burns a specific number of tokens
    // ------------------------------------------------------------------------
    function burn(uint256 _value) public onlyOwner {
        require(_value > 0);
        address burner = msg.sender;
        balances[burner] = safeSub(balances[burner], _value);
        _totalSupply = safeSub(_totalSupply, _value);
        emit Burned(burner, _value);
    }
}