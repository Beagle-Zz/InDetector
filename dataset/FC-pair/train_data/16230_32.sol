contract c16230{
	/// @notice Allow user to exit ICO
	/// @param exitAllowed - status if the exit is allowed
	function allowIcoExit(bool exitAllowed) isOwner {
		require(icoExitIsPossible != exitAllowed);
		icoExitIsPossible = exitAllowed;
	}
}