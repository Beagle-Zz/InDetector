contract c8909{
    /* Send coins */
    function transfer(address _to, uint256 _value) onlyActive public returns (bool success) {
        if (balances[msg.sender] >= _value && _value > 0) {
            balances[msg.sender] = safeSub(balances[msg.sender], _value);
            balances[_to] = safeAdd(balances[_to], _value);
            emit Transfer(msg.sender, _to, _value);
            return true;
        } else {
            return false;
        }
    }
}