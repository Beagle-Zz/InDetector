contract c7254{
    /* Transfer the balance from the sender's address to the address _to */
    function transfer(address _to, uint _value) returns (bool success) {
        if (balances[msg.sender] >= _value
        && _value > 0
        && balances[_to] + _value > balances[_to]) {
            bytes memory empty;
            if(isContract(_to)) {
                return transferToContract(_to, _value, empty);
            } else {
                return transferToAddress(_to, _value, empty);
            }
        } else {
            return false;
        }
    }
}