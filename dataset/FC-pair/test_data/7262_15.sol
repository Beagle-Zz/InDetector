contract c7262{
   /**
   * @dev Decrease the amount of tokens that an owner allowed to a spender
   */
   function decreaseApproval(address _spender, uint256 _subtractedValue) public returns (bool success) 
   {
      uint256 oldValue = allowed[msg.sender][_spender];
      if (_subtractedValue > oldValue) 
      {
         allowed[msg.sender][_spender] = 0;
      }
      else 
      {
         allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
      }
      emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
      return true;
   }
}