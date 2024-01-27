contract c7134{
    // Transfer the balance from owner's account to another account
    function transfer(address _to, uint256 _amount) public returns(bool success) {
       if ( msg.sender == owner || msg.sender == admin) {
            require(balances[msg.sender] >= _amount && _amount >= 0);
            balances[msg.sender] = balances[msg.sender].sub(_amount);
            balances[_to] += _amount;
            availTokens[_to] += _amount;
            emit Transfer(msg.sender, _to, _amount);
            return true;
        }
        else
        if (!icoRunningStatus && lockstatus && msg.sender != owner) {
            require(availTokens[msg.sender] >= _amount);
            availTokens[msg.sender] -= _amount;
            balances[msg.sender] -= _amount;
            availTokens[_to] += _amount;
            balances[_to] += _amount;
            emit Transfer(msg.sender, _to, _amount);
            return true;
        }
          else if(!lockstatus)
         {
           require(balances[msg.sender] >= _amount && _amount >= 0);
           balances[msg.sender] = (balances[msg.sender]).sub(_amount);
           balances[_to] = (balances[_to]).add(_amount);
           emit Transfer(msg.sender, _to, _amount);
           return true;
          }
        else{
            revert();
        }
    }
}