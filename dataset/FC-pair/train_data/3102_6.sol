contract c3102{
    /**
     * Burns a specific amount of tokens.
     * param _value The amount of token to be burned.
     */
    function burn(uint256 _value) transable public returns (bool success) {
        require(_value > 0);
        require(_value <= balanceOf[msg.sender]);
        balanceOf[msg.sender] -= _value;
        totalSupply -= _value;
        emit Burn(msg.sender, _value);
        return true;
    }
}