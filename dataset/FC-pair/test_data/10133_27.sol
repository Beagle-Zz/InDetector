contract c10133{
	/**
	 * @notice The owner can specify which ICO contract is allowed to transfer tokens while timelock is on
	 */
	function setMyICOContract(address _SCICO) public onlyOwner {
		addressSCICO = _SCICO;
	}
}