contract c8984{
	/// @notice `freeze? Prevent | Allow` `target` from sending & receiving tokens
    /// @param target Address to be frozen
    /// @param freeze either to freeze it or not
	function freezeAccount(address target, bool freeze) onlyOwner public {
	    if (logic.freezeAccount(target,  freeze) == true) {
	        emit FrozenFunds(target, freeze);
	    }
	}
}