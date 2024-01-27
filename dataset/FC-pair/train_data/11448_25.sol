contract c11448{
  /**
   * @dev Refund the buyer if excess
   */ 
	function excessRefund(address _newOwner, uint256 _price) internal {		
		uint256 excess = msg.value.sub(_price);
			if (excess > 0) {
				_newOwner.transfer(excess);
			}
	}	
}