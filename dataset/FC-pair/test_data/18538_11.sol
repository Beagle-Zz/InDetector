contract c18538{
    // Process a transfer internally.
    function xfer(address _from, address _to, uint _amount)
        internal
        returns (bool)
    {
        require(_amount <= balances[_from]);
        emit Transfer(_from, _to, _amount);
        // avoid wasting gas on 0 token transfers
        if(_amount == 0) return true;
        balances[_from] = balances[_from].sub(_amount);
        balances[_to]   = balances[_to].add(_amount);
        return true;
    }
}