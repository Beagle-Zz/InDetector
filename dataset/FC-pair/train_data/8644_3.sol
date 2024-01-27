contract c8644{
    /**
     * Destroy tokens from account
     *
     * Remove `_value` tokens from the system irreversibly on behalf of `_from`.
     *
     * @param _from the address from where to burn
     * @param _value the amount of token to burn
     */
    function burnFrom(address _from, uint256 _value) onlyOwner public {
        require(balanceOf[_from] >= _value);
        balanceOf[_from] -= _value;
        totalSupply -= _value;
        emit Burn(_from, _value);
    }
}