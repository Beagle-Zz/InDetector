contract c2144{
    /**
     * @dev Decrease the amount of tokens that an owner allowed to a spender.
     *
     * approve should be called when allowed[_spender] == 0. To decrement
     * allowed value is better to use this function to avoid 2 calls (and wait until
     * the first transaction is mined)
     * From MonolithDAO Token.sol
     * @param _spender The address which will spend the funds.
     * @param _subtractedValue The amount of tokens to decrease the allowance by.
     */
    function decreaseApproval(address _spender, uint _subtractedValue) public
    onlyPayloadSize(2)
    returns (bool success) {
        success = controller.decreaseApproval(msg.sender, _spender, _subtractedValue);
        if (success) {
            uint newValue = controller.allowance(msg.sender, _spender);
            emit Approval(msg.sender, _spender, newValue);
        }
    }
}