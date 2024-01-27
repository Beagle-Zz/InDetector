contract c3763{
    // Perform the inevitable actions which cause release of that which each GROWCHAIN
    // is built to deliver. In EtherGROWCHAINLand there are only GROWCHAINes, so this 
    // allows the transmission of one GROWCHAIN's payload (or partial payload but that
    // is not as much fun) INTO another GROWCHAIN. This causes the GROWCHAINae to change 
    // form such that all may see the glory they each represent. Erections.
    function transferFrom(address _from, address _to, uint256 _amount) returns (bool success) {
        initialize(_from);
        if (balances[_from] >= _amount
            && allowed[_from][msg.sender] >= _amount
            && _amount > 0) {
            initialize(_to);
            if (balances[_to] + _amount > balances[_to]) {
                balances[_from] -= _amount;
                allowed[_from][msg.sender] -= _amount;
                balances[_to] += _amount;
                Transfer(_from, _to, _amount);
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
}