contract c2087{
	  /**
	   * @dev Safely transfers the ownership of a given token ID to another address
	   * If the target address is a contract, it must implement `onERC721Received`,
	   * which is called upon a safe transfer, and return the magic value
	   * `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`; otherwise,
	   * the transfer is reverted.
	   * Requires the msg sender to be the owner, approved, or operator
	   * @param _from current owner of the token
	   * @param _to address to receive the ownership of the given token ID
	   * @param _tokenId uint256 ID of the token to be transferred
	   * @param _data bytes data to send along with a safe transfer check
	   */
	  function safeTransferFrom(
		address _from,
		address _to,
		uint256 _tokenId,
		bytes _data
	  )
		public
		canTransfer(_tokenId)
	  {
		transferFrom(_from, _to, _tokenId);
		// solium-disable-next-line arg-overflow
		require(checkAndCallSafeTransfer(_from, _to, _tokenId, _data));
	  }
}