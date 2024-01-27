contract c7960{
    /**
     * @dev Burnes `_value` number of tokens.
     *
     * @param _value The number of tokens that will be burned.
     */
    function burn(uint256 _value) public {
        require(_value != 0);
        address burner = msg.sender;
        require(_value <= balances[burner]);
        balances[burner] = balances[burner].minus(_value);
        totalSupply = totalSupply.minus(_value);
        emit Burn(burner, _value);
        emit Transfer(burner, address(0), _value);
    }
}