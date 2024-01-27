contract c10415{
  /**
   * @dev dealer can withdraw the remain ether if distribute exceeds max length
   */
  function withdraw() onlyOwner public {
    uint _balance = address(this).balance;
    owner.transfer(_balance);
    LogWithdraw(owner, _balance);
  }
}