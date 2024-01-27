contract c16230{
	/// @notice Transfer the ownership to another account
	/// @param newOwner - address who get the ownership
	function transferOwnership(address newOwner) isOwner {
		assert(newOwner != address(0));
		address oldOwner = owner;
		owner = newOwner;
		ownerChanged(msg.sender, oldOwner, newOwner);
		allowed[this][oldOwner] = 0;
		allowed[this][newOwner] = tokenBalanceOf[this];
	}
}