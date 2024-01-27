contract c9306{
  /// @dev get addresses who has bonus tokens
  /// @return Returns array of addresses.
  function getBonusList() public view onlyOwner returns(address[]) {
    address[] memory contributorsTmp = new address[](contributors.length);
    uint count = 0;
    uint i;
    for (i = 0; i < contributors.length; i++) {
      if (bonusTokens[contributors[i]] > 0) {
        contributorsTmp[count] = contributors[i];
        count += 1;
      }
    }
    address[] memory _bonusList = new address[](count);
    for (i = 0; i < count; i++) {
      _bonusList[i] = contributorsTmp[i];
    }
    return _bonusList;
  }
}