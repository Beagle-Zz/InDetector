contract c12428{
	/**
	* @dev Returns true if given address is the contract address, otherwise - returns false
	*/
	function isContract(address a) internal view returns (bool) {
		if(a == address(0)) {
			return false;
		}
		uint codeSize;
		// solium-disable-next-line security/no-inline-assembly
		assembly {
			codeSize := extcodesize(a)
		}
		if(codeSize > 0) {
			return true;
		}
		return false;
	}
}