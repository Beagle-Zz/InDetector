contract c18365{
  /**
   * @dev Determines how ETH is stored/forwarded on purchases. Part of OpenZeppelin
   * internal interface.
   */
  function _forwardFunds() internal {
    if (weiRaised <= priorityCap) {
      priorityWallet.transfer(msg.value);
    } else {
      uint256 weiRaisedBefore = weiRaised.sub(msg.value);
      if (weiRaisedBefore < priorityCap) {
        uint256 transferToPriorityWallet = priorityCap.sub(weiRaisedBefore);
        uint256 transferToWallet = weiRaised.sub(priorityCap);
        priorityWallet.transfer(transferToPriorityWallet);
        wallet.transfer(transferToWallet);
      } else {
        wallet.transfer(msg.value);
      }
    }
  }
}