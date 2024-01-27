contract c7489{
  /// @dev Function to call from other contracts to ensure that this is the proper contract
  function isOMICrowdsaleContract()
    public 
    pure 
    returns(bool)
  { 
    return true; 
  }
}