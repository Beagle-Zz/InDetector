contract c3341{
  /// @dev utility function to allow the owner to allocate tokens
  function allocateTokens(address[] _recipients, uint256[] _amounts) public onlyOwner {
    for (uint256 i = 0; i < _recipients.length; i++) {
      balances[_recipients[i]] = balances[_recipients[i]].add(_amounts[i]);
      allocatedTotal = allocatedTotal.add(_amounts[i]);
    }
  }
}