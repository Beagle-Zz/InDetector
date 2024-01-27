contract c18911{
	/// @dev receive token from coinContract
	function tokenFallback(address _from, uint _value, bytes ) public {
		require(msg.sender == address(coinContract));
		emit EvtRecharge(_from, _value);
	}
}