contract c7445{
// for testing
  function tokenBalanceOf(address _owner) public view returns (uint256) {
    return token.balanceOf(_owner);
  }
}