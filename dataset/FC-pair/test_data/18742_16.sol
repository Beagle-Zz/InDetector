contract c18742{
    /**
     * @dev Addition to StandardToken methods. Decrease the amount of tokens that
     * an owner allowed to a spender and execute a call with the sent data.
     *
     * @param _spender The address which will spend the funds.
     * @param _subtractedValue The amount of tokens to decrease the allowance by.
     * @param _data ABI-encoded contract call to call `_spender` address.
     */
    function decreaseApprovalAndCall(address _spender, uint _subtractedValue, bytes _data) public returns (bool) {
        require(_spender != address(this));
        super.decreaseApproval(_spender, _subtractedValue);
        require(_spender.call(_data));
        return true;
    }
}