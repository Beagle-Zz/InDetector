contract c16832{
    // ------------------------------------------------------------------------
    // Decrease the amount of tokens that an owner allowed to a spender.
    //
    // approve should be called when allowed[_spender] == 0. To decrement
    // allowed value is better to use this function to avoid 2 calls (and wait until
    // the first transaction is mined)
    // From MonolithDAO Token.sol
    // _spender The address which will spend the funds.
    // _subtractedValue The amount of tokens to decrease the allowance by.
    // ------------------------------------------------------------------------
    function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool) {
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
        }
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}