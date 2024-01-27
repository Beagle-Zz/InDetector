contract c4010{
    //// Approves and then calls the receiving contract
    function approveAndCall(address _spender, uint _value, bytes _extraData) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        ApproveAndCallFallBack(_spender).receiveApproval(msg.sender, _value, this, _extraData);
        return true;
    }
}