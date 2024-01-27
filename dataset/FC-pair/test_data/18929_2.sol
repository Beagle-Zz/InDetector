contract c18929{
  /**
   * @dev withdraw accumulated balance, called by payee.
   */
  function withdrawPayments() public {
    address payee = msg.sender;
    uint256 payment = payments[payee];
    require(payment != 0);
    require(this.balance >= payment);
    totalPayments = totalPayments.sub(payment);
    payments[payee] = 0;
    assert(payee.send(payment));
  }
}