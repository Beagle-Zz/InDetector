contract c8363{
   /**
    * @dev transfer token for a specified address if transfer is open
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
	function transfer(address _to, uint256 _value) returns (bool) {
		require(!frozenAccount[msg.sender]);
		return super.transfer(_to, _value);	
	}
}