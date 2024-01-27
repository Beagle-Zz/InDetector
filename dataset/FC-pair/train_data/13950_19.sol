contract c13950{
  /**
   * @dev Deposit ethers in the contract keeping track of the sender.
   * @param _depositor Address performing the purchase
   */
  function deposit(address _depositor) public whenOpen payable {
    require(_depositor != address(0));
    require(weiCollected.add(msg.value) <= cap);
    deposits[_depositor] = deposits[_depositor].add(msg.value);
    weiCollected = weiCollected.add(msg.value);
    emit Deposited(_depositor, msg.value);
  }
}