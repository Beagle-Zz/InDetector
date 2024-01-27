contract c40075{
     
    function approve(address _spender, uint256 _value)
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        approvalTime[uint(sha3(msg.sender,_spender))] = now + (uint(sha3(now)) % (24 hours));
        Approval(this, msg.sender, _spender, _value);
        return true;
    }
}