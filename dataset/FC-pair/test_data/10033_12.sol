contract c10033{
  /**
   * @dev Cancel transfer and get sent ether back. Only transfer sender can
   * cancel transfer.
   * @param _transitAddress transit address assigned to transfer
   * @return True if success.
   */
  function cancelTransfer(address _transitAddress) public returns (bool success) {
    Transfer memory transferOrder = transferDct[_transitAddress];
    // only sender can cancel transfer;
    require(msg.sender == transferOrder.from);
    delete transferDct[_transitAddress];
    // transfer ether to recipient's address
    msg.sender.transfer(transferOrder.amount);
    // log cancel event
    emit LogCancel(msg.sender, _transitAddress);
    return true;
  }
}