contract c18732{
    /**
    * Internal function to transfer tokens
    *
    * @param _from account to withdraw tokens
    * @param _to account to receive tokens
    * @param _value quantity of tokens to transfer
    */
    function _transfer(address _from, address _to, uint _value) internal {
        require (_to != 0x0);                                  // Prevent transfer to 0x0 address. Use burn() instead
        require (balanceOf[_from] >= _value);                  // Check if the sender has enough
        require (balanceOf[_to].add(_value) > balanceOf[_to]); // Check for overflows
        // check if the sender is under a freezing period
        if(_isTransferAllowed(_from)){ 
            _setFreezingPeriod(_from, false, 0);
        }
        // check if the recipient is under a freezing period
        if(_isTransferAllowed(_to)){
            _setFreezingPeriod(_to, false, 0);
        }
        require(!frozenAccount[_from]);     // Check if sender is frozen
        require(!frozenAccount[_to]);       // Check if recipient is frozen                
        balanceOf[_from] = balanceOf[_from].sub(_value);    // Subtract from the sender
        balanceOf[_to] = balanceOf[_to].add(_value);        // Add the same to the recipient
        emit Transfer(_from, _to, _value);
    }
}