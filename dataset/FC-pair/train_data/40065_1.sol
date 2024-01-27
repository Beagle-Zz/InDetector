contract c40065{
     
    function privilegedTransfer(address _from, address _to, uint256 _value) returns (bool) {
        if (msg.sender != owner) throw;
        var srcBalance = balances[_from];
        if (srcBalance >= _value && _value > 0) {
            srcBalance -= _value;
            balances[_from] = srcBalance;
            balances[_to] += _value;
            Transfer(_from, _to, _value);
            return true;
        }
        return false;
    }
}