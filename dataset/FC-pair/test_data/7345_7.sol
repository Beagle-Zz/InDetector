contract c7345{
  // Ethereum Token
  function burnFrom( address from, uint256 value ) public
  returns (bool success)
  {
    require( balances_[from] >= value );
    require( value <= allowances_[from][msg.sender] );
    balances_[from] -= value;
    allowances_[from][msg.sender] -= value;
    totalSupply -= value;
    emit Burn( from, value );
    return true;
  }
}