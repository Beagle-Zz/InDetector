contract c18775{
  // release time of freezed account
  function checkReleaseAt(address _owner) public constant returns (uint256 date) {
    return releaseTime[_owner];
  }
}