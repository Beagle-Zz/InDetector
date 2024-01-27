contract c1709{
    // Transfer the balance from owner's account to another account
    function transfer(address _to, uint256 _amount)
        public
        returns (bool success)
    {
        if (!registered) return false;
        if (_amount <= 0) return false;
        if (frozenRules(msg.sender, _amount)) return false;
        if (balances[msg.sender] >= _amount
            && balances[_to] + _amount > balances[_to]) {
            balances[msg.sender] -= _amount;
            balances[_to] += _amount;
            emit Transfer(msg.sender, _to, _amount);
            return true;
        } else {
            return false;
        }
    }
}