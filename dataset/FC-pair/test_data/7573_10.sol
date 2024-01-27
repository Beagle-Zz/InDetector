contract c7573{
    // ------------------------------------------------------------------------
    // Owner can burn tokens
    // ------------------------------------------------------------------------
    function burn(uint256 _value) public onlyOwner {
        require(_value <= balances[msg.sender]);
        address burner = msg.sender;
        balances[burner] = balances[burner].sub(_value);
        _totalSupply = _totalSupply.sub(_value);
        emit Burn(burner, _value);
    }
}