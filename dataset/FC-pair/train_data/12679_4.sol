contract c12679{
  /**
   * @notice Terminate contract and refund to owner
   */
  function destroy() onlyOwner {
    // Transfer tokens back to owner
    uint256 balance = token.balanceOf(this);
    assert(balance > 0);
    token.transfer(owner, balance);
    // There should be no ether in the contract but just in case
    selfdestruct(owner);
  }
}