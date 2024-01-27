contract c16445{
	/**
	 * @dev Allows anyone to transfer the Change tokens once trading has started
	 * @param _from address The address which you want to send tokens from
	 * @param _to address The address which you want to transfer to
	 * @param _value uint the amout of tokens to be transfered
 	*/
	function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    _value = _value.div(oneCoin);
    if (!isTransferable(_from, _to, _value)) revert();
  	if (_from == owner || _to == owner) {
      //calculate the commission
      uint cm = (_value  * oneCoin * commissionPercentForCreator).div(100);
      //make sure commision always transfer from owner
      super.transferFrom(owner, tokenCommissionReceiver, cm);
    }
    return super.transferFrom(_from, _to, _value * oneCoin);
	}
}