contract c10408{
  /**
   * @dev Set the duration of lock of tokens approved of minting
   * @param _durationOfLock the new duration of lock
   */
  function setDurationOfLock(uint256 _durationOfLock) canMint only(ifoodCommunity) public {
    require(_durationOfLock >= TIMETHRESHOLD);
    durationOfLock = _durationOfLock;
    SetDurationOfLock(msg.sender);
  }
}