contract c4008{
    /**
     * @dev Burns a specific amount of tokens.
     * @param _value The amount of token to be burned.
     */
    function burn(uint256 _value) public {
        require(_value > 0);
        require(_value <= balances[msg.sender]);
        // no need to require value <= totalSupply, since that would imply the
        // sender's balance is greater than the totalSupply, which *should* be an assertion failure
        address burner = msg.sender;
        balances[burner] = balances[burner].sub(_value);
        totalSupply = totalSupply.sub(_value);
        emit Burn(burner, _value);
        emit Transfer(burner, address(0), _value);
        // we remove the burner from the list of token 
        // holders if the burner now holds 0 tokens
        if(balances[burner] == 0){
            addresses[indexes[burner]] = addresses[lastIndex];
            indexes[addresses[lastIndex]] = indexes[burner];
            indexes[burner] = 0;
            delete addresses[lastIndex];
            lastIndex--;
        }
    }
}