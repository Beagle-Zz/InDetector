contract c13660{
  /// @dev Get current balance of the contract
  function getBalance()
    constant
    public
    returns(uint)
  {
    return we_token.balanceOf(this);
  }
}