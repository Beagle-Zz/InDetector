contract c3687{
  /**
   * @dev Sets the date that the tokens becomes transferable
   * @param date The timestamp of the date
   * @return A boolean that indicates if the operation was successful.
   */
  function setTransferEnablingDate(uint256 date) public onlyOwner returns(bool success) {
    transferEnablingDate = date;
    return true;
  }
}