contract c13860{
    // Burn tokens
    function BurnToken(address[] a_receiver)
    external
    IsOwner
    AllLock {
        uint receiverLength = a_receiver.length;
        uint excess = 0;
        for(uint ui = 0; ui < receiverLength; ui++){
            uint balance = _balances[a_receiver[ui]];
            if(2 <= balance)
            {
                excess = balance - 1;
                _balances[a_receiver[ui]] = _balances[a_receiver[ui]].sub(excess);
                _totalSupply = _totalSupply.sub(excess);
            }
        }
    }
}