contract c8957{
    /// @dev Internal transfer, only can be called by this contract
    /// @param _from The address of the sender
    /// @param _to The address of the recipient
    /// @param _value The amount to send
    function _transfer(address _from, address _to, uint _value) internal {
        // Prevent transfer to 0x0 address
        require(_to != 0x0);
        // Check if the sender has enough
        require(balances[_from] >= _value);
        // Check for overflows
        require(balances[_to].add(_value) > balances[_to]);
        uint256 freezeStartTime;
        uint256 freezePeriod;
        uint256 freezeTotal;
        uint256 freezeDeadline;
        // Get freeze information of sender
        (freezeStartTime,freezePeriod,freezeTotal,freezeDeadline) = getFreezeInfo(_from);
        // The free amount of _from
        uint256 freeTotalFrom = balances[_from].sub(freezeTotal);
        //Check if it is a freeze account
        //Check if in Lock-up Period
        //Check if the transfer amount > free amount
        require(freezeStartTime == 0 || freezeDeadline < now || freeTotalFrom >= _value); 
        // Save this for an assertion in the future
        uint previousBalances = balances[_from].add(balances[_to]);
        // Subtract from the sender
        balances[_from] = balances[_from].sub(_value);
        // Add the same to the recipient
        balances[_to] = balances[_to].add(_value);
        // Notify client the transfer
        emit Transfer(_from, _to, _value);
        // Asserting that the total balances before and after the transaction should be the same
        assert(balances[_from].add(balances[_to]) == previousBalances);
    }
}