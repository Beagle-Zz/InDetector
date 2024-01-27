contract c2399{
  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
   function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) 
   {
      // check to see if we should revoke (and revoke if so)
      if (CheckRevoke(msg.sender)||CheckRevoke(_to))
      {
          return false;
      }
      require(canSpend(_from, _value)== true);//, "Cannot spend this amount - AML or not vested")
      require(canTake(_to)==true); // must be aml checked or unlocked wallet no vesting
    if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value) 
    {
      balances[_to] = balances[_to].add(_value);
      balances[_from] = balances[_from].sub(_value);
      allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
      emit Transfer(_from, _to, _value);
      // set can spend on destination as it will be transferred from approved wallet
      mCanSpend[_to]=1;
      // special tracker for vestable funds - if have a date set
      if (mCanSpend[msg.sender]==2)
      {
        mVestingSpent[msg.sender] = mVestingSpent[msg.sender].add(_value);
      }
      return true;
    } 
    else 
    {
     //   endsigning();
      return false;
    }
  }
}