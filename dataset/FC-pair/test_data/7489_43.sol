contract c7489{
  /// @dev Sets the token allowance provider address
  /// @param _allowanceProvider The address of the token allowance provider
  function setAllowanceAddress (address _allowanceProvider)
    public
    onlyOwner
    returns (bool)
  {
    allowanceProvider = _allowanceProvider;
    return true;
  }
}