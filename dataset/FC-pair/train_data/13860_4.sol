contract c13860{
    // Allocate tokens
    function AllocateToken(address[] a_receiver)
    external
    IsOwner
    AllLock {
        uint receiverLength = a_receiver.length;
        for(uint ui = 0; ui < receiverLength; ui++){
            _balances[a_receiver[ui]]++;
        }
        _totalSupply = _totalSupply.add(receiverLength);
    }
}