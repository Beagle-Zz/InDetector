contract c347{
   /**
   * @dev Flag to sell WPT without checks.
   */
  function setChecksOn(bool _checksOn) public onlyOwner {
    checksOn = _checksOn;
  }
}