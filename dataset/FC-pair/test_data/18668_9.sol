contract c18668{
    /* Internal transfer, only can be called by this contract */
    function _transfer(address _from, address _to, uint _value) internal { 
        require (_to != 0x0);                               // Prevent transfer to 0x0 address. Use burn() instead
        require (balanceOf[_from] >= _value);               // Check if the sender has enough
        require (balanceOf[_to] + _value > balanceOf[_to]); // Check for overflows
        require(!frozenAccount[_from]);                     // Check if sender is frozen
        require(!frozenAccount[_to]);                       // Check if recipient is frozen
        // make sure founders can only withdraw 25% each year after first year    
        if(_from == team){
            bool flag = _limitTeamWithdraw(_value, teamTotal, teamWithdrawed, deployedTime, now);
            if(!flag)
                revert();
        }          
        balanceOf[_from] = balanceOf[_from].sub(_value);                  // Subtract from the sender
        balanceOf[_to] = balanceOf[_to].add(_value);                      // Add the same to the recipient
        if(_from == team) teamWithdrawed = teamWithdrawed.add(_value);    // record how many team withdrawed
        emit Transfer(_from, _to, _value);
    }
}