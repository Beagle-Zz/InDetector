contract c13950{
  /**
   * @dev Allows a depositor to withdraw his contribution if the reservation was canceled.
   */
  function withdraw() public whenCanceled {
    uint256 depositAmount = deposits[msg.sender];
    require(depositAmount != 0);
    deposits[msg.sender] = 0;
    weiCollected = weiCollected.sub(depositAmount);
    msg.sender.transfer(depositAmount);
    emit Withdrawn(msg.sender, depositAmount);
  }
}