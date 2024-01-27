contract c10131{
	/**
	 * @notice The owner must specify which ICO contract is allowed call for refunds
	 */
	function setMyICOContract(address _SCICO) public onlyOwner {
		require(address(this).balance == 0);
		addressSCICO = _SCICO;
	}
}