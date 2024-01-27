contract c13838{
  /**
   * @dev Claim your share of the balance.
   */
  function claim() public {
    address payee = msg.sender;
    require(shares[payee] > 0);
    uint256 totalReceived = address(this).balance.add(totalReleased);
    uint256 payment = totalReceived.mul(shares[payee]).div(totalShares).sub(released[payee]);
    require(payment != 0);
    require(address(this).balance >= payment);
    released[payee] = released[payee].add(payment);
    totalReleased = totalReleased.add(payment);
    payee.transfer(payment);
  }
}