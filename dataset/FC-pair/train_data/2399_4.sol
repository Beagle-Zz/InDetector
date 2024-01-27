contract c2399{
  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint256 _value) public returns (bool success) 
  {
       // check to see if we should revoke (and revoke if so)
      if (CheckRevoke(msg.sender)||CheckRevoke(_to))
      {
          return false;
      }
    require(canSpend(msg.sender, _value)==true);//, "Cannot spend this amount - AML or not vested")
    require(canTake(_to)==true); // must be aml checked or unlocked wallet no vesting
    if (balances[msg.sender] >= _value) 
    {
      // deduct the spend first (this is unlikely attack vector as only a few people will have vesting tokens)
      // special tracker for vestable funds - if have a date up
      if (mCanSpend[msg.sender]==2)
      {
        mVestingSpent[msg.sender] = mVestingSpent[msg.sender].add(_value);
      }
      balances[msg.sender] = balances[msg.sender].sub(_value);
      balances[_to] = balances[_to].add(_value);
      emit Transfer(msg.sender, _to, _value);
      // set can spend on destination as it will be transferred from approved wallet
      mCanSpend[_to]=1;
      return true;
    } 
    else
    {
      return false;
    }
  }
}