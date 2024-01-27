contract c7254{
    /* Transfer function when _to represents a contract address, with the caveat
    that the contract needs to implement the tokenFallback function in order to receive tokens */
    function transferToContract(address _to, uint _value, bytes _data) internal returns (bool success) {
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        ContractReceiver receiver = ContractReceiver(_to);
        receiver.tokenFallback(msg.sender, _value, _data);
        Transfer(msg.sender, _to, _value);
        Transfer(msg.sender, _to, _value, _data);
        return true;
    }
}