contract c10409{
	/**
	 * @dev Allows the current owner to transfer control of the contract to a newOwner.
	 * @param _newOwner The address to transfer ownership to.
	 */
	function setImmutableOwnership(address _newOwner) public onlyOwner
	{
		require(m_changeable);
		require(_newOwner != address(0));
		emit OwnershipTransferred(m_owner, _newOwner);
		m_owner      = _newOwner;
		m_changeable = false;
	}
}