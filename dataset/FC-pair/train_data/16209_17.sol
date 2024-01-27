contract c16209{
    /**
     * @dev Function to burn tokens.
     * @param _burner The address of token holder.
     * @param _value The amount of token to be burned.
     */
    function burnFunction(address _burner, uint256 _value) internal returns (bool) {
        require(_value > 0);
		require(_value <= balances[_burner]);
        // no need to require value <= totalSupply, since that would imply the
        // sender's balance is greater than the totalSupply, which *should* be an assertion failure
        balances[_burner] = balances[_burner].sub(_value);
        totalSupply = totalSupply.sub(_value);
        Burn(_burner, _value);
		return true;
    }
}