contract c2339{
    /* Approves and then calls the receiving contract */
    function approveAndCall(address _spender, uint256 _value)public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
}