contract c12185{
	// get contract balance
	function getBalance() public view returns(uint256){
		return address(this).balance;
	}
}