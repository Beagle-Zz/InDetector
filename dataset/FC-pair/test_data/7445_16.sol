contract c7445{
// for testing
  function contractBalanceOf(address _owner) public view returns (uint256) {
    return balances[_owner];
  }
}