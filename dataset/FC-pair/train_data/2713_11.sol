contract c2713{
    /**
     * approve should be called when allowances[_spender] == 0. To increment
     * allowances value is better to use this function to avoid 2 calls (and wait until
     * the first transaction is mined)
     */
    function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
        // Check for overflows
        require(allowances[msg.sender][_spender].add(_addedValue) > allowances[msg.sender][_spender]);
        allowances[msg.sender][_spender] =allowances[msg.sender][_spender].add(_addedValue);
        emit Approval(msg.sender, _spender, allowances[msg.sender][_spender]);
        return true;
    }
}