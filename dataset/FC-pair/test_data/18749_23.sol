contract c18749{
    // check fund controls before forwarding call
    // Allow _spender to withdraw from your account, multiple times, up to the _value amount.
    // If this function is called again it overwrites the current allowance with _value .
    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(!fundManagers[msg.sender]);
        return super.approve(_spender, _value);
    }
}