contract c18742{
    /**
     * @dev Addition to StandardToken methods. Increase the amount of tokens that
     * an owner allowed to a spender and execute a call with the sent data.
     *
     * @param _spender The address which will spend the funds.
     * @param _addedValue The amount of tokens to increase the allowance by.
     * @param _data ABI-encoded contract call to call `_spender` address.
     */
    function increaseApprovalAndCall(address _spender, uint _addedValue, bytes _data) public returns (bool) {
        require(_spender != address(this));
        super.increaseApproval(_spender, _addedValue);
        require(_spender.call(_data));
        return true;
    }
}