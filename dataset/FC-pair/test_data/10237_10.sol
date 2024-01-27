contract c10237{
  /**
   * @dev get bet result information
   *
   *  uint8 public winChoice;
   *  uint8 public confirmations = 0;
   *  uint8 public neededConfirmations = 1;
   *  uint16 public leftPts;
   *  uint16 public rightPts;
   *  bool public isBetClosed = false;
   */
  function getBetResult() public view returns (uint8, uint8, uint8, uint16, uint16, bool) {
    return (winChoice, confirmations, neededConfirmations, leftPts, rightPts, isBetClosed);
  }
}