contract c2626{
  /**
  * @dev Pay for order
  *
  */ 
  function payOrder(uint256 _orderId, uint256 _amount, uint256 _burnAmount) external whenNotPaused {
  	require(balances[msg.sender] >= _amount);
  	/// @dev _burnAmount must be less then _amount, the code can be executed to the next line.
  	uint256 fee = _amount.sub(_burnAmount);
  	if (fee > 0) {
  		transfer(cooAddress, fee);
  	}
  	burn(_burnAmount);
  	emit Pay(msg.sender, _orderId, _amount, _burnAmount);
  }
}