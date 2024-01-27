contract c11711{
  /**
   * @dev Transfer a locked amount
   * @notice Only authorized address
   * @notice Exchange rate has 18 decimal places
   * @param _sender Address with locked amount
   * @param _recipient Address to send funds to
   * @param _transactionId App/user internal associated ID
   * @param _exchangeRate Rate to be reported to the blockchain
   */
  function release(
      address _sender,
      address _recipient,
      uint256 _transactionId,
      uint256 _exchangeRate
  ) public {
    Lock memory lock = escrows[msg.sender][_transactionId];
    require(lock.expiration != 1);
    require(lock.sender == _sender);
    require(lock.recipient == _recipient || lock.sender == _recipient);
    require(lock.paid);
    if (lock.fee > 0 && lock.recipient == _recipient) {
      token.transfer(_recipient, lock.value);
      token.transfer(msg.sender, lock.fee);
    } else {
      token.transfer(_recipient, lock.value.add(lock.fee));
    }
    delete escrows[msg.sender][_transactionId];
    token.issueExchangeRate(
      _sender,
      _recipient,
      msg.sender,
      lock.value,
      _transactionId,
      _exchangeRate
    );
    Released(msg.sender, _recipient, _transactionId);
  }
}