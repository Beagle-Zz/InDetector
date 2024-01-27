contract c11248{
  /**
   * @dev Distribute ether to `holder`s according to ratio.
   * Remaining ether is transfered to `wallet` from the close
   * function of RefundVault contract.
   */
  function distribute() internal {
    require(!distributed, "Already distributed");
    uint256 balance = this.balance;
    require(balance > 0, "No ether to distribute");
    distributed = true;
    for (uint8 i = 0; i < holders.length; i++) {
      uint256 holderAmount = balance.mul(uint256(holders[i].ratio)).div(coeff);
      holders[i].addr.transfer(holderAmount);
    }
    emit Distributed(); // A single log to reduce gas
  }
}