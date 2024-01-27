contract c13723{
    // Transfer the balance from owner's account to another account
     function transfer(address _to, uint256 _amount) public returns (bool success) {
         if(icoRunningStatus && msg.sender == owner)
         {
            require(balances[owner] >= _amount && _amount >= 0 && balances[_to] + _amount > balances[_to]);
            balances[owner] = (balances[owner]).sub(_amount);
            balances[_to] = (balances[_to]).add(_amount);
            Transfer(owner, _to, _amount);
            return true;
         }
         else if(!icoRunningStatus)
         {
            require(balances[msg.sender] >= _amount && _amount >= 0 && balances[_to] + _amount > balances[_to]);
            balances[msg.sender] = (balances[msg.sender]).sub(_amount);
            balances[_to] = (balances[_to]).add(_amount);
            Transfer(msg.sender, _to, _amount);
            return true;
         } 
         else 
         revert();
     }
}