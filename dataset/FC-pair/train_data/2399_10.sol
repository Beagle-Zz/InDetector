contract c2399{
  /**
   * approve should be called when allowed[_spender] == 0. To increment
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * From MonolithDAO Token.sol
   */
  function increaseApproval (address _spender, uint _addedValue) public returns (bool success) 
  {
      // check to see if we should revoke (and revoke if so)
      if (CheckRevoke(msg.sender))
      {
          return false;
      }
      require(canSpend(msg.sender, _addedValue)==true);//, "Cannot spend this amount - AML or not vested");
    allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }
}