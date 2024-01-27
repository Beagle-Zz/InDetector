contract c8135{
    /**
     * @dev Only contract owner can burns a specific amount of tokens that he owns.
     * @param _value The amount of token to be burned.
     */
    function burn(uint256 _value) public onlyOwner {
        require(_value <= balances[owner]);
        balances[owner] = balances[owner].sub(_value);
        totalSupply_ = totalSupply_.sub(_value);
        emit Burn(owner, _value);
        emit Transfer(owner, address(0), _value);
    }
}