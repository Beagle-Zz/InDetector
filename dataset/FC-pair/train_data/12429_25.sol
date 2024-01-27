contract c12429{
	/**
	 * @dev Sets the controller contract address and removes token contract ownership
	 */
	function setController(
		address _controller
	) public onlyOwner {
		// cannot be invoked after initial setting
		require(!isControlled);
		// _controller should be an address of the smart contract
		require(_controller.isContract());
		controller = _controller;
		removeOwnership();
		emit Controlled(controller);
		isControlled = true;
	}
}