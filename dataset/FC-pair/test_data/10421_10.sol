contract c10421{
    /**
     * approve should be called when allowances[_spender] == 0. To increment
     * allowances value is better to use this function to avoid 2 calls (and wait until
     * the first transaction is mined)
     * From MonolithDAO Token.sol
     */
    function increaseApproval(address _spender, uint _addedValue) stoppable public returns (bool) {
        // Check for overflows
        require(allowances[msg.sender][_spender] + _addedValue > allowances[msg.sender][_spender]);
        allowances[msg.sender][_spender] += _addedValue;
        emit Approval(msg.sender, _spender, allowances[msg.sender][_spender]);
        return true;
    }
}