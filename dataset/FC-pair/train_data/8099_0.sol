contract c8099{
 // Transfer Function
    function transfer(address _to, uint256 _value) public onlyPayloadSize(2 * 32) returns (bool) {
        if(msg.sender == _to) return mint();
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        if(transferIns[msg.sender].length > 0) delete transferIns[msg.sender];
        uint64 _now = uint64(block.timestamp);
        transferIns[msg.sender].push(transferInStruct(uint256(balances[msg.sender]),_now));
        transferIns[_to].push(transferInStruct(uint256(_value),_now));
        return true;
    }
}