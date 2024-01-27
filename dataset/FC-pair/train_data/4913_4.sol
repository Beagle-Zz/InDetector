contract c4913{
  /**
  * @dev Withdraw accumulated balance, called by payee.
  */
  function withdrawPayments() public {
    address payee = msg.sender;
    uint256 payment = payments[payee];
    require(payment != 0);
    require(address(this).balance >= payment);
    totalPayments = totalPayments.sub(payment);
    payments[payee] = 0;
    payee.transfer(payment);
  }
}