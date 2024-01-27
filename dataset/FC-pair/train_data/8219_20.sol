contract c8219{
  /**
  * @dev Finish token issuance
  * @return True if success
  */
  function finishIssuance() public onlyOwner returns (bool) {
    issuanceFinished = true;
    emit IssuanceFinished();
    return true;
  }
}