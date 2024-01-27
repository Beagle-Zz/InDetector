contract c4776{
   /**
    * @dev Increase the amount of tokens that an owner allowed to a spender
    */
   function increaseApproval(address _spender, uint256 _addedValue) public returns (bool success) 
   {
      require(!stopped);
      allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);
      emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
      return true;
   }
}