contract c10410{
	/**
	 * @dev Throws if called by any account other than the owner.
	 */
	modifier onlyOwner()
	{
		require(msg.sender == m_owner);
		_;
	}
}