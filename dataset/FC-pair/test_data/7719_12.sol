contract c7719{
  /**
   * @dev Internal transfer, only can be called by this contract  
   * @param _from is msg.sender The address to transfer from.
   * @param _to The address to transfer to.
   * @param _value The amount to be transferred.
   */
  function _transfer(address _from, address _to, uint _value) internal returns (bool){
      require(_to != address(0)); // Prevent transfer to 0x0 address.
      require(_value <= balances[msg.sender]);  // Check if the sender has enough      
      // SafeMath.sub will throw if there is not enough balance.
      balances[_from] = balances[_from].sub(_value);
      balances[_to] = balances[_to].add(_value);
      emit Transfer(_from, _to, _value);
      return true;
  }
}