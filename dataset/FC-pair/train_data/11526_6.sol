contract c11526{
  /**
   * @dev Claim back locked amount after expiration time
   * @dev Cannot be claimed if expiration == 0 or expiration == 1
   * @notice Only works after lock expired
   * @param _arbitrator Authorized lock address
   * @param _transactionId transactionId ID from App/user
   */
  function claim(
      address _arbitrator,
      uint256 _transactionId
  ) public {
    Lock memory lock = escrows[_arbitrator][_transactionId];
    require(lock.sender == msg.sender);
    require(lock.paid);
    require(lock.expiration < block.timestamp);
    require(lock.expiration != 0);
    require(lock.expiration != 1);
    delete escrows[_arbitrator][_transactionId];
    token.transfer(msg.sender, lock.value.add(lock.fee));
    Released(
      _arbitrator,
      msg.sender,
      _transactionId
    );
  }
}