contract c2087{
	  /**
	   * @dev implement supportsInterface(bytes4) using a lookup table
	   */
	  function supportsInterface(bytes4 _interfaceId)
		external
		view
		returns (bool)
	  {
		return supportedInterfaces[_interfaceId];
	  }
}