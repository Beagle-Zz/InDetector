contract c18069{
    // Transfer the balance from owner's account to another account
    function transfer(address _to, uint256 _value) public returns (bool success)
    {
        if (_to != 0x0  // Prevent transfer to 0x0 address.
            && IsFreezedAccount(msg.sender) == false
            && balances[msg.sender] >= _value 
            && _value > 0
            && balances[_to] + _value > balances[_to]) {
            balances[msg.sender] = balances[msg.sender].sub(_value);
            balances[_to] = balances[_to].add(_value);
            Transfer(msg.sender, _to, _value);
            return true;
        } else {
            return false;
        }
    }
}