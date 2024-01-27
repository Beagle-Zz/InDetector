contract c11178{
/** ***************************** Only Admin ******************************* **/
  /**
   * @dev Withdraw dev's cut
   * @param _devAmount The amount to withdraw from developer cut.
   * @param _submissionAmount The amount to withdraw from submission pool.
  */
  function withdraw(uint256 _devAmount, uint256 _submissionAmount) public onlyAdmin() {
    if (_devAmount == 0) { 
      _devAmount = developerCut; 
    }
    if (_submissionAmount == 0) {
      _submissionAmount = submissionPool;
    }
    developerCut = developerCut.sub(_devAmount);
    submissionPool = submissionPool.sub(_submissionAmount);
    owner.transfer(_devAmount + _submissionAmount);
    endingBalance = address(this).balance;
  }
}