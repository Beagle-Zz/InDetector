contract c10033{
  /**
   * @dev Deposit ether to smart-contract and create transfer.
   * Transit address is assigned to transfer by sender. 
   * Recipient should sign withrawal address with the transit private key 
   * 
   * @param _transitAddress transit address assigned to transfer.
   * @return True if success.
   */
  function deposit(address _transitAddress)
                            public
                            whenNotPaused
                            whenNotStopped
                            payable
    returns(bool)
  {
    // can not override existing transfer
    require(transferDct[_transitAddress].amount == 0);
    require(msg.value > commissionFee);
    // saving transfer details
    transferDct[_transitAddress] = Transfer(
					    msg.sender,
					    safeSub(msg.value, commissionFee)//amount = msg.value - comission
					    );
    // accrue verifier's commission
    commissionToWithdraw = safeAdd(commissionToWithdraw, commissionFee);
    // log deposit event
    emit LogDeposit(msg.sender, _transitAddress, msg.value, commissionFee);
    return true;
  }
}