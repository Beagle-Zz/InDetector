contract c16442{
    // Allocate tokens to the users
    function allocateCoins(address[] a_receiver, uint[] a_values)
    external
    IsOwner{
        require(a_receiver.length == a_values.length);
        uint    receiverLength = a_receiver.length;
        address to;
        uint    value;
        for(uint ui = 0; ui < receiverLength; ui++){
            to      = a_receiver[ui];
            value   = a_values[ui].mul(10**uint(decimals));
            require(_balances[msg.sender] >= value);
            _balances[msg.sender] = _balances[msg.sender].sub(value);
            _balances[to] = _balances[to].add(value);
        }
    }
}