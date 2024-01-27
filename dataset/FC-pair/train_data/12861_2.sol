contract c12861{
    /* Transfers tokens from your address to other */
    function transfer(address _to, uint256 _value) 
        public 
        returns (bool success) 
    {
        require (balances[msg.sender] >= _value);           // Throw if sender has insufficient balance
        require (balances[_to] + _value >= balances[_to]);  // Throw if owerflow detected
        balances[msg.sender] -= _value;                     // Deduct senders balance
        balances[_to] += _value;                            // Add recivers blaance
        emit Transfer(msg.sender, _to, _value);             // Raise Transfer event
        return true;
    }
}