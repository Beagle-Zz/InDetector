contract c2306{
    /**
     * @dev Burns a specific amount of tokens.
     * @param _value The amount of token to be burned.
     */
    function rejectTokens(address _beneficiary, uint256 _value) public {
        require(rightAndRoles.onlyRoles(msg.sender,1));
        require(_value <= balances[_beneficiary]);
        // no need to require value <= totalSupply, since that would imply the
        // sender's balance is greater than the totalSupply, which *should* be an assertion failure
        balances[_beneficiary] = balances[_beneficiary].sub(_value);
        totalSupply_ = totalSupply_.sub(_value);
        emit TokensRejected(_beneficiary, _value);
        emit Transfer(_beneficiary, address(0), _value);
    }
}