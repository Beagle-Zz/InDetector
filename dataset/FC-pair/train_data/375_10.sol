contract c375{
    // transfer Token with timelocks
    function transferLocked(address _to, uint256[] _time, uint256[] _value) public validAddress(_to) returns (bool success) {
        require(_value.length == _time.length);
        if (lockNum[msg.sender] > 0) calcUnlock(msg.sender);
        uint256 i = 0;
        uint256 totalValue = 0;
        while (i < _value.length) {
            totalValue = add(totalValue, _value[i]);
            i++;
        }
        if (balanceP[msg.sender] >= totalValue && totalValue > 0) {
            i = 0;
            while (i < _time.length) {
                balanceP[msg.sender] = sub(balanceP[msg.sender], _value[i]);
                lockTime[_to].length = lockNum[_to]+1;
                lockValue[_to].length = lockNum[_to]+1;
                lockTime[_to][lockNum[_to]] = add(now, _time[i]);
                lockValue[_to][lockNum[_to]] = _value[i];
                // emit custom TransferLocked event
                emit TransferLocked(msg.sender, _to, lockTime[_to][lockNum[_to]], lockValue[_to][lockNum[_to]]);
                // emit standard Transfer event for wallets
                emit Transfer(msg.sender, _to, lockValue[_to][lockNum[_to]]);
                lockNum[_to]++;
                i++;
            }
            return true;
        }
        else {
            return false;
        }
    }
}