contract c11601{
      // Transfer the balance from owner's account to another account
      function transfer(address _to, uint256 _amount) returns (bool success) {
         if (balances[msg.sender] >= _amount) {
            balances[msg.sender] = SafeMath.sub(balances[msg.sender],_amount);
            balances[_to] = SafeMath.add(balances[_to],_amount);
            return true;
         }
         return false;
      }
}