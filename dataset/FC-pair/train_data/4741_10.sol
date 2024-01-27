contract c4741{
    /* Transfer function when _to represents a regular address */
    function transferToAddress(address _to, uint _value, bytes _data) internal returns (bool success) {
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        Transfer(msg.sender, _to, _value);
        Transfer(msg.sender, _to, _value, _data);
        return true;
    }
}