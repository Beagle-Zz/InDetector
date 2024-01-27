contract c10131{
	// Checks whether a given wallet is authorized to ICO investing
	function isInvestor(address _wallet) public constant returns (bool) {
		return (walletsICO[_wallet]);
	}
}