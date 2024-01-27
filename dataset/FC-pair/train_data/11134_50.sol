contract c11134{
  /**
   * @dev Allow withdraw funds from smart contract
   */
  function withdraw() public onlyOwner {
    uint256 returnAmount = this.balance;
    wallet.transfer(returnAmount);
    emit EtherWithdrawn(wallet, returnAmount);
  }
}