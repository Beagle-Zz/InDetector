contract c13676{
  /// @dev Get current balance of the contract
  function getBalance()
    constant
    public
    returns(uint)
  {
    return we_test_token.balanceOf(this);
  }
}