contract c7254{
    /* Withdraws to address _to form the address _from up to the amount _value */
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
        if (balances[_from] >= _value
        && allowed[_from][msg.sender] >= _value
        && _value > 0
        && balances[_to] + _value > balances[_to]) {
            balances[_from] -= _value;
            allowed[_from][msg.sender] -= _value;
            balances[_to] += _value;
            Transfer(_from, _to, _value);
            return true;
        } else {
            return false;
        }
    }
}