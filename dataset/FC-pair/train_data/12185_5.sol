contract c12185{
	// withdraw funds to contract creator
	function withdraw() public onlyContractOwner {
		contractOwner.transfer(address(this).balance);
	}
}