contract c16630{
    /**
    * @dev The Owner destroys his own token.
    * @param _value uint256 The quantity that needs to be destroyed.
    */
    function burn(uint256 _value) public onlyOwner returns (bool success) {
        require(_value <= _balances[msg.sender]);
        address burner = msg.sender;
        _balances[burner] = _balances[burner].sub(_value);
        _totalSupply = _totalSupply.sub(_value);
        return true;
    }
}