contract c13838{
  /**
   * @dev Check your share of the balance.
   */
  function checkMyBalance() public view returns(uint256) {
    uint256 totalReceived = address(this).balance.add(totalReleased);
    uint256 payment = totalReceived.mul(shares[msg.sender]).div(totalShares).sub(released[msg.sender]);
    return payment;
  }
}