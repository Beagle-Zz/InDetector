contract c16209{
  /**
  * @dev transfer token for a specified address (BasicToken transfer method)
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
	return transferFunction(msg.sender, _to, _value);
  }
}