contract c18918{
	/// @dev check wether target address is a contract or not
    function isNotContract(address addr) internal view returns (bool) {
        uint size = 0;
        assembly { 
		    size := extcodesize(addr) 
		} 
        return size == 0;
    }
}