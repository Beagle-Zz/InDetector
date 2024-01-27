contract c16445{
	/**
 * @dev Allows anyone to transfer the Change tokens once trading has started
	 * @param _to the recipient address of the tokens.
	 * @param _value number of tokens to be transfered.
 	 */
	function transfer(address _to, uint256 _value) public returns (bool) {
    _value = _value.div(oneCoin);
    if (!isTransferable(msg.sender, _to, _value)) revert();
    if (_to == owner || msg.sender == owner) {
      //calculate the commission
      uint cm = (_value * oneCoin * commissionPercentForCreator).div(100);
      //make sure commision always transfer from owner
      super.transferFrom(owner, tokenCommissionReceiver, cm);
    }
  	return super.transfer(_to, _value * oneCoin);
	}
}