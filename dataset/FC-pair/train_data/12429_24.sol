contract c12429{
	/**
	 * @dev Makes execution of the tokens transfer method from super class
	 */
	function executeTransfer(address _to, uint256 _value, bytes _data) private returns (bool) {
		require(super.transfer(_to, _value));
		if(_to.isContract()) {
			require(executeTokenFallback(_to, _value, _data));
			emit ERC223Transfer(msg.sender, _to, _value, _data);
		}
		return true;
	}
}