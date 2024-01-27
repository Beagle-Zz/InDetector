contract c2087{
	  /**
	   * @dev Returns all of the tokens that the user owns
	   * @return An array of token indices
	   */
	  function myTokens()
		external
		view
		returns (
		  uint256[]
		)
	  {
		return ownedTokens[msg.sender];
	  }
}