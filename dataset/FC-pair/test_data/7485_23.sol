contract c7485{
  /// @dev Function to call from other contracts to ensure that this is the proper contract
  function isOMITokenContract()
    public 
    pure 
    returns(bool)
  { 
    return true; 
  }
}