contract c2247{
  /**
   * @dev Enables anyone with a masternode to earn referral fees on P3D reinvestments.
   */
  function reinvest() external {
    // reinvest must be enabled
    require(disabled == false);
    // setup p3d
    P3D p3d = P3D(0xB3775fB83F7D12A36E0475aBdD1FCA35c091efBe);
    // withdraw dividends
    p3d.withdraw();
    // reinvest with a referral fee for sender
    p3d.buy.value(address(this).balance)(msg.sender);
  }
}