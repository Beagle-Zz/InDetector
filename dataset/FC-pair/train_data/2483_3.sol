contract c2483{
    /* Approve other address to spend tokens on your account */
    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value);
        allowances[msg.sender][_spender] = _value;          // Set allowance
        emit Approval(msg.sender, _spender, _value);        // Raise Approval event
        return true;
    }
}