contract c13707{
	///verifies an address
	modifier validAddress(address _add){
		require(_add!=0x0);
		_;
	}
}