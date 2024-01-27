contract c16080{
	/// @notice Functions with this modifier can only be executed by the owner
	modifier isOwner {
		assert(msg.sender == owner || msg.sender == supervisor);
		_;
	}
}