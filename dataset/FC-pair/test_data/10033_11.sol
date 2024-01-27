contract c10033{
  /**
   * @dev Get transfer details.
   * @param _transitAddress transit address assigned to transfer
   * @return Transfer details (id, sender, amount)
   */
  function getTransfer(address _transitAddress)
            public
            constant
    returns (
	     address id,
	     address from, // transfer sender
	     uint amount) // in wei
  {
    Transfer memory transfer = transferDct[_transitAddress];
    return (
	    _transitAddress,
	    transfer.from,
	        transfer.amount
	    );
  }
}