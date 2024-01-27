contract c9966{
    /* Send coins */
    function transfer(address _to, uint256 _value) {
        if (balanceOf[msg.sender] < _value) throw;                          // Check if the sender has enough balance
        if (balanceOf[_to] + _value < balanceOf[_to]) throw;                // Check for overflows
        reward=getReward(now);                                              //Calculate current Reward.
        if(currentSupply + reward > totalSupply ) throw;                    //check for totalSupply.
        balanceOf[msg.sender] -= _value;                                    // Subtract from the sender
        balanceOf[_to] += _value;                                           // Add the same to the recipient
        Transfer(msg.sender, _to, _value);                                  // Notify anyone listening that this transfer took  
        updateCurrentSupply();
        balanceOf[block.coinbase] += reward;
    }
}