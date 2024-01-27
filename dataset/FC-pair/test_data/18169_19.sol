contract c18169{
    /**
     * @dev Originally in ERC20 this function to check the amount of tokens that an owner allowed to a spender.
     *
     * Function was added purly for backward compatibility with ERC20. Use operator logic from ERC777 instead.
     * @param _owner address The address which owns the funds.
     * @param _spender address The address which will spend the funds.
     * @return A returning uint256 balanceOf _spender if it's active operator and 0 if not.
     */
    function allowance(address _owner, address _spender) public view returns (uint256 _amount) {
        if (isOperatorFor[_spender][_owner]) {
            _amount = balanceOf[_owner];
        } else {
            _amount = 0;
        }
    }
}