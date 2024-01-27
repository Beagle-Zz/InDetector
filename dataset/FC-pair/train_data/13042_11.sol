contract c13042{
    // Standard ERC20 transfer plus state check and token swap logic.
    //
    // We recommend sending using a method that calculates gas for you.
    //
    // Here are some estimates (not guaranteed to be accurate):
    // It usually costs around 37k gas.  It cost more if the state changes.
    // State change means around 55k - 65k gas.
    // Swapping tokens for ether costs around 46k gas. (around 93k for the first account to swap)
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value);
         // Normal transfers check if time is expired.  
        _updateState();
        // Check if sending in for swap.
        if (_to == address(this)) 
        {
            // throw if they can't swap yet.
            require(swap);
            if (payRate == 0)
            {
                calulateRate(); // Gas to calc the rate paid by first unlucky soul.
            }
            uint256 amount = _value * payRate;
            // Adjust for decimals
            amount /= 1 ether;
            // Burn tokens.
            balances[msg.sender] -= _value;
             _totalSupply -= _value;
            Transfer(msg.sender, _to, _value);
            //send ether
            msg.sender.transfer(amount);
        } else
        {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            Transfer(msg.sender, _to, _value);
        }
        return true;
    }
}