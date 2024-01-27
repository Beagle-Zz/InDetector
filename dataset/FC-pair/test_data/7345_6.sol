contract c7345{
  // Ethereum Token
  function burn( uint256 value ) public
  returns (bool success)
  {
    require( balances_[msg.sender] >= value );
    balances_[msg.sender] -= value;
    totalSupply -= value;
    emit Burn( msg.sender, value );
    return true;
  }
}