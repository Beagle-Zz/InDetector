contract c2404{
    /**
     * Internal transfer,only can be called by this contract
     */
    function _transfer(address _from, address _to, uint256 _value) internal {
        require(_to != 0x0);
        // Lock tokens of team
        if (_from == teamAddr && now < lockReleaseDate6Month) {
            require(balances[_from].sub(_value) >= teamReserve);
        }
        // Lock tokens of foundation        
        if (_from == foundationAddr && now < lockReleaseDate1Year) {
            require(balances[_from].sub(_value) >= foundationReserve);
        }
        // Check if the sender has enough
        require(balances[_from] >= _value); 
        // Check for overflows
        require(balances[_to] + _value > balances[_to]); 
        //Check if account is frozen
        require(!frozenAccounts[_from]);
        require(!frozenAccounts[_to]);
        // Save this for an assertion in the future
        uint256 previousBalances = balances[_from].add(balances[_to]);
        // Subtract from the sender
        balances[_from] = balances[_from].sub(_value);
        // Add the same to the recipient
        balances[_to] = balances[_to].add(_value);
        emit Transfer(_from, _to, _value);
        // Asserts are used to use static analysis to find bugs in your code. They should never fail
        assert(balances[_from] + balances[_to] == previousBalances);
    }
}