contract c2042{
        /**
     * approve should be called when allowances[_spender] == 0. To increment
     * allowances value is better to use this function to avoid 2 calls (and wait until
     * the first transaction is mined)
     * From MonolithDAO Token.sol
     */
    function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
        if (_addedValue <= 0) throw;
        allowance[msg.sender][_spender] = SafeMath.safeAdd(allowance[msg.sender][_spender], _addedValue); 
        Approval(msg.sender, _spender, allowance[msg.sender][_spender]);
        return true;
    }
}